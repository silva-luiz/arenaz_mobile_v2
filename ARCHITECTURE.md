# ARCHITECTURE

## Goal

This doc has the main goal to organize the process of app development.

This project follows the [Architecting_Flutter_Apps] approach, but uses most of the Clean Architecture naming scheme. This way, it is accessible to people who have not yet studied the Google suggested architecture for Flutter, but still uses state-of-the-art mobile development conventions.

Just like Clean Architecture, Google [Architecting_Flutter_Apps] organizes the code to be independent of frameworks, UI, databases, or any external agents, and is divided into several layers.

Below is a detailed explanation of the structure and components of the project. This project will omit some layers, most importantly Usecases, which increase the complexity of the architecture by adding more classes and higher cognitive load. Testing requires additional mocks and adds additional boilerplate to your code.

## Index

- [Project Structure](#project-structure)
- [Single source of truth (SSOT)](#single-source-of-truth-ssot)
- [Nomenclature Standardization](#nomenclature-standardization)
  - [Domain Layer](#domain-layer)
  - [Data Layer](#data-layer)
  - [Presentation Layer](#presentation-layer)
- [How the UI must be built](#how-the-ui-must-be-built)
  - Domain Layer:
    - [Entity](#entities)
    - [Repository](#repository)
  - Data Layer:
    - [Service](#service)
    - [RepositoryImpl](#repositoryImpl)
    - [Model](#model)
  - Presentation Layer:
    - [View](#view)
    - [ViewModel](#viewmodel)
    - [Widgets](#widgets)
- [New Module](#new-module)
  - [Module](#module)
  - [Routes](#routes)
  - [Binds](#binds)
- [State Management](#state-management)
- [Command Pattern](#command-pattern)
- [Models - Serialization, Deserialization, and Much More](#models---serialization-deserialization-and-much-more)
- [Form and Validations](#form-and-validations)
- [HTTP Request](#http-request)
- [Tests](#tests)
  - [Model test](#model-test)
  - [Service test](#service-test)
- [Packages](#packages)
- [Resources](#resources)
- [Studies](#studies)

## Project Structure

Domain:

- Entities: Defines the domain entities.
- Repository: Defines interfaces for accessing data.

Data:

- Service: Defines data access services.
- RepositoryImpl: Implements the interfaces defined in the Domain layer.
- Model: Defines Data representations exchanged with the API and what response and request must contain.

Presentation:

- View: Describe how to present application data to the user. Specifically, it refers to a _composition of widgets_ that make a feature.
- Widgets: Contains specific widgets used on the pages.
- Viewmodel: The view model implements properties and commands to which the view can bind data and notifies the view of any state changes through change notification events.

![IMAGE ALT TEXT HERE](./readme_assets/ARCHITECTURE.svg)

Directory Estucture

```shell
    lib
    |____shared
    | |____config
    | |____utils
    | |____ui
    | | |____<shared widgets>
    | |____themes
    | |____errors
    |____app
    | |____features
    | | |____<feature name>
    | | | |____domain
    | | | | |____entities
    | | | | | |____<example_entity>
    | | | | |____repository
    | | | | | |____<example_repository>
    | | | |____data
    | | | | | |____model
    | | | | | | |____<example_model>
    | | | | | |____service
    | | | | | | |____<example_service>
    | | | | | |____repository
    | | | | | | |____<example_repository_impl>
    | | | |____presenter
    | | | | |____<page View>
    | | | | |____<page ViewModel>
    |____routing
    |____<app View>
    |____<app ViewModel>
    |____main.dart

    // The test folder contains unit and widget tests
    test
    |____data
    |____domain
    |____ui
    |____utils

    // The testing folder contains mocks other classes need to execute tests
    testing
    |____fakes
    |____models
```

## Single source of truth (SSOT)

Every data type in your app should have a single source of truth (SSOT). The source of truth is responsible for representing local or remote state. If the data can be modified in the app, the SSOT class should be the only class that can do so.

This can dramatically reduce the number of bugs in your application, and it can simplify code because you'll only ever have one copy of the same data.

Generally, the source of truth for any given type of data in your application is held in a class called a Repository, which is part of the data layer. There is typically one repository class for each type of data in your app.
(from: [Architecting_Flutter_Apps])

The only source of truth MUST be the repository, if the data is remote the repository it will fetch from WebSocket and if it is local will fetch from SharedPreferences.
The respository is reposible for returning the data, if the module the depends on data from other module, first should search in [Shared_preferences], than only if it's empty fetch remotly.

## Standardization of Nomenclature

Nomenclature for Layers and Components.

#### Domain Layer:

    Entities: example_entity.dart

    Repository: example_repository.dart

#### Data Layer:

    Service: example_service.dart

    RepositoryImpl: example_repository_impl.dart

    Model: example_model.dart

#### Presentation Layer:

    View: example_view.dart

    ViewModel: example_viewmodel.dart

    Widgets: example_widget.dart

## [How the UI must be built](#how-the-ui-must-be-built)

All modules must save all data represented by the domain layer in SharedPreferences.

It is strictly forbidden to directly send data between modules. Modules that need data to initialize must retrieve it from [Shared_Preferences].

### Domain Layer:

#### Entities

```dart
abstract class ExampleEntity {
  final String name;
  final double height;

  ExampleEntity({
    required this.name,
    required this.height,
  });
}
```

#### Repository

```dart
abstract class ExampleRepository {
  Stream<ExampleEntity> getExamples();
}
```

### Data Layer:

#### Service

```dart
class ServiceExample {
  final WebSocketChannel channel;

  ServiceExample(this.channel);

  Stream<ExampleModel> getExamples() {
    return channel.stream.map((event) => ExampleModel.fromJson(event));
  }
}
```

#### RepositoryImpl

```dart
class ExampleRepositoryImpl implements ExampleRepository {
  final ServiceExample service;

  ExampleRepositoryImpl(this.service);

  @override
  Stream<ExampleEntity> getExamples() => service.getExamples();
}
```

#### Model

```dart
part 'freezed_model.freezed.dart';

part 'freezed_model.g.dart';

@freezed
class ExampleModel extends ExampleEntity with _$ExampleModel {
  factory ExampleModel({
    required String name,
    required double height,
  }) = _ExampleModel;

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);
}
```

### Presentation Layer:

#### View

```dart
class ExampleView extends StatefulWidget {
  const ExampleView({super.key});

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CronosDSExampleWidget(),
    );
  }
}
```

#### ViewModel

To run the MobX build runner, navigate to the 'cronos_base_app' directory.

```shell
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

```dart
import 'package:mobx/mobx.dart';

part 'example_viewmodel.g.dart';

class ExampleViewModel = ExampleViewModelBase with _$ExampleViewModel;

abstract class ExampleViewModelBase with Store {
    @observable
    ObservableList<MessageEntity> messages = ObservableList<MessageEntity>();

    webSocketStoreBase() {
        repository.getExamples().listen((example) {
            addExample(example);
        });
    }

    @action
    void addExample(String value) => examples.add(value);

    @action
    void sendMessage(String message) {
        repository.sendMessage(message);
    }

    @observable
    String name ='';


    @action
    void setName(String value) => name = value;
}

```

#### Widgets

```dart
class CronosDSExampleWidget extends StatelessWidget {
  const CronosDSExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Example'),
    );
  }
}
```

### New Module

Example a new module is available in "readme_assets\placeholders\placeholder_module"

#### Module

Routes and binds must be in their own files.

```dart
class AppModule extends Module {
   @override
  void binds(i) => appBinds(i);

  @override
  void routes(r) => appRoutes(r);
}
```

#### Routes

Route names must be used as enums to avoid errors in navigation.

```dart
enum AppRouteNamed {
  first,
  second,
}


extension AppRouteNamedExtension on AppRouteNamed {
  String get path {
    switch (this) {
      case AppRouteNamed.first:
        return '/first';
      case AppRouteNamed.second:
        return '/second';
    }
  }
}

List<ModularRoute> getAppRoutes() {
  return [
    r.child(AppRouteNamed.first.path, child: (context) => const HomePage());
    r.child(AppRouteNamed.second.path, child: (context) => const SecondPage());
  ];
}

```

#### Binds

If there are many of each kind of bind, please insert a comment to separate them.

```dart
List<Bind<Object>> getAppBindings() {
  return [
    // services
    i.addSingleton<WebSocketChannel>(
    () => WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org')),
    );

    i.addSingleton<MessageDatasource>(
      () => MessageDatasourceImpl(i.get<WebSocketChannel>()),
    );

    // repositories
    i.addSingleton<MessageRepository>(
      () => MessageRepositoryImpl(i.get<MessageDatasource>()),
    );

    // viewmodel
    i.addSingleton<ApocStore>(() => ApocStore());
  ];
}
```

### State Management

The default state manager approach for this project is Flutter [Mobx]. As demonstraded [How the UI must be built](#how-the-ui-must-be-built), the Mobx Store should be called Viewmoded to complience to [Architecting_Flutter_Apps]. Find more info at [Mobx_Docs].

#### How to handle View and Widget states

Following [Architecting_Flutter_Apps], we will use enums with the Command design pattern.

We will have two enums for status:

```dart
enum AppViewState {initial, loading, error, warning, success}
```

```dart
enum AppWidgetState {initial, loading, error, warning, success}
```

#### Command Pattern

Functions in the ViewModel should not be called directly; instead, we will use commands.

```dart
abstract class Command<T> {
  Future<T> execute();
  Future<void> undo();
}
```

Create a class that implements Command and receives the necessary parameters for execution. Inside the execute and undo methods, define what should be executed.

```dart
class SendMessageCommand implements Command<void> {
  final MessageRepository repository;
  final String message;

  SendMessageCommand(this.repository, this.message);

  @override
  Future<void> execute() async {
    repository.sendMessage(message);
  }

  @override
  Future<void> undo() async {}
}
```

Example with typed return;

```dart

class ListenMessagesCommand implements Command<Stream<MessageEntity>> {
  final MessageRepository repository;

  ListenMessagesCommand(this.repository);

  @override
  Future<Stream<MessageEntity>> execute() async {
    return repository.getMessages();
  }

  @override
  Future<void> undo() async {}
}
```

In the ViewModel, define a List<Command> and, after calling execute, add the command to the list to maintain a history of all executed commands.

```dart
abstract class ApocStoreBase with Store {
  final MessageRepository repository = Modular.get<MessageRepository>();

  final List<Command<void>> _history = [];

  ApocStoreBase() {
    _listenMessages();
  }

  @observable
  ObservableList<MessageEntity> messages = ObservableList<MessageEntity>();

  @action
  Future<void> sendMessage(String message) async {
    final command = SendMessageCommand(repository, message);
    await command.execute();
    _history.add(command);
  }

  @action
  Future<void> undo() async {
    if (_history.isNotEmpty) {
      final lastCommand = _history.removeLast();
      await lastCommand.undo();
    }
  }

  void _listenMessages() {
    final command = ListenMessagesCommand(repository);
    command.execute().then((stream) {
      stream.listen((message) {
        messages.add(message);
      });
    });
  }
}
```

### Models - Serialization, Deserialization, and Much More

Models must extends their Entity and use [Freezed].

Frezeed own description:

Dart is awesome, but defining a "model" can be tedious. You have to:

- define a constructor + properties
- override toString, operator ==, hashCode
- implement a copyWith method to clone the object
- handle (de)serializatio

### HTTP Request

All HTTP Request implementation must be in Data Layer within service.

```dart
typedef EitherData<T> = Future<Either<String, T>>;

class AuthenticationExempleService {
  Future<EitherData> authenticatePhoneNumber() async {
    final urlParsed =
        Uri.parse(EnvironmentVariablesMap.authentication);

    final jsonResponse = await http.post(
      urlParsed,
    );

    if (jsonResponse.statusCode == 200) {
      return right(jsonResponse);
    } else {
      return DataFailed(jsonResponse.errorMessage);
    }
  }
}
```

### Form and Validations:

Every form must have a GlobalKey and use the Form widget. Navigation between pages of a form MUST use enum.

```dart
// Viewmodel

import 'package:mobx/mobx.dart';

part 'form_viewmodel.g.dart';

enum ExampleFormPages { first, second, third }

class FormViewModel = FormViewModelBase with _$FormViewModel;

abstract class FormViewModelBase with Store {

  @observable
  ExampleFormPages currentFormStep = ExampleFormPages.first;

  @action
  void setCurretFormStep(ExampleFormPages value) => currentFormStep = value;
}

// View
class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _viewModel = Modular.get<FormViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Example'),
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.navigate('modular');
            },
            icon: const Icon(Icons.navigate_before),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              if (_viewModel.currentFormStep == ExampleFormPages.first) ...[
                const FirstPage(),
              ],
              if (_viewModel.currentFormStep == ExampleFormPages.second) ...[
                const SecondPage(),
              ],
              if (_viewModel.currentFormStep == ExampleFormPages.third) ...[
                const ThirdPage(),
              ],
            ],
          );
        },
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> --> with ValidationsMixin <-- {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _viewModel = Modular.get<FormViewModel>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('First'),
          TextFormField(
            controller: _controller,
            validator: (value) => combine([
              () => isNotEmpty(value),
            ]),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _viewModel.setCurretFormStep(ExampleFormPages.second);
              }
            },
            child: const Text('Próximo'),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> --> with ValidationsMixin <-- {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _viewModel = Modular.get<FormViewModel>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Second'),
          TextFormField(
            controller: _controller,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => hasFiveChars(value),
            ]),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _viewModel.setCurretFormStep(ExampleFormPages.third);
              }
            },
            child: const Text('Próximo'),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> --> with ValidationsMixin <-- {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Third'),
          TextFormField(
            controller: _controller,
            validator: (value) => combine([
              () => isNotEmpty(value),
            ]),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Formulário concluído!')),
                );
              }
            },
            child: const Text('Finalizar'),
          ),
        ],
      ),
    );
  }
}
```

Every validator must return a String.

```dart
mixin ValidationsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? 'Este campo é bruh';
    return null;
  }

  String? hasFiveChars(String? value, [String? message]) {
    if (value!.length < 5) {
      return message ?? 'Você deve usar pelo menos 5 caracteres!';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
```

## Handle WebSocket Events

To easily handle the events emitted by the WebSocket server, we will use the Functional paradigm with the [FPDart] package. Enums MUST also be used to define the types of events received; each module will have an Enum with all possible events to be received.

### Service

```dart
import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel channel;

  WebSocketService(String url) : channel = WebSocketChannel.connect(Uri.parse(url));

  Stream<dynamic> get stream => channel.stream;

  void send(String message) {
    channel.sink.add(message);
  }

  void close() {
    channel.sink.close();
  }
}

```

### Events Handler

```dart
enum EventType {
  login,
  transfer,
  balance,
  logout,
  error,
}

class Event {
  final EventType type;
  final dynamic data;

  Event({required this.type, required this.data});

  factory Event.fromJson(Map<String, dynamic> json) {
    final type = _mapStringToEventType(json['type'] as String);
    final data = json['data'];
    return Event(type: type, data: data);
  }

  static EventType _mapStringToEventType(String type) {
    switch (type) {
      case 'login':
        return EventType.login;
      case 'transfer':
        return EventType.transfer;
      case 'balance':
        return EventType.balance;
      case 'logout':
        return EventType.logout;
      default:
        return EventType.error;
    }
  }
}

```

### Viewmodel

```dart
import 'package:fpdart/fpdart.dart';
import 'dart:convert';

class BankViewModel {
  final WebSocketService _webSocketService;

  BankViewModel(this._webSocketService) {
    _webSocketService.stream.listen(_onDataReceived);
  }

  void _onDataReceived(dynamic data) {
    final result = _processEvent(data);

    result.match(
      (left) => print('Error: $left'),
      (right) => _handleEvent(right),
    );
  }

  Either<String, Event> _processEvent(dynamic data) {
    try {
      final Map<String, dynamic> json = jsonDecode(data);
      final event = Event.fromJson(json);
      return Right(event);
    } catch (e) {
      return Left('Failed to process event: ${e.toString()}');
    }
  }

  void _handleEvent(Event event) {
    switch (event.type) {
      case EventType.login:
        print('Handle login event with data: ${event.data}');
        break;
      case EventType.transfer:
        print('Handle transfer event with data: ${event.data}');
        break;
      case EventType.balance:
        print('Handle balance event with data: ${event.data}');
        break;
      case EventType.logout:
        print('Handle logout event with data: ${event.data}');
        break;
      case EventType.error:
        print('Handle error event with data: ${event.data}');
        break;
    }
  }

  void dispose() {
    _webSocketService.close();
  }
}
```

## Tests

The minimum testing coverage for this project has yet to be defined.
If you don't have any experience with testing, start with IBM [Software_Testing].

The package used for test is [Mocktail].

All models and services MUST be tested.

### Model test

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cronos_base_app/app/modular_modules/apoc/test/example_model.dart';

class MockExampleModel extends Mock implements ExampleModel {}

void main() {
  group('ExampleModel Tests', () {
    test('Should create a valid ExampleModel', () {
      // Arrange & Act
      final model = ExampleModel(name: 'Test', height: 1.80);

      // Assert
      expect(model.name, 'Test');
      expect(model.height, 1.80);
    });

    test('Should convert ExampleModel to JSON and back', () {
      // Arrange
      final model = ExampleModel(name: 'Test', height: 1.80);

      // Act
      final json = model.toJson();
      final newModel = ExampleModel.fromJson(json);

      // Assert
      expect(newModel, equals(model));
    });

    test('Should convert JSON to ExampleModel', () {
      // Arrange
      final json = {'name': 'Joselito', 'height': 20.0};

      final modelToAssert = ExampleModel(name: 'Joselito', height: 20.0);
      // Act
      final newModel = ExampleModel.fromJson(json);

      // Assert
      expect(newModel, equals(modelToAssert));
    });

    test('Should mock ExampleModel', () {
      // Arrange
      final mockModel = MockExampleModel();

      when(() => mockModel.name).thenReturn('Mocked Name');
      when(() => mockModel.height).thenReturn(1.75);

      // Act & Assert
      expect(mockModel.name, 'Mocked Name');
      expect(mockModel.height, 1.75);
    });
  });
}
```

### Service test

```dart
class MockWebSocketChannel extends Mock implements WebSocketChannel {}

class MockWebSocketSink extends Mock implements WebSocketSink {}

void main() {
  late MessageDatasourceImpl datasource;
  late MockWebSocketChannel mockWebSocketChannel;
  late MockWebSocketSink mockWebSocketSink;

  setUp(() {
    mockWebSocketChannel = MockWebSocketChannel();
    mockWebSocketSink = MockWebSocketSink();
    when(() => mockWebSocketChannel.sink).thenReturn(mockWebSocketSink);
    datasource = MessageDatasourceImpl(mockWebSocketChannel);
  });

  group('MessageDatasourceImpl', () {
    test('should receive messages from WebSocket', () async {
      // Arrange
      final message = {
        'status': '200',
        'body': 'Logged user',
      };
      final stream = Stream.value(jsonEncode(message));
      when(() => mockWebSocketChannel.stream).thenAnswer((_) => stream);

      // Act
      final result = datasource.getMessages();

      // Assert
      expectLater(result, emits(isA<MessageModel>()));
    });

    test('should send message through WebSocket sink', () {
      // Arrange
      const message = 'Test message';

      // Act
      datasource.sendMessage(message);

      // Assert
      verify(() => mockWebSocketSink.add(message)).called(1);
    });
  });
}
```

## Packages

Packages from The official package repository for Dart and Flutter apps.

- [Web_Socket_Channel] - It provides a cross-platform WebSocketChannel API, a cross-platform implementation of that API that communicates over an underlying StreamChannel, an implementation that wraps dart:io's WebSocket class, and a similar implementation that wraps dart:html's;
- [Mocktail] - Mocktail focuses on providing a familiar, simple API for creating mocks in Dart (with null-safety) without the need for manual mocks or code generation;
- [Mobx] - Supercharge the state-management in your Dart apps with Transparent Functional Reactive Programming (TFRP);
- [Shared_Preferences] - Wraps platform-specific persistent storage for simple data.

#### Studies

- [Tutorial_Flutter_Archi]
- [Tutorial_Flutter_Mobx]
- [Form_Valdation_With_Mixin]
- [Command_Design_Patterns_in_Dart]
- [Flutter_Exceptions_With_FPDart]
- [Functional_Programming_In_Dart]

  [Web_Socket_Channel]: https://pub.dev/packages/web_socket_channel
  [Mocktail]: https://pub.dev/packages/mocktail
  [Mobx]: https://pub.dev/packages/mobx
  [Mobx_Docs]: https://mobx.netlify.app/concepts
  [Architecting_Flutter_Apps]: https://docs.flutter.dev/app-architecture
  [Shared_Preferences]: https://pub.dev/packages/shared_preferences
  [Freezed]: https://pub.dev/packages/freezed
  [Tutorial_Flutter_Archi]: https://www.youtube.com/watch?v=uR9AgDzj1Ro&list=PLXHo6cuAUyZwznl7vLNA5-bYL2BmcIGUD
  [Tutorial_Flutter_Mobx]: https://www.youtube.com/watch?v=quYU0q4DVwQ
  [Form_Valdation_With_Mixin]: https://www.youtube.com/watch?v=HgFstMmYLok&t=3s
  [Command_Design_Patterns_in_Dart]: https://scottt2.github.io/design-patterns-in-dart/command/
  [Functional_Programming_In_Dart]: https://resocoder.com/2023/12/05/practical-functional-programming-in-dart-flutter/
  [Flutter_Exceptions_With_FPDart]: https://www.youtube.com/watch?v=noNs58-CmSE
  [FPdart]: https://pub.dev/packages/fpdart
  [Software_Testing]: https://www.ibm.com/br-pt/topics/software-testing
