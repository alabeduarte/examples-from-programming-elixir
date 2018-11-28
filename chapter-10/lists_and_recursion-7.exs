# ➤ Exercise: ListsAndRecursion-7
# In the last exercise of Chapter 7, Lists and Recursion, on page 71, you wrote
# a span function. Use it and list comprehensions to return a list of the prime
# numbers from 2 to n.

defmodule MyList do
  def span(to, to), do: [to]
  def span(from, to), do: [from | span(from + 1, to)]
end

defmodule MyNumber do
  def prime?(n), do: divisors(n) == [n, 1]
  def divisors(n), do: divisors(n, n - 1, [])

  defp divisors(n, 0, list), do: [n | list]

  defp divisors(n, next, list) when rem(n, next) == 0 do
    divisors(n, next - 1, [next | list])
  end

  defp divisors(n, next, list), do: divisors(n, next - 1, list)
end

defmodule PrimeNumbers do
  def filter(list) do
    prime_only = fn n -> MyNumber.prime?(n) end

    for n <- list, prime_only.(n), do: n
  end
end

IO.inspect(PrimeNumbers.filter(MyList.span(2, 200)))
