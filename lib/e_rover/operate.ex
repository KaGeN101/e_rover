defmodule ERover.Operate do

  def start(file_path) do
    IO.puts "I will start the engine!"
    _read_file(file_path, [])
       |> ERover.Instructions.parse
  end 

defp _read_file(input_file, lines) do
    line = IO.read(input_file, :line)
    if (line != :eof) do
      _read_file(input_file, [String.strip(line) | lines])   # recurse
    else
      lines
    end
  end
    

  def drive() do
    IO.puts "I will DRIVE!"
  end  
end  
