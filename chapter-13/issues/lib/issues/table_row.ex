defmodule Issues.TableRow do
  @doc """
  Return a binary (string) version of our parameter.
  ## Examples
  iex> Issues.TableRow.printable("a")
  "a"
  iex> Issues.TableRow.printable(99)
  "99"
  """
  def printable(str) when is_binary(str), do: str
  def printable(str), do: to_string(str)
end
