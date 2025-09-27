defmodule Typescript do
  @moduledoc """
  The library to compile the TypeScript to JavaScript. This library contains a File System, to watch
  the changes to the *.ts file in a directory called "ts/", and compile it to the JavaScript after
  any change inside it.

  ## Configuration

  You can use the **config.exs** like this:

  ```elixir
  config :typescript,
    dirs: ["ts"]
  ```

  """
  require Logger
  use Application
  @dirs Application.compile_env(:typescript, :dirs, ["ts"])
  # @backend Application.compile_env(:typescript, :backend, :fs_mac)

  @spec start(any(), any()) :: {:error, any()} | {:ok, pid()}
  @doc false
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

    opts = [strategy: :one_for_one, name: Typescript.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
