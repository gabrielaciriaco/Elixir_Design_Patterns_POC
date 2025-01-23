# Padrão de projeto: Singleton
Para testar o código implementado siga os seguintes passos:

* mudar para o diretório correto: cd examples -> cd singleton
* executar "iex singleton.ex" (mac) ou "iex.bat singleton.ex" (windows)
* dentro do iex executar:
  * {:ok, \_pid} = LoggerSingleton.start_link(nil)
  * LoggerSingleton.println("Hello, Singleton Logger!")
  * LoggerSingleton.get_instance()
