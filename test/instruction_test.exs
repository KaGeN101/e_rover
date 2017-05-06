defmodule InstructionTest do 
  use ExUnit.Case
  import ERover.Instructions, only: [ parse: 1 ]

  test "test the data" do
    parse ["8 8", "1 2 E", "MMLMM"] 
  end
end

