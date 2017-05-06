defmodule ERover.Operate do

  def start(file_path) do
    IO.puts "I will start the engine!"
    File.stream!(file_path) 
      |> Stream.map(&String.trim_trailing/1) 
      |> Enum.to_list
      |> ERover.Instructions.parse
      |> drive
  end

  def drive(instructions) do
    IO.puts "I will DRIVE!"
    IO.inspect instructions
  end  
end  
