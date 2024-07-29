defprotocol Channel do
  def send(_)
end

defmodule TCPChannel do
  defimpl Channel, for: TCPChannel do
    def send(_), do: "simulando TCP"
  end
end

defmodule UDPChannel do
  defimpl Channel, for: UDPChannel do
    def send(_), do: "simulando UDP"
  end
end

defmodule ChannelFactory do
  def create do
    IO.puts("simulando criação do TCP channel")
  end

  def f() do
    ChannelFactory.create()
  end

  def g() do
    ChannelFactory.create()
  end
end
