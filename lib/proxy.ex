defmodule Book do
  defstruct [:nome]

  def new(nome) do
    %Book{nome: nome}
  end
end

defprotocol BookSearchInterface do
  def getBook(isbn)
end

defmodule BookSearch do
  @behaviour BookSearchInterface
  def getBook(isbn) do
    IO.puts("Pesquisando no objeto base - #{isbn}")

    case isbn do
      "2" ->
        Book.new("GoF")

      _ ->
        IO.puts("ISBN não corresponde ao padrão esperado")
    end
  end
end

defmodule BookSearchProxy do
  @behaviour BookSearchInterface

  @cached_books %{
    "123456789" => %{"ISBN" => "123456789", "title" => "Livro 1", "author" => "Autor 1"}
  }

  def getBook(isbn) do
    # nesse caso estou simulando uma pesquisa com base em um cache estático
    case Map.get(@cached_books, isbn) do
      nil ->
        IO.puts("Livro nao encontrado no proxy, iniciando busca no objeto base")
        BookSearch.getBook(isbn)

      # adicionar book no cache com função (vamos criar?)
      _ ->
        IO.puts("Livro encontrado no proxy")
    end
  end
end
