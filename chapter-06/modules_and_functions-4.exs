# ➤ Exercise: ModulesAndFunctions-4
# Implement and run a function sum(n) that uses recursion to calculate the sum
# of the integers from 1 to n. You’ll need to write this function inside a
# module in a separate file. Then load up iex, compile that file, and try your
# function.

defmodule Sum do
  def of(1), do: 1
  def of(n), do: n + of(n - 1)
end

IO.inspect(Sum.of(5))
