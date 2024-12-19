defmodule Funcionario do
  # Define a estrutura do funcionário
  defstruct salario: 0.0,
            calc_descontos_previdencia: nil,
            calc_descontos_plano_saude: nil,
            calc_outros_descontos: nil

  # Template Method: método público que define a sequência do cálculo
  # Esse método recebe as funções que calculam cada um dos descontos como parâmetro, forçando os módulos que
  # implementam Funcionário a implementarem essas funções
  def calc_salario_liquido(%Funcionario{
        salario: salario,
        calc_descontos_previdencia: desconto_previdencia_fn,
        calc_descontos_plano_saude: desconto_saude_fn,
        calc_outros_descontos: desconto_outros_fn
      }) do
    desconto_previdencia = desconto_previdencia_fn.(salario)
    desconto_saude = desconto_saude_fn.(salario)
    desconto_outros = desconto_outros_fn.(salario)

    # calcula o salário de acordo com os descontos obtidos
    salario_liquido = salario - desconto_previdencia - desconto_saude - desconto_outros

    # retorna o salário
    salario_liquido
  end
end

# Subclasse concreta para FuncionarioCLT
defmodule FuncionarioCLT do
  # Função que cria o funcionário CLT com o salário e as funções de cálculo de descontos
  def criar_funcionario(salario) do
    %Funcionario{
      salario: salario,
      calc_descontos_previdencia: &calc_descontos_previdencia/1,
      calc_descontos_plano_saude: &calc_descontos_plano_saude/1,
      calc_outros_descontos: &calc_outros_descontos/1
    }
  end

  # Função que calcula o desconto de previdência
  defp calc_descontos_previdencia(salario) do
    salario * 0.1
  end

  # Função que calcula o desconto de plano de saúde
  defp calc_descontos_plano_saude(_salario) do
    100.0
  end

  # Função que calcula outros descontos
  defp calc_outros_descontos(_salario) do
    20.0
  end
end
