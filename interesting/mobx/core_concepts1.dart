/*
Observables - Байкоочулар


MobXтин жүрөгүндө үч маанилүү түшүнүк бар: 
  Байкоочулар, 
  Аракеттер, 
  Реакциялар.

Байкоочу көрсөткүчтөр колдонмоңуздун реактивдүү абалын билдирет. Алар татаал 
объект дарактарга жөнөкөй скалярлар болушу мүмкүн. Колдонмонун абалын байкоого 
болот дарагы катары аныктоо менен, сиз UI (же колдонмодогу башка байкоочулар) 
керектеген реактивдүү абал дарагын көрсөтө аласыз

Бул термин reactive dataмаалыматтарга өзгөртүү ар бир кызыкдар байкоочуга 
билдирме жөнөтүлөт дегенди билдирет. Бул классикалык Observer Design Pattern 
колдонмо болуп саналат.

Жөнөкөй реактивдүү эсептегич төмөнкү байкалуучу менен көрсөтүлөт:
import 'package:mobx/mobx.dart';

final counter = Observable(0);

Класстар сыяктуу дагы татаал байкоолор түзүлүшү мүмкүн.

class Counter {
  Counter() {
    increment = Action(_increment);
  }

  final _value = Observable(0);
  int get value => _value.value;

  set value(int newValue) => _value.value = newValue;
  late Action increment;

  void _increment() {
    _value.value++;
  }
}
*/
/*
Биринчи караганда, бул тез эле колунан чыгып кете турган кандайдыр бир коду 
окшойт! Мына ошондуктан биз пабжогорудагы кодду төмөнкү менен алмаштырууга 
мүмкүндүк берген аралашмага коштук:

import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
*/
/*
Computed Observables - Эсептелген байкоолор

Колдонмоңуздун абалы негизги абалдан жана туунду абалдан турат. 
Негизги абал - бул сиз иштеп жаткан доменге мүнөздүү абал. Мисалы, эгер сизде 
Contact ишкана бар болсо, жана firstName негизги абалын lastName түзөт. Бирок, 
туунду- абалы , айкалыштыруу менен алынган жана. 
Contact fullName firstName lastName

Негизги абалга же башка туунду абалга көз каранды болгон мындай туунду абал 
Эсептелген байкоочу деп аталат . Негизги байкала турган нерселер өзгөргөндө, ал 
автоматтык түрдө шайкештештирилет.

import 'package:mobx/mobx.dart';

part 'contact.g.dart';

class Contact = ContactBase with _$Contact;

abstract class ContactBase with Store {
  @observable
  String firstName;

  @observable
  String lastName;

  @computed
  String get fullName => '$firstName, $lastName';
*/
/*
Actions - Аракеттер

Аракеттер - бул байкалуучу нерселерди кантип мутациялооңуз. Иш-аракеттер аларды 
түздөн-түз мутациялоонун ордуна, мутацияларга семантикалык маани кошот. Мисалы, 
жөн эле жасоонун ордуна, value++бир иш- increment()аракетти атоо көбүрөөк 
мааниге ээ. Мындан тышкары, иш-аракеттер бардык эскертмелерди топтойт жана 
өзгөртүүлөр аяктагандан кийин гана билдирилет. Ошентип, байкоочулар иш-аракет 
атомдук аяктагандан кийин гана кабарланат.

Иш-аракеттерди уяга салууга да болорун эске алыңыз, бул учурда эң жогорку аракет 
аяктаганда эскертмелер өчөт.

final counter = Observable(0);

final increment = Action((){
  counter.value++;
});

import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
*/
/*
Reactions - Реакциялар
Реакциялар MobX триадасын байкоого болот , аракеттер жана реакциялар менен 
толуктайт . Алар реактивдүү-системанын байкоочулары болуп саналат жана алар 
көзөмөлдөгөн байкала турган нерсе өзгөргөн сайын кабар алышат. Реакциялар 
төмөндө келтирилгендей бир нече даамда болот. Алардын баары ReactionDisposer 
реакцияны жок кылуу үчүн чакырыла турган функцияны кайтарышат.

Реакциялардын бир таң калыштуу өзгөчөлүгү – алар эч кандай ачык зымдарсыз 
бардык байкала турган нерселерге автоматтык түрдө көз салып турат. Реакциянын 
ичиндеги байкала турган нерсени окуу актысы аны байкоо үчүн жетиштүү!

import 'package:mobx/mobx.dart';

final greeting = Observable('Hello World');

final dispose = autorun((_){
  print(greeting.value);
});

greeting.value = 'Hello MobX';

// Done with the autorun()
dispose();


// Prints:
// Hello World
// Hello MobX

ReactionDisposer reaction<T>(T Function(Reaction) fn, void Function(T) effect)

Функциянын ичинде колдонулган байкалуучу нерселерди көзөмөлдөйт жана көзөмөлдөө 
функциясы башка маанини кайтарганда fn()иштетет . effect()Ичиндеги байкоолор 
гана fn()байкалат.

import 'package:mobx/mobx.dart';

final greeting = Observable('Hello World');

final dispose = reaction((_) => greeting.value, (msg) => print(msg));

greeting.value = 'Hello MobX'; // Cause a change

// Done with the reaction()
dispose();


// Prints:
// Hello MobX
*/
/*
Observer - Байкоочу

Колдонмодогу эң визуалдык реакциялардын бири - UI. Observer виджети 
(ал нын бир бөлүгү болуп саналат ), анын функциясында колдонулган байкоочупаб 
элементтердин гранулдуу байкоочусун камсыз кылат . builderБул байкала турган 
нерселер өзгөргөндө, Observerкайра түзүлөт жана көрсөтүлөт.

Төмөндө толугу менен Counter мисалы болуп саналат.

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

class CounterExample extends StatefulWidget {
  const CounterExample();

  @override
  CounterExampleState createState() => CounterExampleState();
}

class CounterExampleState extends State<CounterExample> {
  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('MobX Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Observer(
                  builder: (_) => Text(
                        '${counter.value}',
                        style: const TextStyle(fontSize: 40),
                      )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counter.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}

*/
