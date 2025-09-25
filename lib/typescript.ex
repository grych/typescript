defmodule Typescript do
  @moduledoc """
  Documentation for `Typescript`.
  """
  require Logger
  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Typescript.start_link(arg)
      # {Typescript, arg}
      {Typescript.Core, dirs: ["ts"]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Typescript.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
