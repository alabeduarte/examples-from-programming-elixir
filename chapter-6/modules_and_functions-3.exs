# ➤ Exercise: ModulesAndFunctions-3
# Add a quadruple function. (Maybe it could call the double function....)

defmodule Times do
  def double(n), do: n * 2

  def quadruple(n), do: double(n) * 2
end

IO.inspect(Times.quadruple(3))
