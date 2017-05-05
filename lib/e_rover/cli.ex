defmodule ERover.CLI do

  @moduledoc """
  Handle the command line parsing and the dispatch to the various functions 
  that end up driving a Rover around Mars  
  """

  def run(argv) do
    parse_args(argv)
  end 

   
  @doc """
  `argv` can be -h or --help, which returns :help.
  Otherwise it is a file to read, and (optionally) to be verbose or not
  Return a tuple of `{ user, project, count }`, or `:help` if help was given. 
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help   ])
   case parse do
     { [ help: true ], _, _ }
       -> :help
  
      { _, [file], _ }
        -> {file, true}
   
      { _, [file, verbose], _ }
        -> { file, verbose }

      _ -> :help
  
    end 
  end
end  


