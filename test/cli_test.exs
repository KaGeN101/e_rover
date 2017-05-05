defmodule CliTest do 
  use ExUnit.Case
  import ERover.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do 
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "two values returned if two given" do
    assert parse_args(["/file_path", false]) == { "/file_path", false }
  end

  test "verbose is defaulted if only file_path given" do
    assert parse_args(["/file_path"]) == { "/file_path", true }
  end 
end
