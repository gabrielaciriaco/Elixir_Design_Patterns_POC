defprotocol Channel do
  def send()
end

defmodule TCPChannel do
  @behaviour Channel
  def send() do
    # Envia mensagem
  end
end

defmodule UDPChannel do
  @behaviour Channel
  def send() do
    # Envia mensagem
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
