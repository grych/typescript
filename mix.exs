defmodule Typescript.MixProject do
  use Mix.Project

  def project do
    [
      app: :typescript,
      version: "0.2.1",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Typescript, []}
    ]
  end

  defp deps do
    [
      {:file_system, "~> 1.1"}
    ]
  end
end
