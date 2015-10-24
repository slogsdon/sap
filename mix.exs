defmodule Sap.Mixfile do
  use Mix.Project

  def project do
    [app: :sap,
     version: "0.0.2",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     name: "Sap",
     docs: [source_url: "https://github.com/slogsdon/sap"],
     package: package,
     description: description,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test]]
  end

  def application do
    [applications: [:logger, :plug],
     mod: {Sap, []}]
  end

  defp deps do
    [
      {:plug, "~> 1.0"},
      {:control, "~> 0.0"},

      {:earmark, "~> 0.1", only: :docs},
      {:ex_doc, "~> 0.10", only: :docs},
      {:inch_ex, only: :docs},

      {:excoveralls, "~> 0.4", only: :test},
      {:dialyze, "~> 0.2", only: :test},
      {:dogma, "~> 0.0", only: :test},
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
