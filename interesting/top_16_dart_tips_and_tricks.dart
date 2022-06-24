/// https://codewithandrea.com/videos/top-dart-tips-and-tricks-for-flutter-devs/
/*
Top 16 Dart Tips and Tricks Every Flutter Developer Should Know

Bu eğitimde, bir Flutter geliştiricisi olarak kodlama stilinizi geliştirecek 
en iyi Dart ipuçlarımı ve püf noktalarımı paylaşıyorum.

Bunları daha kısa ve etkili kod yazmak ve Dart dilinden en iyi şekilde 
yararlanmak için kullanabilirsiniz.

Hazır? Başlayalım!

1. Biliyor muydunuz? Dart, dize çarpmasını destekler.
İşte dize çarpımı ile bir Noel ağacının nasıl yazdırılacağını gösteren basit 
bir program:
*/

void main1() {
  for (var i = 1; i <= 5; i++) {
    print('🎄' * i);
  }
}

/*
2. Aynı anda birden fazla Futures yürütmeniz mi gerekiyor? 
Future.wait'i kullanın.
*/
// Mock API class
class CovidAPI {
  Future<int> getCases() => Future.value(1000);
  Future<int> getRecovered() => Future.value(100);
  Future<int> getDeaths() => Future.value(10);
}

/*
Tüm bu vadeli işlemleri aynı anda yürütmek için Future.wait. Bu, bir listeyi 
veya vadeli işlemleri alır ve listelerin geleceğini döndürür :
*/
void main2(List<String> args) async {
  final api = CovidAPI();
  final values = await Future.wait([
    api.getCases(),
    api.getRecovered(),
    api.getDeaths(),
  ]);
  print(values); // [1000, 100, 10]
}

/// Bu, vadeli işlemler bağımsız olduğunda ve bunların sıralı olarak
/// yürütülmesi gerekmediğinde idealdir .

/*
3. Dart sınıflarınızda bir işlev gibi çağrılabilir hale getirmek için bir 
"çağrı" yöntemi uygulayın.
*/
class PasswordValidator {
  bool call(String password) {
    print(password);
    return password.length > 10;
  }
}

/// Yöntemin adı olduğundan call, bir sınıf örneği bildirebilir ve onu bir y
/// öntemmiş gibi kullanabiliriz :
void main3(List<String> args) {
  final validator = PasswordValidator();
  validator('test');
  validator('test1234');
  validator.call('not-so-frozen-arctic');
}

/*
5. Anonim işlevlerin ve işlevlerin argüman olarak kullanılması
Dart'ta işlevler birinci sınıf vatandaşlardır ve diğer işlevlere 
argüman olarak iletilebilir .

Anonim bir işlevi tanımlayan ve onu bir sayHideğişkene atayan bazı kodlar:
*/

void main5() {
  final sayHi = (name) => 'Hi, $name';
  welcome(sayHi, 'Andrea');
}

void welcome(String Function(String) greet, String name) {
  print(greet(name));
  print('Welcome to this course');
}

/*
11. Yalnızca bir kez somutlaştırılabilen bir sınıfa mı ihtiyacınız var 
(aka singleton)? Özel bir oluşturucu ile statik bir örnek değişkeni kullanın.

Bir singleton'un en önemli özelliği, tüm programınızda onun yalnızca bir 
örneğinin bulunabilmesidir. Bu, dosya sistemi gibi şeyleri modellemek için 
kullanışlıdır.
*/
// file_system.dart
class FileSystem {
  FileSystem._();
  static final instance = FileSystem._();
}

void main(List<String> args) {
  final f1 = FileSystem.instance;
  final f2 = FileSystem.instance;
  print(f1 == f2);
}
