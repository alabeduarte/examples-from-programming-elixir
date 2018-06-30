# ➤ Exercise: ListsAndRecursion-1
# Write a mapsum function that takes a list and a function. It applies the
# function to each element of the list and then sums the result, so
# iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
# 14

defmodule MyList do
  def mapsum([], value, _func), do: value

  def mapsum([head | tail], value, func) do
    mapsum(tail, func.(head) + value, func)
  end

  def mapsum([head | tail], func) do
    mapsum(tail, func.(head), func)
  end
end

IO.inspect MyList.mapsum [1, 2, 3], &(&1 * &1)
