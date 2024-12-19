defmodule SortStrategy do
  @callback sort(list()) :: {:ok,any()}
end

defmodule BubbleSortStrategy do
  @behaviour SortStrategy

  @impl SortStrategy
  def sort(elements) do
    IO.puts("Simula ordenação do método bolha")
  end
end

defmodule MyList do
  defstruct elements: [], strategy: BubbleSortStrategy

  def new(elements) do
    %MyList{elements: elements}
  end

  def set_sort_strategy(%MyList{} = my_list,strategy_atom) do
    case strategy_atom do
      :bubble_sort -> %{my_list | strategy: BubbleSortStrategy}

      _ -> %{my_list | strategy: BubbleSortStrategy}   # Default
    end

  end

  def sort(%MyList{elements: elements, strategy: strategy_module}) do
    strategy_module.sort(elements)
  end
end
