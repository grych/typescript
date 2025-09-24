defmodule TypescriptTest do
  use ExUnit.Case
  doctest Typescript

  test "greets the world" do
    assert Typescript.hello() == :world
  end
end
