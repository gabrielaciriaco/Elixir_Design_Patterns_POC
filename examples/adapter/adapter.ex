defmodule ProjetorSamsung do
  defstruct [:serial_number]

  def new(serial_number) do
    %ProjetorSamsung{serial_number: serial_number}
  end

  def turn_on(projetor) do
    IO.puts("Ligando projetor da Samsung #{projetor.serial_number}")
  end
end

defmodule ProjetorLG do
  defstruct [:serial_number]

  def new(serial_number) do
    %ProjetorLG{serial_number: serial_number}
  end

  def enable(timer, projetor) do
    IO.puts("Ligando projetor  #{projetor.serial_number} da LG em #{timer} minutos")
  end
end

defprotocol Projetor do
  def liga(adaptador)
end

defmodule AdaptadorProjetorSamsung do
  defstruct projetor: nil

  def new(projetor) do
    %AdaptadorProjetorSamsung{projetor: projetor}
  end

  defimpl Projetor, for: AdaptadorProjetorSamsung do
    def liga(adaptador), do: ProjetorSamsung.turn_on(adaptador.projetor)
  end
end

defmodule AdaptadorProjetorLG do
  defstruct projetor: nil

  def new(projetor) do
    %AdaptadorProjetorLG{projetor: projetor}
  end

  defimpl Projetor, for: AdaptadorProjetorLG do
    def liga(adaptador), do: ProjetorLG.enable(5, adaptador.projetor)
  end
end

defmodule SistemaControleProjetores do
  def init(adaptador) do
    Projetor.liga(adaptador)
  end
end
