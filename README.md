# Implementação de Padrões de Projeto em Elixir

UFMG - Monografia em Sistemas de Informação

## Contexto

O paradigma de programação funcional tem se destacado como uma abordagem eficaz para o desenvolvimento de sistemas complexos, graças a propriedades como **imutabilidade**, **funções puras** e uma **gestão eficiente da concorrência**.

No entanto, surge a necessidade de compreender como adaptar e aplicar conceitos e práticas comuns da engenharia de software que tradicionalmente foram desenvolvidos com foco no **paradigma orientado a objetos**. Essa lacuna evidencia o desafio de traduzir melhores práticas para o contexto de outros paradigmas de programação, como o funcional.

Diante desse cenário, este repositório tem como objetivo apresentar implementações coesas de 10 padrões de projeto diferentes no contexto da programação funcional, utilizando a linguagem Elixir. Além de aplicar os conceitos do paradigma funcional, o repositório busca adaptar os padrões para que façam sentido nesse contexto e explicar detalhadamente o raciocínio por trás de cada implementação.

## Introdução

Para compreender este projeto, é fundamental se atentar a alguns conceitos importantes, sendo o primeiro deles os **padrões de projeto**.

Os padrões de projeto têm suas origens no livro “A Pattern Language”, escrito pelo arquiteto civil Christopher Alexander. A proposta do livro era documentar diversos padrões utilizados na construção de cidades e edifícios, com o objetivo de oferecer soluções reutilizáveis e eficazes para problemas comuns nesse contexto.

Em 1995, Erich Gamma, Richard Helm, Ralph Johnson e John Vlissides adaptaram as ideias de Alexander para o universo do desenvolvimento de software. O resultado foi o livro “Design Patterns: Elements of Reusable Object-Oriented Software”, que apresentou um catálogo de soluções para problemas recorrentes no desenvolvimento de sistemas. Nesse contexto, os padrões de projeto foram definidos como:

> "Padrões de projeto descrevem objetos e classes que se relacionam para resolver um problema de projeto genérico em um contexto particular."

O livro [Engenharia de Software Moderna](https://engsoftmoderna.info/), foi utilizado como referência para o desenvolvimento do projeto e é possível encontrar uma explicação mais detalhada a respeito do conceito de padrões de projeto na [introdução do capítulo 6](https://engsoftmoderna.info/).

## Implementações 

### Factory

O padrão de projeto Factory proporciona uma solução flexível para a criação de objetos. Seu objetivo é centralizar a **criação de objetos**, permitindo que o cliente não precise conhecer os detalhes de implementação específicos de cada objeto. Em vez disso, são criadas “fábricas” que têm  a responsabilidade de instanciar o objeto com base em critérios ou configurações fornecidas.

No código implementado, é simulado um sistema de comunicação remota baseado em TCP/IP. A ideia é aplicar o conceito de Factory na criação dos canais de comunicação.

Detalhes a respeito da implementação proposta:

* **Módulo ChannelUser:** esse módulo é o que vai atuar como “ fábrica” de canais. A ideia dele é centralizar o envio de mensagens usando a interface **Channel**, o que faz com que qualquer módulo que implemente o protocolo **Channel** possa ser usado para enviar mensagens.
  
![FactoryIMG1](https://github.com/user-attachments/assets/eb25b368-f6d0-49a0-b0b4-334353aedaca)

* **Protocolo Channel:** define um conjunto de funções que devem ser implementadas por qualquer módulo que deseje atuar como um "tipo" de canal, ou seja, qualquer estrutura que deve se comportar como um canal dentro do sistema.

![FactoryIMG2](https://github.com/user-attachments/assets/4d85d1e8-45e5-4e4a-b9c2-bf25aca7c6ce)

Nesse caso, o método * *send_message* * do módulo **ChannelUser** recebe como parâmetro o canal a ser utilizado, podendo ser qualquer canal que implemente o protocolo **Channel**. 
Como não existe o conceito de instância em Elixir, o **Factory** é usado para que possa ser alterado dinamicamente o canal a ser utilizado sem a necessidade de alterar o código de envio das mensagens.

![FactoryIMG3](https://github.com/user-attachments/assets/95173fa4-5bc4-4bd0-8661-1e93f4444949)

A adaptação do padrão **Factory** para Elixir envolveu a utilização de protocolos e módulos para implementar o conceito de fábrica, uma vez que em Elixir não existem conceitos como: **herança** e **instância de objetos**. Em vez de herança, que é comum em linguagens orientadas a objetos, Elixir usa a **composição** e a **definição de comportamentos através de protocolos**. O ChannelUser foi projetado para trabalhar com o protocolo Channel, realizando a chamada do método de envio de mensagem através do protocolo comum entre os canais. Dessa forma, o padrão Factory foi ajustado para aproveitar as capacidades de Elixir, mantendo a flexibilidade e a centralização da lógica de criação de objetos.

Esse padrão é muito útil em contextos onde novos tipos de objetos podem ser adicionados ao longo do tempo, pois a lógica de criação é centralizada e pode ser modificada sem afetar o código que utiliza esses objetos. No caso do ChannelFactory, ele simplifica a criação e a gestão dos diferentes tipos de canais, permitindo que o sistema se adapte facilmente a novas necessidades ou mudanças nas implementações dos canais.

### Singleton

O padrão **Singleton** tem como objetivo garantir que uma classe tenha apenas uma única instância, proporcionando um ponto global de acesso a essa instância. 

Para implementá-lo em linguagens orientadas a objetos, é necessário controlar o processo de criação de objetos e garantir que independentemente de quantas vezes uma solicitação para criar uma instância for feita, a **mesma instância** vai ser retornada.

No contexto funcional de programação, como é o caso de Elixir, não existe o conceito de instância. Nesse caso, para implementar esse comportamento podemos utilizar de **processos leves** para realizar tarefas similares a instanciação, como é o caso do módulo [GenSever](https://hexdocs.pm/elixir/1.12/GenServer.html). Cada processo em Elixir é isolado e pode manter seu estado, o que permite simular o comportamento de um Singleton utilizando o sistema de processos da linguagem.

Mais detalhes da implementação:

* **módulo GenServer:** para implementar o comportamento esperado, foi utilizado o módulo **GenServer**, que já é definido na linguagem Elixir e fornece uma abstração para criar e gerenciar processos. Dessa forma é possível construir servidores genéricos que possam gerenciar estado e lidar com mensagens de forma assíncrona. Para saber mais sobre esse módulo acesse: [link](https://hexdocs.pm/elixir/1.12/GenServer.html)
* **módulo LoggerSingleton:** utiliza um GenServer para assegurar que apenas uma instância do logger esteja ativa. A ideia é centralizar todo o gerenciamento das operações de log, garantindo que todas as mensagens de log sejam processadas e armazenadas através de uma única “instância”.

### Proxy

O padrão de projeto **Proxy** se baseia na inserção de um objeto para intermediar o acesso ao objeto real. A ideia é  servir como um intermediário que adiciona novas funcionalidades sem a necessidade de alterar a interface original do objeto. Funcionalidades como controle de acesso, registro de atividades, cache são comuns de serem adicionadas no objeto **Proxy**.

A ideia é que os clientes não tenham mais referência ao objeto base, mas sim ao proxy que por sua vez terá referência ao objeto base.

No caso da programação funcional, podemos utilizar o conceito de **Proxy** para gerenciar o acesso a um módulo ou até mesmo uma funcionalidade específica. Em Elixir não existe o conceito de classes e portanto não temos instâncias também, mas é possível replicar esse comportamento usando módulos e funções para criar uma camada de abstração entre o cliente e o módulo base.

Mais detalhes a respeito da implementação proposta:

* **módulo BookSearch:** módulo responsável por realizar a busca de livros.
  
![ProxyIMG1](https://github.com/user-attachments/assets/67ebb300-4574-417d-b641-4eaa651833ea)

* **módulo BookSearchProxy:** atua como camada intermediária entre o cliente e o BookSearch. Esse proxy é utilizado para adicionar a  funcionalidade de cache no sistema de busca.

![ProxyIMG2](https://github.com/user-attachments/assets/055d21e7-9a39-490e-8aef-4f48d3817b74)

Dessa forma, o cliente solicita a busca de um livro através do módulo **BookSearchProxy** que vai verificar se o resultado da pesquisa já está armazenado no cache, caso ainda não esteja ele vai acessar o módulo base **BookSearch** para realizar a busca, retornar o resultado e armazená-lo em cache.

![ProxyIMG3](https://github.com/user-attachments/assets/4e56900e-bfca-4e2c-bb6f-6ff4ed340c3d)

Com essa implementação, o módulo base não será acionado diretamente pelo cliente e só será requisitado se de fato houver necessidade. O que nos permite oferecer uma solução eficiente para gerenciar o módulo base, mantendo a interface consistente para o cliente já que ele não precisa saber que o cache está em uso, ele simplesmente faz uma solicitação e recebe um resultado, independentemente de ele ter sido obtido do cache ou diretamente do módulo de busca.

![Proxydiagrama](https://github.com/user-attachments/assets/247292e5-0903-49d9-9bc6-c8cf385718f6)

Essa abordagem não só melhora o desempenho do sistema, ao reduzir a quantidade de buscas redundantes, mas também mantém a flexibilidade para adicionar outras funcionalidades no futuro. Por exemplo, podem ser incorporadas funcionalidades adicionais como controle de acesso ou registro de consultas sem modificar o módulo **BookSearch**. Assim, o padrão **Proxy** permite que o sistema seja mais modular e adaptável às mudanças.

### Adapter

O padrão **Adapter** foi criado para auxiliar a resolução de problemas de compatibilidade entre objetos. A ideia é permitir que objetos com interfaces incompatíveis consigam se comunicar e trabalhar juntos. A camada de **Adapter** atua como um intermédio entre o cliente e a interface do objeto, convertendo a interface original para um formato que seja compatível com o cliente. Dessa forma é possível “adaptar” objetos existentes para que se encaixem em novos contextos ou sistemas sem a necessidade de alterar o código-fonte original deles.

A implementação proposta simula a interação de projetores de marcas diferentes, que possuem interfaces distintas e incompatíveis entre si. Para resolver essa incompatibilidade, o código define um protocolo comum que o sistema pode usar para controlar qualquer tipo de projetor, independentemente da marca.

Mais detalhes da implementação:

* **módulo ProjetorSamsung e ProjetorLG:** descreve as operações realizadas com o projetor das respectivas marcas.
  
![AdapterIMG1](https://github.com/user-attachments/assets/0cebd57c-2074-4138-a2ea-b27b5185e880)

* **protocolo Projetor:** atua como interface comum para os adapters que vão ser utilizados para utilizar o módulo dos projetores.

![AdapterIMG2](https://github.com/user-attachments/assets/91001a7e-1fc0-4e15-b8d4-11741e0f7054)

* **módulo AdaptadorProjetorSamsung e AdaptadorProjetorLG:** utiliza a interface Projetor para tornar os projetores compatíveis com o esperado pelo cliente que irá utilizar. Esse módulo implementa o protocolo Projetor, e chama internamente as operações específicas do módulo de cada projetor (como por ex para ligar, desligar etc)

![AdapterIMG3](https://github.com/user-attachments/assets/7c0fa8d6-1192-4f2e-9a9a-13e029a5841e)

* **módulo SistemaControleProjetores:** é o “cliente” da aplicação. É basicamente um módulo que chama a função para ligar um Projetor, através do protocolo **Projetor** que é usado como interface nos adaptadores implementados. Dessa forma, o padrão eu consigo trabalhar de forma uniforme com diferentes tipos de projetores, sem precisar se preocupar com as diferenças entre suas interfaces.
  
![AdapterIMG4](https://github.com/user-attachments/assets/8b577961-88c6-4942-8866-c553ff0d2f37)

Essa abordagem é muito útil em cenários onde você precisa integrar componentes que foram desenvolvidos de forma independente ou que seguem padrões diferentes. O Adapter fornece uma solução elegante e flexível, permitindo que esses componentes coexistam e trabalhem juntos sem a necessidade de alterar seu código original.

