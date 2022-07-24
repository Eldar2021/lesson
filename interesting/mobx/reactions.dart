/*
ObservableList<T>
ObservableSet<T>
ObservableMap<K,V>
ObservableFuture<T>
ObservableStream<T>
*/
/*
@computed ди баалабаңыз
Жөнөкөй, окуу үчүн гана байкала @computedтургандай көрүнгөнү менен, бул сиздин 
эң күчтүү куралыңыз болушу мүмкүн. @computedБашка байкала турган касиеттерди 
түзүү менен, сиз UI кодун кескин жөнөкөйлөтө аласыз жана Виджетиңиздин ичиндеги 
бизнес логикасынын көбүн жок кыла аласыз. Көбүнчө шарттуу логиканы жашыруу жана 
айрым алынган маалыматтарды эсептөө үчүн колдонулат.

Мисалы, Widget ичинде кээ бир маалыматтар ийгиликтүү жүктөлгөндүгүн текшерүүнүн 
ордуна...

Widget build(BuildContext context) {
  final store = Provider.of<Contact>(context);

  return Observer(
      builder: (_) {
        if (store.loadOperation != null &&
            store.loadOperation.status == FutureStatus.fulfilled) {
          return ContactView(store);
        }

        return Container();
      }
  );
}

@computed... деп аталган мүлктү түзө аласыз hasResults...

class _Contact with Store {
  /* rest of the class */

  @observable ObservableFuture<void> loadOperation = null;

  @computed
  bool get hasResults =>
      loadOperation != null &&
      loadOperation.status == FutureStatus.fulfilled;
}

Widget build(BuildContext context) {
  final store = Provider.of<Contact>(context);

  return Observer(
      builder: (_) {
        if (store.hasResults) {
          return ContactView(store);
        }

        return Container();
      }
  );
}

@computed Касиет байкала Observer тургандыктан, ал өзгөргөндө автоматтык 
түрдө көрсөтүлөт!
*/
/*
Реакциянын 3 түрү бар: autorun, reaction, when. Ар бир реакция бир кайтарат 
ReactionDisposer, ал чакырганда реакцияны жок кылат. Реакцияны жок кылуу 
байкалуучу нерселерге байкоо жүргүзүүнү токтотот.

autorun: Узакка созулган реакция жана дароо байкай баштайт.

// example.dart

import 'package:mobx/mobx.dart';
part 'example.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable int counter = 0;
  ReactionDisposer _dispose;

  void setupReactions() {
    _dispose = autorun((_){
      print("Count is $counter");
    });
  }

}

reaction: Узак убакытка созулган реакция жана биринчи өзгөртүүдөн кийин гана 
байкала баштайт. Ал ар кандай көз салынган байкоолор өзгөргөндө эффект берет .

// example.dart

import 'package:mobx/mobx.dart';
part 'example.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable int counter = 0;
  ReactionDisposer _dispose;

  void setupReactions() {
    _dispose = reaction((_) => counter, (int newValue){
      print("Count is now $newValue");
    });
  }

}

when: эффектти ишке ашыруудан мурун шарттын чын болушун күткөн реакция. Эффекти 
иштеткенден кийин, ал автоматтык түрдө жок кылынат. Ошентип when, бир жолку 
реакция!.

// example.dart

import 'package:mobx/mobx.dart';
part 'example.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable int counter = 0;
  ReactionDisposer _dispose;

  void setupReactions() {
    _dispose = when((_) => counter > 10, (){
      print("Count has reached the limit of 10");
    });
  }

}
*/
