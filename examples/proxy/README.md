# Padrão de projeto: Proxy

Para testar o código implementado siga os seguintes passos:

* mudar para o diretório correto: cd examples -> cd factory
* executar "iex factory.ex" (mac) ou "iex.bat observer.ex" (windows)
* dentro do iex executar:
  * BookSearchProxy.getBook("123456789") #para o caso que tem o objeto no chache
  * BookSearchProxy.getBook("2") #outro exemplo implementado
