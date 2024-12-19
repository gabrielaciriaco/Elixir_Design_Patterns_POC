defprotocol NewChannel do
  def send(channel, msg)
  def receive(channel)
end

defmodule NewTCPChannel do
  defstruct []

  defimpl NewChannel, for: NewTCPChannel do
    def send(channel,msg) do
      IO.puts("Canal concreto (TCP) enviando > #{msg}")
    end
    def receive(channel) do
      IO.puts("Canal concreto (TCP) recebendo ...")
     "José"
    end
  end

end

defmodule ChannelDecorator do
  defstruct [:channel]

  defimpl NewChannel, for: ChannelDecorator  do
   def send(%{channel: channel},msg) do
     NewChannel.send(channel,msg)
   end
    def receive(%{channel: channel}) do
      NewChannel.receive(channel)
    end
  end
end

defmodule ZipChannel do
  defstruct [:channel]

  defimpl NewChannel, for: ZipChannel do
    def send(%ZipChannel{channel: channel}, msg) do
      IO.puts("Decorador compactando > #{msg}")
      NewChannel.send(channel, msg)
    end
    def receive(%ZipChannel{channel: channel}) do
      msg = NewChannel.receive(channel)
      IO.puts("Decorador descompactando < #{msg}")
      msg
    end
  end
end
