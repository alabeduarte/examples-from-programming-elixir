#  ➤ Exercise: StringsAndBinaries-4
# (Hard) Write a function that takes a single-quoted string of the form number
# [+-*/] number and returns the result of the calculation. The individual numbers
# do not have leading plus or minus signs.
#   calculate('123 + 27') # => 150

defmodule SingleQuotedString do
  def calculate(expression) do
    [operand1, operator, operand2] = to_string(expression) |> String.split()
    _calculate(operator, String.to_integer(operand1), String.to_integer(operand2))
  end

  defp _calculate("+", operand1, operand2), do: operand1 + operand2
  defp _calculate("-", operand1, operand2), do: operand1 - operand2
  defp _calculate("*", operand1, operand2), do: operand1 * operand2
  defp _calculate("/", operand1, operand2), do: operand1 / operand2
end

IO.inspect(SingleQuotedString.calculate('123 + 27'))
IO.inspect(SingleQuotedString.calculate('123 - 27'))
IO.inspect(SingleQuotedString.calculate('123 * 27'))
IO.inspect(SingleQuotedString.calculate('123 / 27'))
