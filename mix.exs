defmodule RustledSyntect.MixProject do
  use Mix.Project

  def project do
    [
      app: :rustled_syntect,
      description: "Rustler binding for the Syntect syntax highlighter, with streaming and iolists",
      version: "0.0.0",
      elixir: "~> 1.7",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      compilers: [:rustler] ++ Mix.compilers,
      rustler_crates: rustler_crates(),
      deps: deps(),
      package: package(),
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:rustler, "~> 0.20.0"}
    ]
  end

  defp rustler_crates do
    [
      rustled_syntect: [
        path: "native/rustled_syntect",
        mode: :release
      ]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "CODE_OF_CONDUCT.md", "LICENSE.md"],
      maintainers: ["Greg V"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/myfreeweb/rustled_syntect"}
    ]
  end
end