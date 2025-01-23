# Padrão de projeto: Observer

Para testar o código implementado siga os seguintes passos:

* mudar para o diretório correto: cd examples -> cd observer
* executar "iex observer.ex" (mac) ou "iex.bat observer.ex" (windows)
* dentro do iex executar:
  * observer1 = fn new_temp ->
      IO.puts("Temperatura alterada para: #{new_temp}°C")
    end
  * {:ok, _pid} = Temperatura.start_link(22)
  * Temperatura.add_observer(observer1)
  * Temperatura.set_temp(25)
  * Temperatura.set_temp(30)
