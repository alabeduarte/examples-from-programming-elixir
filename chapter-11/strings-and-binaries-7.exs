# ➤ Exercise: StringsAndBinaries-7
# Chapter 10, exercise #8 had an exercise about calculating sales tax. We now
# have the sales information in a file of comma-separated id, ship_to, and
# amount values. The file looks like this:
#
#    id,ship_to,net_amount
#    123,:NC,100.00
#    124,:OK,35.50
#    125,:TX,24.00
#    126,:TX,44.80
#    127,:NC,25.00
#    128,:MA,10.00
#    129,:CA,102.00
#    120,:NC,50.00
#
# Write a function that reads and parses this file and then passes the result
# to the sales_tax function. Remember that the data should be formatted into a
# keyword list, and that the fields need to be the correct types (so the id
# field is an integer, and so on). You’ll need the library functions File.open,
# IO.read(file, :line), and IO.stream(file).

defmodule Orders.FileStream do
  def stream(file_path), do: file_path |> File.stream!()
end

defmodule Orders.Parser do
  def parse(stream) do
    stream
    |> Stream.drop(1)
    |> Stream.map(&_without_breaking_line(&1))
    |> Stream.map(&_splitted_by_comma(&1))
    |> Stream.map(&_order(&1))
    |> Enum.to_list()
  end

  defp _without_breaking_line(content) do
    String.replace_trailing(content, "\n", "")
  end

  defp _splitted_by_comma(content), do: String.split(content, ",")

  defp _order([id, ship_to, net_amount]) do
    [
      id: String.to_integer(id),
      ship_to: String.to_atom(String.replace_prefix(ship_to, ":", "")),
      net_amount: String.to_float(net_amount)
    ]
  end
end

defmodule Orders do
  @tax_rates [NC: 0.075, TX: 0.08]

  def sales_tax(orders) do
    for order <- orders,
        into: [],
        do:
          order ++
            [
              total_amount: order[:net_amount] + (@tax_rates |> Keyword.get(order[:ship_to], 0))
            ]
  end
end

file_path = "#{File.cwd!()}/chapter-11/orders.txt"

sales_tax =
  Orders.FileStream.stream(file_path)
  |> Orders.Parser.parse()
  |> Orders.sales_tax()

IO.inspect(sales_tax)
