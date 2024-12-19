defmodule Temperatura do
  use GenServer

  # Inicia o GenServer com a temperatura inicial
  def start_link(initial_temp) do
    GenServer.start_link(__MODULE__, %{temp: initial_temp, observers: []}, name: __MODULE__)
  end

  # Obtém a temperatura atual
  def get_temp do
    GenServer.call(__MODULE__, :get_temp)
  end

  # Altera a temperatura e notifica os observadores
  def set_temp(new_temp) do
    GenServer.cast(__MODULE__, {:set_temp, new_temp})
  end

  # Adiciona um observador
  def add_observer(observer) do
    GenServer.cast(__MODULE__, {:add_observer, observer})
  end

  # Função de inicialização
  def init(state) do
    {:ok, state}
  end

  # Handle para obter a temperatura
  def handle_call(:get_temp, _from, state) do
    {:reply, state.temp, state}
  end

  # Handle para alterar a temperatura e notificar os observadores
  def handle_cast({:set_temp, new_temp}, state) do
    updated_state = %{state | temp: new_temp}

    # Notificar os observadores registrados
    notify_observers(new_temp, state.observers)

    {:noreply, updated_state}
  end

  # Função para adicionar um observador
  def handle_cast({:add_observer, observer}, state) do
    # Adiciona a função observadora na lista de observadores
    updated_observers = [observer | state.observers]
    {:noreply, %{state | observers: updated_observers}}
  end

  # Função privada para notificar os observadores
  defp notify_observers(new_temp, observers) do
    Enum.each(observers, fn observer ->
      observer.(new_temp)  # Executa a função do observador com a nova temperatura
    end)
  end
end


defmodule TermometroObserver do
  # Função chamada quando uma mudança de temperatura for notificada
  def handle_event({:temperature_changed, new_temp}, state) do
    IO.puts("A temperatura foi alterada para: #{new_temp}°C")
    {:ok, state}
  end
end
