defmodule InstructionTest do 
  use ExUnit.Case
  import ERover.Instructions, only: [ parse: 1 ]

  test "test well formed the data" do
    assert parse(["4 4", "1 1 N", "MMLMM"]) == %{commands: "MMLMM", grid: %{cols: 4, rows: 4}, intial: %{col: 1, direction: "N", row: 1}}
      
  end
end

