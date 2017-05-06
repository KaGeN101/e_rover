defmodule ERover.Instructions do

  def parse(data), do: _parse(data)

  defp _parse([grid, initial, commands]) do
    %{grid: _parse_grid(grid), intial: _parse_init(initial), commands: commands}
  end
  defp _parse_grid grid do
    [x, y] = String.split(grid, " ")
    %{rows: x, cols: y}
  end    
  def _parse_init(initial) do
    [x, y, d] = String.split(initial, " ")
    %{col: x, row: y, direction: d}
  end
  
    
end  
