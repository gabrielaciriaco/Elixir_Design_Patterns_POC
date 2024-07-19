defmodule InterpretadorX do
  defstruct [:arq]

  def new(arq) do
    %InterpretadorX{arq: arq}
  end

  def eval() do
    # Aqui ocorreria a implementação do codigo que seria necessário ao
    # executar programas X a partir de elixir
  end
end
