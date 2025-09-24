defmodule Typescript.Core do
  use GenServer
  require Logger

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init(args) do
    {:ok, watcher_pid} = FileSystem.start_link(args)
    FileSystem.subscribe(watcher_pid)
    # Logger.info(inspect(args))
    {:ok, %{watcher_pid: watcher_pid}}
  end

  def handle_info({:file_event, watcher_pid, {path, _events}}, %{watcher_pid: watcher_pid} = state) do
    is_ts = String.downcase(path) |> String.ends_with?(".ts")
    if is_ts do
      # Logger.debug("#{inspect(path)} #{inspect(events)}")
      Typescript.Compiler.compile(path)
    end
    {:noreply, state}
  end

  def handle_info({:file_event, watcher_pid, :stop}, %{watcher_pid: watcher_pid} = state) do
    {:noreply, state}
  end
end
