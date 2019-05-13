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

  describe "strings double quotation mark" do
    test "simple string" do
      value = '"something"'
      assert {:ok, [{:string, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
    test "unicode" do
      value = '"ñame 日本"'
      assert {:ok, [{:string, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
    test "empty" do
      value = '""'
      assert {:ok, [{:string, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
    test "error double" do
      value = '"""'
      error_value = {:error, {1, :tuna_lexer, {:illegal, '"'}}, 1}
      assert error_value == :tuna_lexer.string('#{value}')
    end
    test "error" do
      value = '"'
      error_value = {:error, {1, :tuna_lexer, {:illegal, '"'}}, 1}
      assert  error_value == :tuna_lexer.string('#{value}')
    end
  end
end
