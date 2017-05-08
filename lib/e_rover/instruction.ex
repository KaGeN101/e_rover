defmodule ERover.Instructions do

  def parse(data), do: _parse(data)

  defp _parse([grid, initial, commands]) do
    %{grid: _parse_grid(grid), location: _parse_init(initial), commands: commands}
  end
  defp _parse_grid grid do
    [x, y] = String.split(grid, " ")
    %{rows: String.to_integer(x), cols: String.to_integer(y)}
  end    
  def _parse_init(initial) do
    [x, y, d] = String.split(initial, " ")
    %{col: String.to_integer(x), row: String.to_integer(y), direction: d}
  end
  
    
end  
