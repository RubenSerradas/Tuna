defmodule TunaTest do
  use ExUnit.Case
  doctest Tuna

  test "greets the world" do
    assert Tuna.hello() == :world
  end
end
