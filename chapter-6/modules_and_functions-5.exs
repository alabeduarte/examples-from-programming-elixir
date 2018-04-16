# ➤ Exercise: ModulesAndFunctions-5
# Write a function gcd(x,y) that finds the greatest common divisor between two
# nonnegative integers. Algebraically, gcd(x,y) is x if y is zero; it’s
# gcd(y, rem(x,y)) otherwise.

defmodule GreatestCommonDivisor do
  def find(x, 0), do: x
  def find(x, y), do: find(y, rem(x, y))
end

IO.inspect(GreatestCommonDivisor.find(8, 12))
IO.inspect(GreatestCommonDivisor.find(54, 24))
