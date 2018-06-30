# ➤ Exercise: ListsAndRecursion-2
# Write a max(list) that returns the element with the maximum value in the
# list. (This is slightly trickier than it sounds.)

defmodule MyList do
  def custom_max([], value), do: value

  def custom_max([head | tail], value) when head > value do
    custom_max(tail, head)
  end

  def custom_max([head | tail], value) when head <= value do
    custom_max(tail, value)
  end

  def custom_max(list), do: custom_max(list, -1)
end

IO.inspect MyList.custom_max([2, 1, 4, 3])
