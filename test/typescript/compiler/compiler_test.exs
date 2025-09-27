defmodule Typescript.Compiler.CompilerTest do
  use ExUnit.Case
  require Logger
  import ExUnit.CaptureLog
  doctest Typescript.Compiler

  test "compile on a same OS enviroment as it is on your machine" do
    file_ts = Path.join(["ts", "first.ts"])
    file_js = Path.join(["ts", "first.js"])

    assert String.contains?(
             capture_log(fn -> Typescript.Compiler.compile(file_ts) end),
             "[debug] [TypeScript] OK"
           )

    assert File.rm(file_js) == :ok
  end
end
