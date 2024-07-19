defmodule ProjetorSamsung do
  defstruct [:serial_number]

  def new(serial_number) do
    %ProjetorSamsung{serial_number: serial_number}
  end

  def turnOn(projetor) do
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
  @spec liga(t()) :: any()
  def liga(adaptador)
end

defimpl Projetor, for: AdaptadorProjetorSamsung do
  def liga(adaptador), do: ProjetorSamsung.turnOn(adaptador.projetor)
end

defimpl Projetor, for: AdaptadorProjetorLG do
  def liga(adaptador), do: ProjetorLG.enable(5, adaptador.projetor)
end

defmodule AdaptadorProjetorSamsung do
  @behaviour Projetor

  defstruct projetor: nil

  def new(projetor) do
    %AdaptadorProjetorSamsung{projetor: projetor}
  end

  @spec liga(any()) :: :ok
  def liga(adaptador) do
    ProjetorSamsung.turnOn(adaptador.projetor)
  end
end

defmodule AdaptadorProjetorLG do
  @behaviour Projetor

  defstruct projetor: nil

  def new(projetor) do
    %AdaptadorProjetorLG{projetor: projetor}
  end

  @spec liga(any()) :: :ok
  def liga(adaptador) do
    ProjetorLG.enable(5, adaptador.projetor)
  end
end

defmodule SistemaControleProjetores do
  @spec init(any()) :: any()
  def init(adaptador) do
    Projetor.liga(adaptador)
  end
end
