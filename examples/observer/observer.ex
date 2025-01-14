defmodule Temperatura do
  use GenServer

  def start_link(initial_temp) do
    GenServer.start_link(__MODULE__, %{temp: initial_temp, observers: []}, name: __MODULE__)
  end

  def set_temp(new_temp) do
    GenServer.cast(__MODULE__, {:set_temp, new_temp})
  end

  def add_observer(observer) do
    GenServer.cast(__MODULE__, {:add_observer, observer})
  end

  def init(state) do
    {:ok, state}
  end

  # handle_cast é usado para lidar com chamadas async
  def handle_cast({:set_temp, new_temp}, state) do
    updated_state = %{state | temp: new_temp}
    notify_observers(new_temp, state.observers)
    {:noreply, updated_state}
  end

  def handle_cast({:add_observer, observer}, state) do
    updated_observers = [observer | state.observers]
    {:noreply, %{state | observers: updated_observers}}
  end

  defp notify_observers(new_temp, observers) do
    Enum.each(observers, fn observer ->
      observer.(new_temp)
    end)
  end
end

defmodule TermometroObserver do
  def handle_event({:temperature_changed, new_temp}, state) do
    IO.puts("A temperatura foi alterada para: #{new_temp}°C")
    {:ok, state}
  end
end
