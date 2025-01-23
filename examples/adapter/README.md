# Padrão de projeto: Adapter

Para testar o código implementado siga os seguintes passos:
- mudar para o diretório correto: cd examples -> cd adapter
- executar "iex factory.ex" (mac) ou "iex.bat observer.ex" (windows)
- dentro do iex executar:
  - proj_samsung = ProjetorSamsung.new("12345")
  - proj_lg = ProjetorLG.new("12345")
  - adapter_samsung = AdaptadorProjetorSamsung.new(proj_samsung)
  - adapter_lg = AdaptadorProjetorLG.new(proj_lg)
  - SistemaControleProjetores.init(adapter_samsung) #teste projetor samsung
  - SistemaControleProjetores.init(adapter_lg) #teste projetor lg
