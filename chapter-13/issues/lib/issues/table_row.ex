defmodule Issues.TableRow do
  def printable(str) when is_binary(str), do: str
  def printable(str), do: to_string(str)
end
