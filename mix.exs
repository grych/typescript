defmodule Typescript.MixProject do
  use Mix.Project

  def project do
    [
      app: :typescript,
      version: "0.2.3",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Docs
      name: "TypeScript",
      source_url: "https://github.com/grych/typescript",
      docs: [
        main: "TypeScript",
        extras: ["README.md", "LICENSE.md"],
        source_url: "https://github.com/grych/typescript",
        authors: ["Tomasz Gryszkiewicz"],
        main: "readme"
      ],
      package: package(),
      description: description()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Typescript, []}
    ]
  end

  defp description() do
    """
    A library to compile TypeScript to JavaScript.
    """
  end

  defp package() do
    [
      name: :typescript,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Tomasz Gryszkiewicz"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/grych/typescript",
      }
    ]
  end


  defp deps do
    [
      {:ex_doc, "~> 0.34", only: :dev, runtime: false, warn_if_outdated: true},
      {:file_system, "~> 1.1"}
    ]
  end
end
