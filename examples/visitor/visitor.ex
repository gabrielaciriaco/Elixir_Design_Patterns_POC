defmodule Veiculo do
  defprotocol Visitor do
    def visit(veiculo)
  end
end

defmodule Carro do
  defstruct [:placa]

  defimpl Veiculo.Visitor, for: Carro do
    def visit(carro) do
      IO.puts("Visitando um Carro com placa: #{carro.placa}")
    end
  end
end

defmodule Onibus do
  defstruct [:placa]

  defimpl Veiculo.Visitor, for: Onibus do
    def visit(onibus) do
      IO.puts("Visitando um Ônibus com placa: #{onibus.placa}")
    end
  end
end
