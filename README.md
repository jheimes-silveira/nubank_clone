## Archtecture

A arquitetura principal é baseada em MicroApps, onde cada parte é um "Template de Pacote" diferente.

## Clean Architecture

Um objetivo importante da Clean Architecture é fornecer aos desenvolvedores uma maneira de organizar o código de forma que encapsule a lógica de negócios, mas mantenha-o separado do mecanismo de entrega.

### Vantagens

Utilizar uma arquitetura em camadas são muitas, porém podemos pontuar algumas que fazem sentido ao projeto:

- Testável As regras de negócios podem ser testadas sem a interface do usuário, banco de dados, servidor ou qualquer outro elemento externo,
Independente da interface do usuário. A interface do usuário pode mudar facilmente, sem alterar o restante do sistema.

- Independente de banco de dados. Você pode trocar o Oracle ou SQL Server, por Mongo, BigTable, CouchDB ou qualquer outro. Suas regras de negócios não estão vinculadas ao banco de dados.

- Independente de qualquer agente externo. Na verdade, suas regras de negócios simplesmente não sabem nada sobre o mundo exterior, não estão ligadas a nenhum Framework.

A separação de camadas poupará o desenvolvedor de muitos problemas futuros com a manutenção do software, a regra de dependência bem aplicada deixará seu sistema completamente testável. Quando um framework, um banco de dados, ou uma API se tornar obsoleta a substituição de uma camada não será uma dor de cabeça, além de garantir a integridade do core do projeto. Para mais detalhes de cada camada da Clean Architecture podemos ver no [blog do Uncle Bob.](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## Getting Started

### Flutter modular
Para estrutura de modulos e injeção de dependencias usamos o flutter_modular
Para mais detalhes
[flutter_modular](https://pub.dev/packages/flutter_modular)


### Gerencia de estado

para gerencia de estado, estamos usando [MobX](https://pub.dev/packages/mobx)

Adiciona as possiveis anotações seu código MobX com:
`@observable`, `@computed`, `@action`
tornando-o super simples de usar o MobX.

as classes store são abstratas e usam o mixin Store. Ao executar o build_runner, ele gerará automaticamente o arquivo * .g.dart que deve ser importado em seu arquivo.

```dart
import 'package:mobx/mobx.dart';

// Include generated file
part 'todos.g.dart';

// This is the class used by rest of your codebase
class Todo = TodoBase with _$Todo;

// The store-class
abstract class TodoBase with Store {
  TodoBase(this.description);

  @observable
  String description = '';

  @observable
  bool done = false;
}
```

Ao executar o comando abaixo:

``` terminal
$> cd $YOUR_PROJECT_DIR

// ele vai atualizar todos seus arquivos do mobx e gerar os arquivos .g.dart
$> flutter packages pub run build_runner build

// ele vai ficar observando seus arquivos do mobx e automaticamente ira gerar os arquivos .g.dart
$> flutter packages pub run build_runner watch
```

Comando opcional: Assume que as saídas conflitantes no pacote de usuários são de compilações anteriores e pula o prompt do usuário que normalmente seria fornecido:

``` terminal
$> flutter packages pub run build_runner build --delete-conflicting-outputs
```

Ou

``` terminal
$> flutter packages pub run build_runner watch --delete-conflicting-outputs
```

## Estrutura de pastas

Assumindo que o aplicativo crescerá, é essencial manter uma estrutura escalonável para suportar tal crescimento, a fim de facilitar a localização dos arquivos e possíveis alterações adicionais na estrutura de pastas.

Observação! O [+] indica que a pasta possui arquivos adicionais.

``` tex
|-- lib
    |-- app
        |-- main.dart
        |-- core
            |--[+] extensions
            |--[+] shared
            |--[+] utils
        |-- modules
            |-- home
                |--[+] data
                    |--[+] datasources
                    |--[+] repositories
                |--[+] domain
                    |--[+] entities
                    |--[+] failures
                    |--[+] repositories
                    |--[+] usecases
                |--[+] external
                    |--[+] datasource
                        |--[+] api
                |--[+] presentation
                    |--[+] widgets
                    |--[+] pages

```

##### core

O `core` é onde devem ficar os dados que serão persistidos na aplicação, onde consumirão bibliotecas externas, arquivos comuns entre a aplicação, interceptores de requisições e serviços com as negociações para atender as telas.

``` tex
 |-- core
    |--[+] shared
    |--[+] utils
```

##### modules

Para cada novo recusos dentro do projeto deve ser criado uma nova `modules` dentro da pasta modules, pois para cada nova feature deve conter toda a logica referente a nova `feature` assim se pode manter um projeto fracamente acoplado e testável.

``` tex
  |--[+] modules
      |--[+] home
```

##### data

Esta camada suporta a camada de Domínio implementando suas interfaces. Para fazer isso, ele deve adaptar os dados externos para que cumpram os contratos de domínio.

``` tex
    |-- home
        |--[+] data
```

##### domain

A camada de Domínio conterá nossas regras de negócios principais (entidade) e regras de negócios específicas do aplicativo (casos de uso).

``` tex
    |-- home
        |--[+] domain
```

##### external

Aqui implementamos os acessos externos que dependem de um hardware, pacote ou acesso altamente específico.

``` tex
    |-- home
        |--[+] external
```

##### presentation

A camada Presenter é responsável por declarar o I/O e as interações da aplicação.

``` tex
    |-- home
        |--[+] presentation
```