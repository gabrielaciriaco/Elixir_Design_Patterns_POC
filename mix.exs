defmodule ElixirDesignPatterns.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_design_patterns,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  def run do
    # # factory
    # IO.puts(ChannelFactory.f())
    # IO.puts(ChannelFactory.g())
    # IO.puts(ChannelFactory.h())

    # # proxy
    # BookSearchProxy.getBook("123456789")
    # BookSearchProxy.getBook("987654321")

    # # adapter
    # projetor_samsung = %ProjetorSamsung{serial_number: "12345"}
    # projetor_lg = %ProjetorLG{serial_number: "123456"}

    # SistemaControleProjetores.init(AdaptadorProjetorSamsung)
    # SistemaControleProjetores.init(AdaptadorProjetorLG)
  end
end
