defmodule PhoenixIntercoolerTutorial.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_intercooler_tutorial,
      version: "0.0.1",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      test_coverage: [tool: ExCoveralls, test_task: "espec"],
      preferred_cli_env: [espec: :test, "coveralls": :test, "coveralls.circle": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PhoenixIntercoolerTutorial.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},

      # Code analysis
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      # Tests
      {:espec_phoenix, "~> 0.6.9", only: :test},
      # Test coverage reports
      {:excoveralls, "~> 0.7", only: :test},
      # Integration tests
      {:hound, "~> 1.0"},

      {:cowboy, "~> 1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": [],
      "espec": ["ecto.create --quiet", "ecto.migrate", "espec"],
      "s": ["phx.server"],
      "r": ["phx.routes"],
      "cov": ["cmd mix coveralls.html"]
    ]
  end
end
