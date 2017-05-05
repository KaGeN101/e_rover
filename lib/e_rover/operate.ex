defmodule ERover.Operate do

  def start(file_path) do
    IO.puts "I will start the engine!"
    File.read(file_path)
      |> ERover.Instructions.parse
  end  

  def drive() do
    IO.puts "I will DRIVE!"
  end  
end  
