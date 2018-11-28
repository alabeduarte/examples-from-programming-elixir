# Go into iex. Create and run the functions that do the following:
# – list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
# – sum.(1, 2, 3) #=> 6
# – pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]

list_concat = fn list_a, list_b ->
  list_a ++ list_b
end

sum = fn a, b, c ->
  Enum.reduce([a, b, c], fn n, acc -> n + acc end)
end

pair_tuple_to_list = fn {a, b} ->
  [a, b]
end

IO.inspect(list_concat.([:a, :b], [:c, :d]))
IO.inspect(sum.(1, 2, 3))
IO.inspect(pair_tuple_to_list.({1234, 5678}))
