# defmodule LoggerSingleton do
#   @instance nil

#   def get_instance() do
#     case @instance do
#       nil ->
#         instance = new_logger()
#         update_state(instance)
#         @instance

#       _ ->
#         nil
#     end
#   end

#   defp new_logger() do
#     self()
#   end

#   def update_state(instance) do
#     @instance = instance
#   end

#   def println(msg) do
#     IO.puts(msg)
#   end
# end

# No caso desse padrão, como em Elixir não tem instancia de classe como eu vou utilizar
# um singleton que visa centralizar uma unica instancia do objeto?
