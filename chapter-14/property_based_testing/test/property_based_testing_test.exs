defmodule PropertyBasedTestingTest do
  use ExUnit.Case
  doctest PropertyBasedTesting

  test "greets the world" do
    assert PropertyBasedTesting.hello() == :world
  end
end
