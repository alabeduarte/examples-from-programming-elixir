# ➤ Exercise: StringsAndBinaries-5
# Write a function that takes a list of double-quoted strings and prints each
# on a separate line, centered in a column that has the width of the longest
# string. Make sure it works with UTF characters.
# iex> center(["cat", "zebra", "elephant"]) i
#      cat
#     zebra
#    elephant

defmodule StringList do
  def center(list) do
    sorted_list = list |> Enum.sort(&(String.length(&1) >= String.length(&2)))
    shorter_string = sorted_list |> List.last()

    sorted_list
    |> Enum.with_index()
    |> Enum.map(fn {str, index} -> to_column(str, index, shorter_string) end)
    |> Enum.reverse()
    |> to_string
  end

  defp to_column(str, index, shorter_string) do
    times = String.length(shorter_string) + index
    spacing = String.duplicate(" ", times)

    spacing <> str <> spacing <> "\n"
  end
end

IO.puts(StringList.center(["cat", "zebra", "elephant"]))
IO.puts(StringList.center(["aaa", "bbbbb", "c", "ddddddd"]))
