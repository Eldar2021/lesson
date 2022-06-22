/*
Metadata

meta veri
Kodunuz hakkında ek bilgi vermek için meta verileri kullanın. Bir meta veri 
ek açıklaması, karakteriyle başlar @, ardından derleme zamanı sabitine bir 
başvuru gelir (örneğin,deprecated ) bir başvuru ya da bir sabit oluşturucuya 
yapılan bir çağrı gelir.

Three annotations are available to all Dart code: @Deprecated, @deprecated, 
and @override. For examples of using @override, see Extending a class. 
Here’s an example of using the @Deprecated annotation:
*/
class Television {
  /// Use [turnOn] to turn the power on instead.
  @Deprecated('Munu koldonbonuz')
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {
    print('yas');
  }
  // ···
}

void main(List<String> args) {
  final t1 = Television();
  // ignore: deprecated_member_use_from_same_package
  t1.activate();

  t1.turnOn();

  doSomething();
}
/*
Kendi meta veri açıklamalarınızı tanımlayabilirsiniz. @TodoAşağıda , iki 
bağımsız değişken alan bir ek açıklama tanımlama örneği verilmiştir :
*/
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}

/*
Meta veriler bir kitaplık, sınıf, typedef, type parametresi, yapıcı, fabrika, 
işlev, alan, parametre veya değişken bildiriminden önce ve bir içe veya dışa 
aktarma yönergesinden önce görünebilir. Yansımayı kullanarak çalışma zamanında 
meta verileri alabilirsiniz.
*/
