# ElixirDesignPatterns

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_design_patterns` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_design_patterns, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/elixir_design_patterns>.

## Teste - factory.ex

- mudar para o diretório lib (cd lib)
- executar "iex factory.ex""
- dentro do iex executar:
  - ChannelFactory.create()

## Teste - adapter.ex

- mudar para o diretório lib (cd lib)
- executar "iex adapter.ex"
- dentro do iex executar:
  - proj_samsung = ProjetorSamsung.new("12345")
  - proj_lg = ProjetorLG.new("12345")
  - adapter_samsung = AdaptadorProjetorSamsung.new(proj_samsung)
  - adapter_lg = AdaptadorProjetorLG.new(proj_lg)
  - SistemaControleProjetores.init(adapter_samsung) #teste projetor samsung
  - SistemaControleProjetores.init(adapter_lg) #teste projetor lg

## Teste - proxy.ex

- mudar para o diretório lib (cd lib)
- executar "iex proxy.ex""
- dentro do iex executar:
  - BookSearchProxy.getBook("123456789") #para o caso que tem o objeto no chache
  - BookSearchProxy.getBook("2") #outro exemplo implementado

## Teste - decorator.ex

- mudar para o diretório lib (cd lib)
- executar "iex decorator.ex""
- dentro do iex executar:
  - tcp_channel = %NewTCPChannel{}
  - zip_channel = %ZipChannel{channel: tcp_channel}
  - NewChannel.send(zip_channel, "Mensagem de teste")
  - NewChannel.receive(zip_channel)

## Teste - strategy.ex

- mudar para o diretório lib (cd lib)
- executar "iex strategy.ex""
- dentro do iex executar:
  - list = MyList.new([5, 2, 9, 1, 5, 6])
  - sorted_list = MyList.sort(list)

## Teste - singleton.ex

- mudar para o diretório lib (cd lib)
- executar "iex singleton.ex""
- dentro do iex executar:
  - {:ok, \_pid} = LoggerSingleton.start_link(nil)
  - LoggerSingleton.println("Hello, Singleton Logger!")
  - LoggerSingleton.get_instance()
