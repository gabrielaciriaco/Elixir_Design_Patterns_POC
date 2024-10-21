defmodule InterpretadorX do
  defstruct [:arq]

  def new(arq) do
    %InterpretadorX{arq: arq}
  end

  def eval(interpretador) do
    # se necessário usar valores da struct no body dessa função, usar "interpretador.arq" por exemplo
    # Aqui ocorreria a implementação do codigo que seria necessário ao
    # executar programas X a partir de elixir
  end
end
