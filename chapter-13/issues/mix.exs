defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      escript: escript_config(),
      version: "0.1.0",
      name: "Issues",
      source_url: "https://github.com/alabeduarte/examples-from-programming-elixir",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:poison, "~> 4.0.1"},
      {:ex_doc, "~> 0.19.2"},
      {:earmark, "~> 1.3", override: true},
      {:excoveralls, "~> 0.10.3"}
    ]
  end

  defp escript_config do
    [
      main_module: Issues.CLI
    ]
  end
end
