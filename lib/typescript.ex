defmodule Typescript do
  @moduledoc """
  Documentation for `Typescript`.
  """
  require Logger
  use Application
  @dirs Application.compile_env(:typescript, :dirs, ["ts"])

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Typescript.start_link(arg)
      # {Typescript, arg}
      {Typescript.Core, dirs: @dirs}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Typescript.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
