defmodule Book do
  defstruct [:nome, :isbn]

  def new(nome, isbn) do
    %Book{nome: nome, isbn: isbn}
  end
end

defmodule BookSearchInterface do
  @callback get_book(String.t()) :: {atom(), any()}
end

defmodule BookSearch do
  @behaviour BookSearchInterface

  @impl BookSearchInterface
  def get_book(isbn) do
    IO.puts("Pesquisando no objeto base - #{isbn}")

    case isbn do
      "2" ->
        {:ok, Book.new("GoF","2")}

      _ ->
        {:error, "ISBN não corresponde ao padrão esperado"}
    end
  end
end

defmodule BookSearchProxy do
  @behaviour BookSearchInterface

  def cached_books() do
    %{
      "123456789" => %Book{nome: "Refactoring", isbn: "123456789"}
    }
  end

  def update_cache(book) do
    cached_books()
    |> Map.put(book.isbn, book) # simula atualização do cache! (cache estático pode virar GenServer para poder ter estado atualizado)
  end

  @impl BookSearchInterface
  def get_book(isbn) do
    # nesse caso estou simulando uma pesquisa com base em um cache estático
    case book = cached_books() |> Map.get(isbn) do
      nil ->
        IO.puts("Livro nao encontrado no proxy, iniciando busca no objeto base")
        {msg, book} = BookSearch.get_book(isbn)

        case msg do
          :ok      -> update_cache(book)  # A ideia aqui é adicionar book no cache já que o proxy ja conhece ele
                      {:ok, book}
          :error   -> {:error, book}  # retorna msg de erro se não encontrar livro na base de dados
        end

      _ ->
        IO.puts("Livro encontrado no proxy")
        book
    end
  end
end
