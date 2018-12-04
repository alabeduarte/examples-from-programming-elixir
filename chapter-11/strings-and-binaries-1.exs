# ➤ Exercise: StringsAndBinaries-1
# Write a function that returns true if a single-quoted string contains only
# printable ASCII characters (space through tilde).

defmodule SingleQuotedString do
  def printable?([head | tail]), do: _printable?(head, tail)

  defp _printable?(c, []) when c in 32..127, do: true

  defp _printable?(c, [head | tail]) when c in 32..127 do
    _printable?(head, tail)
  end

  defp _printable?(_, _), do: false
end

IO.inspect(SingleQuotedString.printable?('abc'))
IO.inspect(SingleQuotedString.printable?([32, 127]))
IO.inspect(SingleQuotedString.printable?([32, 33, 127]))
IO.inspect(SingleQuotedString.printable?([32, 33, 127, 128]))
IO.inspect(SingleQuotedString.printable?([31]))
IO.inspect(SingleQuotedString.printable?([128]))
