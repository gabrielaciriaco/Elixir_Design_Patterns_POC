# vamos usar um protocolo
defmodule Veiculo do
  # Define o protocolo Visitor
  defprotocol Visitor do
    def visit(veiculo)
  end
end

defmodule Carro do
  # Define o "objeto" de carro
  defstruct [:placa]

  # Implementação do protocolo Visitor para Carro
  defimpl Veiculo.Visitor, for: Carro do
    def visit(carro) do
      IO.puts("Visitando um Carro com placa: #{carro.placa}")
    end
  end
end

defmodule Onibus do
  # Define o "objeto" de onibus
  defstruct [:placa]

  # Implementação do protocolo Visitor para Onibus
  defimpl Veiculo.Visitor, for: Onibus do
    def visit(onibus) do
      IO.puts("Visitando um Ônibus com placa: #{onibus.placa}")
    end
  end
end
