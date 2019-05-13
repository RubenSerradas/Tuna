defmodule TunaLexer.Test do
  use ExUnit.Case

  describe "number lexer" do
    test "integer" do
      value = 123
      assert {:ok, [{:integer, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
    test "simple floats" do
      value = 2.5
      assert {:ok, [{:float, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
    test "long floats" do
      value = 233.566
      assert {:ok, [{:float, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
  end
end
