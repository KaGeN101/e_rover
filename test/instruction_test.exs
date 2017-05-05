defmodule InstructionTest do 
  use ExUnit.Case
  import ERover.Instruction, only: [ parse: 1 ]

  test "test the data" do
    parse "blbla" 
  end
end

