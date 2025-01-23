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

