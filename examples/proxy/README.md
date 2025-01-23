# Padrão de projeto: Proxy

Para testar o código implementado siga os seguintes passos:

* mudar para o diretório correto: cd examples -> cd proxy
* executar "iex proxy.ex" (mac) ou "iex.bat proxy.ex" (windows)
* dentro do iex executar:
  * BookSearchProxy.getBook("123456789") #para o caso que tem o objeto no chache
  * BookSearchProxy.getBook("2") #outro exemplo implementado
