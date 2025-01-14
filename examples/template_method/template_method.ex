defmodule Funcionario do
  defstruct salario: 0.0,
            calc_descontos_previdencia: nil,
            calc_descontos_plano_saude: nil,
            calc_outros_descontos: nil

  def calc_salario_liquido(%Funcionario{
        salario: salario,
        calc_descontos_previdencia: desconto_previdencia_fn,
        calc_descontos_plano_saude: desconto_saude_fn,
        calc_outros_descontos: desconto_outros_fn
      }) do
    desconto_previdencia = desconto_previdencia_fn.(salario)
    desconto_saude = desconto_saude_fn.(salario)
    desconto_outros = desconto_outros_fn.(salario)

    salario_liquido = salario - desconto_previdencia - desconto_saude - desconto_outros

    salario_liquido
  end
end

defmodule FuncionarioCLT do
  def criar_funcionario(salario) do
    %Funcionario{
      salario: salario,
      calc_descontos_previdencia: &calc_descontos_previdencia/1,
      calc_descontos_plano_saude: &calc_descontos_plano_saude/1,
      calc_outros_descontos: &calc_outros_descontos/1
    }
  end

  defp calc_descontos_previdencia(salario) do
    salario * 0.1
  end

  defp calc_descontos_plano_saude(_salario) do
    100.0
  end

  defp calc_outros_descontos(_salario) do
    20.0
  end
end
