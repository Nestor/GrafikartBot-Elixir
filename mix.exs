defmodule Discordbot.Mixfile do
  use Mix.Project

  def project do
    [app: :discordbot,
     version: "0.1.14",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     dialyzer: [flags: ["-Wno_return"]]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [
        :logger,
        :discord_ex,
        :poison,
        :websocket_client,
        :mariaex,
        :feeder_ex,
        :xmerl,
        :exredis,
        :toniq
      ],
     mod: {Discordbot, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:discord_ex, git: "https://github.com/rmcafee/discord_ex.git"},
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.0"},
      {:distillery, "~> 1.0"},
      {:mariaex, "~> 0.7.3"},
      {:feeder_ex, "~> 1.1"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:exredis, ">= 0.1.1"},
      {:websocket_client, ">= 1.3.0", override: true},
      {:toniq, "~> 1.0"}
    ]
  end
end
