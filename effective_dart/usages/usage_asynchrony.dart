import 'dart:async';
import 'dart:developer';
import 'dart:io';
/*
Asynchrony
Dart, eşzamansız programlamayı desteklemek için çeşitli dil özelliklerine 
sahiptir. Aşağıdaki en iyi uygulamalar, zaman uyumsuz kodlama için geçerlidir.

Ham vadeli işlemleri kullanmak yerine zaman uyumsuz/beklemeyi TERCİH EDİN.
Vadeli işlemler gibi güzel bir soyutlama kullanırken bile, eşzamansız kodun 
okunması ve hatalarının ayıklanması çok zordur. async/ sözdizimi okunabilirliği 
artırır ve awaitzaman uyumsuz kodunuzdaki tüm Dart kontrol akış yapılarını 
kullanmanıza izin verir.

Vadeli işlemler gibi güzel bir soyutlama kullanırken bile, eşzamansız kodun 
okunması ve hatalarının ayıklanması çok zordur. async/ sözdizimi okunabilirliği 
artırır ve awaitzaman uyumsuz kodunuzdaki tüm Dart kontrol akış yapılarını 
kullanmanıza izin verir.
*/

downloadTeam(String teamName) {}

/// Good!
Future<int> countActivePlayers(String teamName) async {
  try {
    var team = await downloadTeam(teamName);
    if (team == null) return 0;

    var players = await team.roster;
    return players.where((player) => player.isActive).length;
  } catch (e) {
    log(e.toString());
    return 0;
  }
}

/// Bad!
Future<int> countActivePlayers1(String teamName) {
  return downloadTeam(teamName).then((team) {
    if (team == null) return Future.value(0);

    return team.roster.then((players) {
      return players.where((player) => player.isActive).length;
    });
  }).catchError((e) {
    log(e);
    return 0;
  });
}

/*
async Yararlı bir etkisi olmadığında KULLANMAYIN.

async Eşzamansızlıkla ilgili herhangi bir şey yapan herhangi bir işlevi 
kullanma alışkanlığı kazanmak kolaydır . Ancak bazı durumlarda, yabancıdır. 
async İşlevin davranışını değiştirmeden atlayabilirseniz, bunu yapın.
*/

/// Good!
Future<int> fastestBranch(Future<int> left, Future<int> right) {
  return Future.any([left, right]);
}

/// Bad!
Future<int> fastestBranch1(Future<int> left, Future<int> right) async {
  return Future.any([left, right]);
}

/*
Yararlı async olduğu durumlar şunları içerir:

  kullanıyorsun await. (Bu bariz olanı.)

  Eşzamansız olarak bir hata döndürüyorsunuz. asyncve sonra throwdaha 
  kısadır return Future.error(...).

  Bir değer döndürüyorsunuz ve dolaylı olarak bir geleceğe sarılmasını 
  istiyorsunuz. asyncden daha kısadır Future.value(...).
*/

/// Good!
Future<void> usesAwait(Future<String> later) async {
  print(await later);
}

Future<void> asyncError() async {
  throw 'Error!';
}

Future<void> asyncValue() async => 'value';

/*
Bir akışı dönüştürmek için daha yüksek dereceli yöntemler kullanmayı DÜŞÜNÜN.

Bu, yinelenebilirler hakkındaki yukarıdaki öneriyle paraleldir. Akışlar aynı 
yöntemlerin çoğunu destekler ve ayrıca hataları iletme, kapatma vb. gibi 
şeyleri doğru şekilde işler.
*/
/*
Doğrudan Completer kullanarak KAÇININ.
Asenkron programlamada yeni olan birçok kişi, geleceği üreten kodlar yazmak 
ister. Future'daki yapıcılar ihtiyaçlarını karşılamıyor gibi görünüyor, bu 
yüzden sonunda Completer sınıfını bulup onu kullanıyorlar.
*/

/// Bad!
Future<bool> fileContainsBear(String path) {
  var completer = Completer<bool>();

  File(path).readAsString().then((contents) {
    completer.complete(contents.contains('bear'));
  });

  return completer.future;
}

// İki tür düşük seviyeli kod için tamamlayıcı gereklidir: yeni asenkron
// ilkeller ve gelecekleri kullanmayan asenkron kodla arayüz oluşturma.
// Diğer kodların çoğu async/await veya kullanmalıdır Future.then(), çünkü
// bunlar daha nettir ve hata işlemeyi kolaylaştırır.

/// Good!
Future<bool> fileContainsBear1(String path) {
  return File(path).readAsString().then((contents) {
    return contents.contains('bear');
  });
}

Future<bool> fileContainsBear2(String path) async {
  var contents = await File(path).readAsString();
  return contents.contains('bear');
}

/*
DO tipi argümanı olabilecek Future<T>bir belirsizliği ortadan kaldırırken 
test edin .FutureOr<T>Object

a ile yararlı bir şey yapmadan önce FutureOr<T>, genellikle bir veya çıplak 
is olup olmadığını görmek için bir kontrol yapmanız gerekir . Tür bağımsız 
değişkeni örneğindeki gibi belirli bir türse, hangi testi kullandığınızın önemi 
yoktur veya . Her ikisi de çalışır çünkü bu iki tür ayrıktır .Future<T> 
T FutureOr<int> is int is Future<int>

Ancak, değer türü ise Objectveya muhtemelen ile örneklenebilecek bir tür 
parametresi ise Object, iki dal örtüşür. Future<Object> kendisi uygular Object, 
yani is Objectnesne bir gelecek olduğunda bile true dönüşleriyle is T 
başlatılabilen Tbazı tür parametreleri nerededir . ObjectBunun yerine, 
Future durumu açıkça test edin:
*/
/// Good!
Future<T> logValue<T>(FutureOr<T> value) async {
  if (value is Future<T>) {
    var result = await value;
    print(result);
    return result;
  } else {
    print(value);
    return value;
  }
}

/// Bad!
Future<T> logValue1<T>(FutureOr<T> value) async {
  if (value is T) {
    print(value);
    return value;
  } else {
    var result = await value;
    print(result);
    return result;
  }
}
