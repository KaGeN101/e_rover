defmodule ERover.Operate do

  def start(file_path) do
    IO.puts "I will start the engine!"
    File.stream!(file_path) 
      |> Stream.map(&String.trim_trailing/1) 
      |> Enum.to_list
      |> ERover.Instructions.parse
      |> drive
  end

  #TODO I probably need some data verification before I start driving!!
  # Just want to get it working then I will do the negative checks

  def drive(instructions) do
    IO.puts "I will DRIVE!"
    _execute(Map.get(instructions, :commands), instructions)   
  end

  defp _execute([command | tail], instructions) do
    IO.puts "Executing: #{command}"
    _execute(tail, instructions)
  end  
  defp _execute([], instructions), do: instructions
    
end  
