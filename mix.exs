defmodule States.Mixfile do
  use Mix.Project

  def project do
    [app:        :states,
     escript:    escript_config(),
     version:    "0.1.0",
     name:       "Vid",
     source_url: "https://github.com/LATBauerdick/elixir-issues",
     elixir:     "~> 1.3",
     build_embedded:  Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps:       deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {Vid, []}
    ]
  end

  defp deps do
    []
  end

  defp escript_config() do
    [ main_module: Vid.CLI ]
  end

end

