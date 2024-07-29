defmodule Book do
  defstruct [:nome]

  def new(nome) do
    %Book{nome: nome}
  end
end

defmodule BookSearchInterface do
  @callback getBook(String.t()) :: {:ok, any()}
end

defmodule BookSearch do
  @behaviour BookSearchInterface

  @impl BookSearchInterface
  def getBook(isbn) do
    IO.puts("Pesquisando no objeto base - #{isbn}")

    case isbn do
      "2" ->
        {:ok, Book.new("GoF")}

      _ ->
        {:ok, "ISBN não corresponde ao padrão esperado"}
    end
  end
end

defmodule BookSearchProxy do
  @behaviour BookSearchInterface

  def cached_books do
    %{
      "123456789" => %{"ISBN" => "123456789", "title" => "Livro 1", "author" => "Autor 1"}
    }
  end

  @impl BookSearchInterface
  def getBook(isbn) do
    # nesse caso estou simulando uma pesquisa com base em um cache estático
    case Map.get(BookSearchProxy.cached_books(), isbn) do
      nil ->
        IO.puts("Livro nao encontrado no proxy, iniciando busca no objeto base")
        book = BookSearch.getBook(isbn)
        book

      # A ideia aqui é adicionar book no cache já que o proxy ja conhece ele
      _ ->
        IO.puts("Livro encontrado no proxy")
        Map.get(BookSearchProxy.cached_books(), isbn)
    end
  end
end
