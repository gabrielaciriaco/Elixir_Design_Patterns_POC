# Padrão de projeto: Visitor

Para testar o código implementado siga os seguintes passos:

* mudar para o diretório correto: cd examples -> cd visitor
* executar "iex visitor.ex" (mac) ou "iex.bat visitor.ex" (windows)
* dentro do iex executar:
  * veiculos = [
      %Carro{placa: "GHJ-1020"},
      %Onibus{placa: "BNM-3456"},
      %Carro{placa: "IOP-1234"},
      %Onibus{placa: "BVC-7923"}
    ]
  * Enum.each(veiculos, fn veiculo -> 
      Veiculo.Visitor.visit(veiculo)
    end)
