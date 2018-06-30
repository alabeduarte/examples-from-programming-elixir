# ➤ Exercise: ListsAndRecursion-5
# Implement the following Enum functions using no library functions or list
# comprehensions: all?, each, filter, split, and take. You may need to use an
# if statement to implement filter. The syntax for this is
#
# if condition do
#   expression(s)
# else
#   expression(s)
# end

require Integer

separator = '\n••••••••••••••••••••••••••••••••\n'

defmodule All do
  def all?([head]), do: head
  def all?([head, next | tail]), do: all?([head and next] ++ tail)
  def all?([_head | tail]), do: all?(tail)

  defp all?([], value, _func), do: value
  defp all?([head | tail], _value, func), do: all?(tail, func.(head), func)

  def all?([head | tail], func), do: all?(tail, func.(head), func)
end

defmodule Each do
  def each([head], func), do: func.(head)
  def each([head | tail], func), do: each(tail, func.(head), func)

  defp each([head], _value, func), do: each([head], func)
  defp each([head | tail], _value, func), do: each(tail, func.(head), func)
end

defmodule Filter do
  def filter(enumerable, func), do: filter(enumerable, [], func)

  defp filter([head], enumerable, func) do
    concat_if_condition_matches(head, enumerable, func.(head))
  end

  defp filter([head | tail], enumerable, func) do
    filter(tail, concat_if_condition_matches(head, enumerable, func.(head)), func)
  end

  defp concat_if_condition_matches(value, enumerable, condition) do
    if condition do
      enumerable ++ [value]
    else
      enumerable
    end
  end
end

defmodule Split do
  def split(enumerable, 0), do: {[], enumerable}

  def split([head | tail], count) do
    {left, right} = split(tail, count - 1)

    {[head | left], right}
  end
end

defmodule Take do
  def take(enumerable, amount), do: take(enumerable, amount, [])

  defp take(enumerable, 0, taken), do: taken
  defp take([], amount, taken), do: taken

  defp take([head | tail], amount, taken) when amount > 0 do
    take(tail, amount - 1, taken ++ [head])
  end

  defp take(enumerable, amount, taken) when amount < 0 do
    take(Enum.reverse(enumerable), amount * -1, taken)
  end
end

defmodule MyEnum do
  def all?(enumerable), do: All.all?(enumerable)
  def all?(enumerable, func), do: All.all?(enumerable, func)
  def each(enumerable, func), do: Each.each(enumerable, func)
  def filter(enumerable, func), do: Filter.filter(enumerable, func)
  def split(enumerable, count), do: Split.split(enumerable, count)
  def take(enumerable, amount), do: Take.take(enumerable, amount)
end

# all?
IO.puts separator
IO.puts '>> all?'
IO.inspect("#{MyEnum.all? [true, true]} == #{Enum.all? [true, true]}")
IO.inspect("#{MyEnum.all? [true, true, true]} == #{Enum.all? [true, true, true]}")
IO.inspect("#{MyEnum.all? [true, false]} == #{Enum.all? [true, false]}")
IO.inspect("#{MyEnum.all? [true, false, true]} == #{Enum.all? [true, false, true]}")
IO.inspect("#{MyEnum.all? [true, false, true, true]} == #{Enum.all? [true, false, true, true]}")
IO.inspect("#{MyEnum.all? [false, false]} == #{Enum.all? [false, false]}")
IO.inspect("#{MyEnum.all?([1, 2, 3], &(&1 < 4))} == #{Enum.all?([1, 2, 3], &(&1 < 4))}")
IO.inspect("#{MyEnum.all?([1, 2, 5], &(&1 < 4))} == #{Enum.all?([1, 2, 5], &(&1 < 4))}")

IO.puts separator

# each
IO.puts separator
IO.puts '>> each: '
IO.puts '\n'
MyEnum.each([1, 2, 5], &(IO.puts("MyEnum: #{&1}")))
Enum.each([1, 2, 5], &(IO.puts("Enum: #{&1}")))
IO.puts separator

# filter
IO.puts separator
IO.puts '>> filter: '
IO.puts '\n'

IO.puts """
>>>
  given a range of 1..5
    it filters only numbers that are less than 4
      returning [1, 2, 3]
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.filter([1, 2, 3, 4, 5], &(&1 < 4)))
IO.puts '>>> Enum: '
IO.inspect(Enum.filter([1, 2, 3, 4, 5], &(&1 < 4)))
IO.puts '\n'

IO.puts """
>>>
  given a range of 1..4
    it filters only even numbers
      returning [2, 4]
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.filter([1, 2, 3, 4], &(Integer.is_even(&1))))
IO.puts '>>> Enum: '
IO.inspect(Enum.filter([1, 2, 3, 4], &(Integer.is_even(&1))))
IO.puts '\n'

IO.puts """
>>>
  given a range of 1..5
    it filters only odd numbers that are less than 5
      returning [1, 3]
"""
oddAndLessThanFive = fn(value) ->
  Integer.is_odd(value) && value < 5
end

IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.filter([1, 2, 3, 4, 5], oddAndLessThanFive))
IO.puts '>>> Enum: '
IO.inspect(Enum.filter([1, 2, 3, 4, 5], oddAndLessThanFive))
IO.puts '\n'

IO.puts separator

# split
IO.puts separator
IO.puts '>> split: '
IO.puts '\n'

IO.puts """
>>>
  given a range of 1..4
    it splits into two enumerables
      returning {[1, 2], [3, 4]}
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.split([1, 2, 3, 4], 2))
IO.puts '>>> Enum: '
IO.inspect(Enum.split([1, 2, 3, 4], 2))
IO.puts '\n'

IO.puts """
>>>
  given a range of 1..5
    it splits into two enumerables
      returning {[1, 2, 3], [4, 5]}
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.split([1, 2, 3, 4, 5], 3))
IO.puts '>>> Enum: '
IO.inspect(Enum.split([1, 2, 3, 4, 5], 3))
IO.puts '\n'

IO.puts """
>>>
  given a range of 1..5
    it splits into two enumerables
      returning {[1], [2, 3, 4, 5]}
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.split([1, 2, 3, 4, 5], 1))
IO.puts '>>> Enum: '
IO.inspect(Enum.split([1, 2, 3, 4, 5], 1))
IO.puts '\n'

# take
IO.puts separator
IO.puts '>> take: '
IO.puts '\n'

IO.puts """
>>>
  given the input [1, 2, 3], 2
    it takes two elements
      returning [1, 2]
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.take([1, 2, 3], 2))
IO.puts '>>> Enum: '
IO.inspect(Enum.take([1, 2, 3], 2))
IO.puts '\n'

IO.puts """
>>>
  given the input [1, 2, 3], 10
    it takes three elements
      returning [1, 2, 3]
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.take([1, 2, 3], 10))
IO.puts '>>> Enum: '
IO.inspect(Enum.take([1, 2, 3], 10))
IO.puts '\n'

IO.puts """
>>>
  given the input [1, 2, 3], 0
    it returns empty array
      returning []
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.take([1, 2, 3], 0))
IO.puts '>>> Enum: '
IO.inspect(Enum.take([1, 2, 3], 0))
IO.puts '\n'

IO.puts """
>>>
  given the input [1, 2, 3], -1
    it returns empty array
      returning [3]
"""
IO.puts '>>> MyEnum: '
IO.inspect(MyEnum.take([1, 2, 3], -1))
IO.puts '>>> Enum: '
IO.inspect(Enum.take([1, 2, 3], -1))
IO.puts '\n'
