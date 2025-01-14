
defmodule SortStrategys do

  def quick_sort(elements) do
    IO.puts("Simula ordenação do método quicksort")
  end

  def bubble_sort(elements) do
    IO.puts("Simula ordenação do método quicksort")
  end

end

defmodule MyList do
  defstruct elements: [], strategy: &SortStrategys.bubble_sort/1

  def new(elements) do
    %MyList{elements: elements}
  end

  def set_sort_strategy(%MyList{} = my_list,strategy_fun) when is_function(strategy_fun, 1) do
    %{my_list | strategy: strategy_fun}
  end

  def sort(%MyList{elements: elements, strategy: strategy_fun}) do
    strategy_fun.(elements)
  end
end
