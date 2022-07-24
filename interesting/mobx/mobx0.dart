/*
Dart жана Flutter үчүн MobX
Dart жана Flutter колдонмолоруңуз үчүн көйгөйсүз мамлекеттик башкаруу

MobX – бул мамлекеттик башкаруу китепканасы, бул колдонмоңуздун реактивдүү 
маалыматтарын UI (же кандайдыр бир байкоочу) менен туташтырууну 
жеңилдетет. Бул зымдар толугу менен автоматтык жана абдан табигый сезилет. 
Тиркемени иштеп чыгуучу катары сиз UIде (жана башка жерлерде) кандай 
реактивдүү маалыматтар керектелиши керек экенине көңүл бурасыз, экөөнү 
синхрондоштуруудан кабатырланбайсыз.

Бул чындыгында сыйкырдуу эмес, бирок анда эмне керектелип жатканы 
(байкоочу нерселер ) жана кайда ( реакциялар ) айланасында кээ бир акылдуу 
нерселер бар жана аны автоматтык түрдө сиз үчүн көзөмөлдөйт. Байкоочу нерселер 
өзгөргөндө, бардык реакциялар кайра иштетилет. Кызыктуусу, бул реакциялар 
жөнөкөй консолдук журналдан тартып, UIди кайра көрсөтүүгө чейинки тармактык 
чалуулар болушу мүмкүн.

MobX JavaScript колдонмолору үчүн абдан эффективдүү китепкана болгон жана Dart 
тилине бул порт бирдей өндүрүмдүүлүктү алып келүүнү көздөйт.

dependencies:
  mobx: ^2.0.7+4
  flutter_mobx: ^2.0.6+1

dev_dependencies:
  build_runner: ^2.2.0
  mobx_codegen: ^2.0.7

import 'package:mobx/mobx.dart';

// Include generated file
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

--> flutter pub run build_runner build --> flutter pub run build_runner watch

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Wrapping in the Observer will automatically re-render on changes to counter.value
            Observer(
              builder: (_) => Text(
                    '${counter.value}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
*/
