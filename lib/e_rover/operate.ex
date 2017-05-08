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
    instructions = _execute(String.to_charlist(Map.get(instructions, :commands)), instructions)
    IO.puts "My final location: "
    out = "#{instructions[:location][:col]} #{instructions[:location][:row]} #{instructions[:location][:direction]}"
    IO.puts out
    out  
  end

  defp _execute([command | tail], instructions) do
    IO.puts "Executing: #{command}"
    instructions = _this(command, instructions)
    _execute(tail, instructions)
  end  
  defp _execute([], instructions), do: instructions
 
  # Do the M in current direction  
  defp _this(c, instructions) when c == 77 do
    Map.put instructions, :location, _move(instructions[:location][:direction], instructions[:location])
  end
  # Do the direction switch L
  defp _this(c, instructions) when c == 76 do
    IO.puts "I will trun Left"
    Map.put instructions, :location, _turn_l(instructions[:location][:direction], instructions[:location])  
  end  
  # Do the direction switch R
  defp _this(c, instructions) when c == 82 do
    IO.puts "I will trun Right"
    Map.put instructions, :location, _turn_r(instructions[:location][:direction], instructions[:location]) 
  end

   # Do the move per direction
  defp _move(direction, location) when direction == "N", do: Map.update! location, :row, &(&1 + 1)
  defp _move(direction, location) when direction == "E", do: Map.update! location, :col, &(&1 + 1)
  defp _move(direction, location) when direction == "S", do: Map.update! location, :row, &(&1 - 1)
  defp _move(direction, location) when direction == "W" ,do: Map.update! location, :col, &(&1 - 1) 
  
  # Anti clockwise Turn
  defp _turn_l(direction, location) when direction == "N", do: Map.put location, :direction, "W"
  defp _turn_l(direction, location) when direction == "E", do: Map.put location, :direction, "N"
  defp _turn_l(direction, location) when direction == "S", do: Map.put location, :direction, "E"
  defp _turn_l(direction, location) when direction == "W", do: Map.put location, :direction, "S"
 
  # Clockwise Turn 
  defp _turn_r(direction, location) when direction == "N", do: Map.put location, :direction, "E"
  defp _turn_r(direction, location) when direction == "E", do: Map.put location, :direction, "S"
  defp _turn_r(direction, location) when direction == "S", do: Map.put location, :direction, "W"
  defp _turn_r(direction, location) when direction == "W", do: Map.put location, :direction, "N"

end 
