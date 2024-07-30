defmodule LoggerSingleton do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def get_instance() do
    GenServer.call(__MODULE__, :get_instance)
  end

  def println(msg) do
    GenServer.cast(__MODULE__, {:println, msg})
  end

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call(:get_instance, _from, state) do
    {:reply, self(), state}
  end

  @impl true
  def handle_cast({:println, msg}, state) do
    IO.puts(msg)
    {:noreply, state}
  end
end
