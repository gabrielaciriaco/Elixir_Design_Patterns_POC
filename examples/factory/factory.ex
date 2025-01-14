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
  defstruct []
  defimpl Channel, for: UDPChannel do
    def send(_), do: "simulando UDP"
  end
end

defmodule ChannelUser do
  def send_message(channel) do
    Channel.send(channel)
  end
end
