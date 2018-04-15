# ➤ Exercise: ModulesAndFunctions-1
# Extend the Times module with a triple function that multiplies its parameter by
# three.
#
# ➤ Exercise: ModulesAndFunctions-2
# Run the result in iex. Use both techniques to compile the file.

defmodule Times do
  def double(n), do: n * 2

  def triple(n), do: n * 3
end

IO.inspect(Times.triple(3))
