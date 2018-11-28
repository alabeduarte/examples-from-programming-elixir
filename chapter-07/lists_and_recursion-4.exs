# ➤ Exercise: ListsAndRecursion-4
# Write a function MyList.span(from, to) that returns a list of the numbers
# from `from` up to `to`.

defmodule MyList do
  def span(to, to), do: [to]
  def span(from, to) when from > to, do: span(to, from)
  def span(from, to), do: [from | span(from + 1, to)]
end

IO.inspect(MyList.span(10, 1))
