defmodule Typescript.Compiler do
  require Logger

  def compile_mac(path) do
    case System.find_executable("tsc") do
      nil ->
        Logger.error("[TypeScript] tsc cannot be found, please check the
        https://www.typescriptlang.org/download/")

      tsc_path ->
        cmd = System.cmd(tsc_path, [path])

        case cmd do
          {_, 0} -> Logger.debug("[TypeScript] OK")
          {debug, _} -> Logger.error(debug)
        end
    end
  end

  def compile_linux(_path) do
    Logger.error(
      "[TypeScript] Sorry, linux system is not suppoted yet. Please write to me: grych@tg.pl"
    )
  end

  def compile_windows(_path) do
    Logger.error(
      "[TypeScript] Sorry, windows system is not suppoted yet. Please write to me: grych@tg.pl"
    )
  end

  def compile(path) do
    case :os.type() do
      {:unix, :darwin} -> compile_mac(path)
      {:unix, :linux} -> compile_linux(path)
      {:win32, :nt} -> compile_windows(path)
      {_, _} -> Logger.error("[TypeScript] Undefined OS #{inspect(:os.type())}")
    end
  end
end
