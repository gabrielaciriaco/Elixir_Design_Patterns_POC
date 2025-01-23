# Padrão de projeto: Decorator

Para testar o código implementado siga os seguintes passos:

* mudar para o diretório examples: cd examples -> cd decorator
* executar "iex factory.ex" (mac) ou "iex.bat observer.ex" (windows)
* dentro do iex executar:
  * tcp_channel = %NewTCPChannel{}
  * zip_channel = %ZipChannel{channel: tcp_channel}
  * NewChannel.send(zip_channel, "Mensagem de teste")
  * NewChannel.receive(zip_channel)
