defmodule BookSearch do
  def getBook(isbn) do
    "book #{isbn}"
  end
end

defmodule BookSearchProxy do
  @cached_books %{
    "123456789" => %{"ISBN" => "123456789", "title" => "Livro 1", "author" => "Autor 1"}
  }

  def getBook(isbn) do
    # nesse caso estou simulando uma pesquisa com base em um cache estático
    case Map.get(@cached_books, isbn) do
      nil ->
        # adicionar book no cache com função (vamos criar?)
        IO.puts("Livro nao encontrado no cache")

      _ ->
        IO.puts("Livro encontrado no cache")
    end
  end
end
