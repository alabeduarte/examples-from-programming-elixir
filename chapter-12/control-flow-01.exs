# ➤ Exercise: ControlFlow-1
# Rewrite the FizzBuzz example using case.

defmodule FizzBuzz do
  def evaluate(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} ->
        "FizzBuzz"

      {0, _} ->
        "Fizz"

      {_, 0} ->
        "Buzz"

      _ ->
        n
    end
  end
end

Enum.each(1..30, fn n -> IO.inspect(FizzBuzz.evaluate(n)) end)
