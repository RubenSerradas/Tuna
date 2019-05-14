defmodule TunaLexer.Test do
  use ExUnit.Case
  use Quixir

  describe "number lexer" do
    test "integer" do
      ptest value: int(min: 0) do
        assert {:ok, [{:integer, 1, value}], 1} == :tuna_lexer.string('#{value}')
      end
    end
    test "floats" do
      ptest value: float(min: 0) do
        assert {:ok, [{:float, 1, value}], 1} == :tuna_lexer.string('#{value}')
      end
    end
  end

  describe "strings double quotation mark" do
    test "simple string" do
      value = '"something"'
      assert {:ok, [{:string, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
    test "unicode" do
      value = '"ñame 日本\n"'
      assert {:ok, [{:string, 1, value}], 2} == :tuna_lexer.string('#{value}')
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

  describe "strings one quotation mark" do
    test "simple string" do
      value = '\'something\''
      assert {:ok, [{:string, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
    test "unicode" do
      value = '\'ñame 日本\n\''
      assert {:ok, [{:string, 1, value}], 2} == :tuna_lexer.string('#{value}')
    end
    test "empty" do
      value = '\'\''
      assert {:ok, [{:string, 1, value}], 1} == :tuna_lexer.string('#{value}')
    end
    test "error double" do
      value = '\'\'\''
      error_value = {:error, {1, :tuna_lexer, {:illegal, '\''}}, 1}
      assert error_value == :tuna_lexer.string('#{value}')
    end
    test "error" do
      value = '\''
      error_value = {:error, {1, :tuna_lexer, {:illegal, '\''}}, 1}
      assert  error_value == :tuna_lexer.string('#{value}')
    end
  end
end
