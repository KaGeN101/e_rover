defmodule ERover.Instructions do

  def parse(data), do: _parse([grid, initial, commands] = data)

  defp _parse([grid, initial, commands]) do
    IO.inspect(grid)  
  end  
end  
