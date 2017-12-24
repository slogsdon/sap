defmodule Sap.Mixfile do
  use Mix.Project

  def project do
    [app: :sap,
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     name: "Sap",
     docs: [source_url: "https://github.com/slogsdon/sap"],
     package: package(),
     description: description(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [
       coveralls: :test,
       credo: :test,
       dialyze: :test,
       dogma: :test]]
  end

  def application do
    [applications: [:logger, :plug],
     mod: {Sap, []}]
  end

  defp deps do
    [
      {:plug, "~> 1.4"},
      {:control, "~> 0.0"},

      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.18", only: :dev},
      {:inch_ex, "~> 0.5", only: :dev},

      {:excoveralls, "~> 0.7", only: :test},
      {:dialyze, "~> 0.2", only: :test},
      {:dogma, "~> 0.1", only: :test},
      {:credo, "~> 0.8", only: :test},
    ]
  end

  defp description do
    """
    Sap is a toolkit for Plug applications to accept and respond to HTTP
    requests by using a decision tree built with combinators.
    """
  end

  defp package do
    %{licenses: ["MIT"],
      maintainers: ["Shane Logsdon"],
      links: %{"GitHub" => "https://github.com/slogsdon/sap"}}
  end
end
