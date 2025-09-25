defmodule Typescript do
  @moduledoc """
  Documentation for `Typescript`.
  """
  require Logger
  use Application
  @dirs Application.compile_env(:typescript, :dirs, ["ts"])
  # @backend Application.compile_env(:typescript, :backend, :fs_mac)

  def start(_type, _args) do
    backend =
      case :os.type() do
        {:unix, :darwin} ->
          :fs_mac

        {:unix, :linux} ->
          Logger.error(
            "[TypeScript] Sorry, linux system is not suppoted yet. Please write to me: grych@tg.pl"
          )

          :fs_inotify

        {:win32, :nt} ->
          Logger.error(
            "[TypeScript] Sorry, windows system is not suppoted yet. Please write to me: grych@tg.pl"
          )

          :fs_windows

        {_, _} ->
          Logger.error("[TypeScript] Undefined OS #{inspect(:os.type())}")
      end

    children = [
      # Starts a worker by calling: Typescript.start_link(arg)
      # {Typescript, arg}
      {Typescript.Core, dirs: @dirs, backend: backend}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Typescript.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
