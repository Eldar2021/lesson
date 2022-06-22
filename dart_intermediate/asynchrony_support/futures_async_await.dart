/// https://dart.dev/codelabs/async-await

/*
Asynchronous programming: futures, async, await

Bu codelab size, vadeli işlemleri ve asyncve awaitanahtar sözcüklerini 
kullanarak nasıl eşzamansız kod yazacağınızı öğretir. Gömülü DartPad 
düzenleyicilerini kullanarak, örnek kod çalıştırarak ve alıştırmaları 
tamamlayarak bilginizi test edebilirsiniz.

Bu kod laboratuvarından en iyi şekilde yararlanmak için aşağıdakilere 
sahip olmalısınız:

Temel Dart sözdizimi bilgisi .

Bazıları, başka bir dilde eşzamansız kod yazma konusunda deneyim sahibidir.


Bu codelab aşağıdaki materyalleri kapsar:

asyncve awaitanahtar sözcükleri nasıl ve ne zaman kullanılır .
asyncKullanım ve yürütme sırasını nasıl awaitetkiler.
İşlevlerdeki try-catchifadeler kullanılarak zaman uyumsuz bir 
  çağrıdan kaynaklanan hatalar nasıl işlenir .async
Bu codelab'i tamamlamak için tahmini süre: 40-60 dakika.
*/

/*
Asenkron kod neden önemlidir?
Eşzamansız işlemler, başka bir işlemin bitmesini beklerken programınızın işi 
tamamlamasına izin verir. İşte bazı yaygın eşzamansız işlemler:

Bir ağ üzerinden veri alma.
Bir veritabanına yazma.
Bir dosyadan veri okuma.

Bu tür asenkron hesaplamalar genellikle sonuçlarını bir Future veya sonucun 
birden fazla parçası varsa, bir Stream. Bu hesaplamalar bir programa uyumsuzluk 
getirir. Bu ilk eşzamansızlığa uyum sağlamak için diğer düz Dart işlevlerinin 
de eşzamansız hale gelmesi gerekir.

Bu eşzamansız sonuçlarla etkileşim kurmak için asyncve awaitanahtar 
sözcüklerini kullanabilirsiniz. Çoğu zaman uyumsuz işlev, yalnızca doğal 
olarak eşzamansız bir hesaplamaya bağlı, muhtemelen derinlere dayanan 
zaman uyumsuz Dart işlevleridir.
*/
/*
Örnek: Eşzamansız bir işlevi yanlış kullanma
Aşağıdaki örnek, bir eşzamansız işlevi ( fetchUserOrder()) kullanmanın yanlış 
yolunu gösterir. asyncDaha sonra ve kullanarak örneği düzelteceksiniz await. 
Bu örneği çalıştırmadan önce sorunu tespit etmeye çalışın – sizce çıktı 
ne olacak?
*/
String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

void main() {
  print(createOrderMessage());
}

/// Your order is: Instance of '_Future<String>'

/*
fetchUserOrder()Örneğin, sonunda üretilen değeri yazdıramamasının nedeni şudur :

fetchUserOrder()bir gecikmeden sonra kullanıcının sırasını açıklayan bir 
dize sağlayan eşzamansız bir işlevdir: bir "Büyük Latte".

Kullanıcının siparişini almak için createOrderMessage()aramalı fetchUserOrder() 
ve bitmesini beklemelisiniz. Çünkü bitmesini createOrderMessage()beklemez , 
sonunda sağladığı string değerini alamaz 
.fetchUserOrder()createOrderMessage()fetchUserOrder()

Bunun yerine, createOrderMessage()yapılacak bekleyen işin bir temsilini alır: t
amamlanmamış bir gelecek. Gelecek bölümde gelecekler hakkında daha fazla 
bilgi edineceksiniz.

createOrderMessage()Kullanıcının siparişini açıklayan değeri alamadığından, 
örnek konsola “Large Latte” yazdıramaz ve bunun yerine 
“Siparişiniz: Instance of '_Future<String>'” yazdırır .
*/

/*
Anahtar terimler:

senkron işlem : Senkron bir işlem, tamamlanıncaya kadar diğer işlemlerin 
yürütülmesini engeller.

senkron fonksiyon : Senkron bir fonksiyon sadece senkron işlemleri 
gerçekleştirir.

asenkron işlem : Bir kez başlatıldığında, asenkron bir işlem tamamlanmadan 
önce diğer işlemlerin yürütülmesine izin verir.

asenkron fonksiyon : Asenkron bir fonksiyon en az bir asenkron işlem 
gerçekleştirir ve aynı zamanda senkronize işlemler de gerçekleştirebilir.
*/
/*
What is a future?
Gelecek nedir?
Future (küçük harf "f"), Future (büyük harfle "F") sınıfının bir örneğidir . 
Gelecek, zaman uyumsuz bir işlemin sonucunu temsil eder ve iki durumu olabilir: 
tamamlanmamış veya tamamlanmış. 

tamamlanmamış
Eşzamansız bir işlevi çağırdığınızda, tamamlanmamış bir gelecek döndürür. 
Bu gelecek, işlevin eşzamansız işleminin bitmesini veya bir hata 
atmasını bekliyor.

Tamamlanmış
Eşzamansız işlem başarılı olursa, gelecek bir değerle tamamlanır. 
Aksi takdirde, bir hata ile tamamlanır.

Bir değerle tamamlama
type geleceği, type Future<T>değeriyle tamamlanır T. Örneğin, tür içeren bir 
gelecek, Future<String>bir dize değeri üretir. Bir gelecek kullanılabilir bir 
değer üretmiyorsa, geleceğin tipi Future<void>.

Hata ile tamamlanıyor
Fonksiyon tarafından gerçekleştirilen asenkron işlem herhangi bir nedenle 
başarısız olursa, gelecek bir hata ile tamamlanır.
*/

Future<void> fetchUserOrder1() {
  // Imagine that this function is fetching user 
  // info from another service or database.
  return Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
}

void main1() {
  fetchUserOrder();
  print('Fetching user order...');

  /// Fetching user order...
  /// Large Latte
}
/*
fetchUserOrder()Önceki örnekte, 8. satırdaki çağrıdan önce yürütülse bile 
print()konsol, çıktıdan önce satır 8'den ("Kullanıcı siparişi getiriliyor...") 
çıktıyı fetchUserOrder()("Large Latte") gösterir. Bunun nedeni, 
fetchUserOrder()"Large Latte" yazdırmadan önceki gecikmelerdir.
*/

/*
Örnek: Bir hatayla tamamlama
Bir geleceğin bir hatayla nasıl tamamlandığını görmek için aşağıdaki örneği 
çalıştırın. Biraz sonra hatayı nasıl ele alacağınızı öğreneceksiniz.
*/
Future<void> fetchUserOrder2() {
// Imagine that this function is fetching user info but encounters a bug
  return Future.delayed(
    const Duration(seconds: 2),
    () => throw Exception('Logout failed: user ID is invalid'),
  );
}

void main2() {
  fetchUserOrder();
  print('Fetching user order...');

  /// Fetching user order...
  /// Uncaught Error: Exception: Logout failed: user ID is invalid
}
/*
Hızlı inceleme:

Bir Future<T> örneği, türünde bir değer üretir T.

Bir gelecek kullanılabilir bir değer üretmiyorsa, geleceğin tipi Future<void>.

Bir gelecek iki durumdan birinde olabilir: tamamlanmamış veya tamamlanmış.

Bir gelecek döndüren bir işlevi çağırdığınızda, işlev yapılacak işleri sıraya 
koyar ve tamamlanmamış bir gelecek döndürür.

Bir geleceğin işlemi bittiğinde, gelecek bir değerle veya bir hatayla 
tamamlanır.


Anahtar terimler:

Gelecek : Dart Gelecek sınıfı.
gelecekFuture : Dart sınıfının bir örneği .
*/
