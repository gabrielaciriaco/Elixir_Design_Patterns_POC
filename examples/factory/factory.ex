defprotocol Channel do
  def send(_)
end

defmodule TCPChannel do
  defstruct []
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
  def create() do
    %TCPChannel{}
  end
end
