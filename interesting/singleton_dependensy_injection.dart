/// https://codewithandrea.com/articles/flutter-singletons/?s=09
/// https://codewithandrea.com/
/*
Flutter'da Singleton'lar: Onlardan Nasıl Kaçınılır ve Yerine Ne Yapılır?

Singletons, yazılım geliştirme topluluğunda çok tartışmalı ve tartışılan 
bir konudur:

Singletons, yazılım geliştirme topluluğunda çok tartışmalı ve tartışılan 
bir konudur:

  Bazı insanlar ne pahasına olursa olsun onlardan kaçınmanız 
  gerektiğini söylüyor. ❌

  Diğerleri daha pragmatiktir ve bunları yalnızca belirli 
  durumlarda kullanır. 🔍

  Bazıları da yarını yokmuş gibi ister istemez kullanıyor. 😅

Biraz açıklık getirmek için, bu makale aşağıdakileri kapsayacaktır:

  Dart/Flutter'da singleton'lara giriş

  hangi sorunları çözüyorlar

  başka hangi sorunları ortaya çıkarırlar ve bunların nasıl üstesinden gelinir?

  singleton'lara alternatifler

Sonunda, singleton'ların neden kodunuzu daha az sürdürülebilir ve test 
edilebilir hale getirebileceğini ve bunun yerine ne yapabileceğinizi daha 
iyi anlayacaksınız.

Hazır? Hadi gidelim!  
*/
/*
Singleton Nedir?
Singleton modeli, bir sınıfın somutlaştırılmasını tek bir "tek" örnekle 
sınırlayan bir yazılım tasarım modelidir .

Sayfa ayrıca, singleton modelinin aşağıdakilere izin vererek sorunları 
çözdüğünü söylüyor:

  Bir sınıfın yalnızca bir örneği olduğundan emin olun

  Bir sınıfın tek örneğine kolayca erişin

  Örneklenmesini kontrol edin

  Örnek sayısını sınırla

  Genel bir değişkene erişin

Başka bir deyişle, singleton modeli , bir sınıfın yalnızca bir örneğinin 
oluşturulmasını sağlayarak, ona global bir değişken olarak erişmeyi 
kolaylaştırır .

Dart'ta Singleton Nasıl Uygulanır?
Bu en basit yoldur:
*/
class Singleton {
  /// private constructor
  Singleton._();

  /// the one and only instance of this singleton
  static final instance = Singleton._();
}

/*
Yapıcıyı private yaparak, sınıfın tanımlandığı dosyanın dışında 
somutlaştırılamayacağını garanti ederiz .

Sonuç olarak, ona erişmenin tek yolu Singleton.instance kodumuzu aramaktır.

Bazı durumlarda, statik bir alıcı değişkeni kullanmak tercih edilir . 
Dart'ta bir singleton uygulamanın alternatif yolları için bu konuyu 
StackOverflow'ta okuyun .
https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart
*/
/*
Flutter'da Bazı Singleton Örnekleri
Firebase'i daha önce kullandıysanız, bir düğmeye basıldığında oturum açmak 
için kullanılabilecek bu kodu bilirsiniz:

ElevatedButton(
  // access FirebaseAuth as a singleton and call one of its methods
  onPressed: () => FirebaseAuth.instance.signInAnonymously(),
  child: Text('Sign in anonymously'),
)

  Singleton deseni, tüm Firebase eklentileri tarafından kullanılır. 
  Ve yöntemlerini çağırmanın tek yolu instancealıcıdır:

FirebaseFirestore.instance.doc('path/to/document');
FirebaseFunctions.instance.httpsCallable('createOrder');
FirebaseMessaging.instance.deleteToken();

Ama bir saniye bekle! Resmi Firebase eklentileri tekil olarak uygulanıyorsa, 
sınıflarınızı da aynı şekilde tasarlamanız kesinlikle sorun değil, değil mi? 🧐

Çok hızlı değil.

*/
/*
Yalnızca Bir Örnek
Görüyorsunuz, bu sınıflar, kodunuzda birden fazla örnek oluşturmanızı 
engellemek için tekil olarak tasarlandı:

// Note: this code won't compile since the constructor is private
// inside WidgetA
final auth1 = FirebaseAuth();
// inside WidgetB - different instance:
final auth2 = FirebaseAuth();

Yukarıdaki kod derlenmeyecek. Ve olmamalı, çünkü tek bir gerçek kaynağı 
olarak hareket eden tek bir kimlik doğrulama hizmetiniz var :

// inside WidgetA
final auth1 = FirebaseAuth.instance;
// inside WidgetB - same instance:
final auth2 = FirebaseAuth.instance;

Bu çok asil bir hedeftir ve singleton'lar genellikle kitaplık veya paket 
tasarımı için makul bir çözümdür.

Ancak uygulama kodunu yazarken , bunları nasıl kullandığımız konusunda çok 
dikkatli olmalıyız çünkü bunlar kod tabanımızda birçok soruna yol açabilir.

Flutter uygulamaları, derinlemesine iç içe geçmiş widget ağaçlarına sahiptir. 
Sonuç olarak, singleton'lar ihtiyacımız olan nesnelere herhangi bir widget'tan 
erişmeyi kolaylaştırır . Ancak singleton'ların birçok dezavantajı vardır ve 
kullanımı hala kolay olan daha iyi alternatifler vardır
*/
/*
Singleton Dezavantajları

Singleton'ların neden sorunlu olduğunu daha iyi anlamak için, olası çözümlerle 
birlikte yaygın dezavantajların bir listesini burada bulabilirsiniz.

1. Singleton'ları test etmek zordur
Singletons kullanmak, kodunuzu test etmeyi zorlaştırır.
Bu örneği düşünün:

class FirebaseAuthRepository {
  Future<void> signOut() => FirebaseAuth.instance.signOut();
}

Bu durumda, denendiğini kontrol etmek için bir test yazmak imkansızdır 
FirebaseAuth.instance.signOut():

test('calls signOut', () async {
  final authRepository = FirebaseAuthRepository();
  await authRepository.signOut();
  // how to expect FirebaseAuth.instance.signOut() was called?
});

Basit bir çözüm, bunun gibi bir bağımlılık olarak enjekte etmektir :
FirebaseAuth

class FirebaseAuthRepository {
  // declare a FirebaseAuth property and pass it as a constructor argument
  const FirebaseAuthRepository(this._auth);
  final FirebaseAuth _auth;

  // use it when needed
  Future<void> signOut() => _auth.signOut();
}

Sonuç olarak, testimizde bağımlılıkla kolayca dalga geçebilir ve buna karşı 
beklentiler yazabiliriz:

import 'package:mocktail/mocktail.dart';

// declare a mock class that implements the type of our dependency
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

test('calls signOut', () async {
  // create the mock dependency
  final mock = MockFirebaseAuth();
  // stub its method(s) to return a value when called
  when(mock.signOut).thenAnswer((_) => Future.value());
  // crete the object under test and pass the mock as an argument
  final authRepository = FirebaseAuthRepository(mock);
  // call the desired method
  await authRepository.signOut();
  // check that the method was called on the mock
  expect(mock.signOut).called(1);
});

Denemeler kullanarak testlerin nasıl yazılacağı hakkında daha fazla 
bilgi için mocktail paketine göz atın .
https://pub.dev/packages/mocktail

2. Singleton'lar Örtük Bağımlılıklardır
Bir önceki örneği hatırlayalım:

class FirebaseAuthRepository {
  Future<void> signOut() => FirebaseAuth.instance.signOut();
}

FirebaseAuthRepository Bu durumda, bağlı olduğunu görmek kolaydır 
FirebaseAuth.

Ancak birkaç düzine kod satırı içeren sınıflarımız olur olmaz, tekilleri tespit 
etmek çok daha zor hale gelir.

Öte yandan, açık yapıcı argümanları olarak iletildiklerinde bağımlılıkları 
görmek çok daha kolaydır:

class FirebaseAuthRepository {
  // easy to find the dependencies here,
  // even if this class becomes very large
  const FirebaseAuthRepository(this._auth);
  final FirebaseAuth _auth;

  Future<void> signOut() => _auth.signOut();
}

3. Tembel Başlatma
Belirli nesnelerin başlatılması pahalı olabilir:
*/
class HardWorker {
  HardWorker._() {
    print('work started');
    // do some heavy processing
  }
  static final instance = HardWorker._();

  void logResult() {}
}

void main1() {
  // prints 'work started' right away
  final hardWorker = HardWorker.instance;
  print(hardWorker);
}

/// Yukarıdaki örnekte, tüm ağır işleme kodu , değişkeni yöntemin içinde
/// başlattığımız anda çalışır.hardWorkermain()
///
/// Bu gibi durumlarda, nesne başlatmayı daha sonraya
/// (gerçekte kullanıldığında) ertelemeklate için kullanabiliriz:
void main() {
  // prints nothing
  // initialization will happen later when we *use* hardWorker
  late final hardWorker = HardWorker.instance;
  print(hardWorker);
  // initialization happens here
  // prints 'work started' from the constructor
  hardWorker.logResult();
}

/// Ancak, kullanmayı unutmak çok kolay olduğu için bu yaklaşım hataya
/// açıktır late.
///
/*
Not : Dart'ta, tüm global değişkenler varsayılan olarak tembel yüklenir 
(ve bu, statik sınıf değişkenleri için de geçerlidir ). Bu, yalnızca ilk 
kullanıldıklarında başlatıldıkları anlamına gelir . Öte yandan, yerel 
değişkenler, olarak bildirilmedikçe, bildirildikleri anda başlatılırlate .

Alternatif olarak, tembel bir singleton kaydetmeyi kolaylaştıran get_it gibi 
paketleri kullanabiliriz: https://pub.dev/packages/get_it

class HardWorker {
  HardWorker() {
    // do some heavy processing
  }
}

// register a lazy singleton (won't be created yet)
getIt.registerLazySingleton<HardWorker>(() => HardWorker());

// when we need it, do this
final hardWorker = getIt.get<HardWorker>();
*/
/*
4. Örnek Yaşam Döngüsü
Bir singleton örneğini başlattığımızda, zamanın sonuna kadar 
(yani uygulama kapatıldığında 😅) canlı kalacaktır.

Örnek çok fazla bellek tüketiyorsa veya açık bir ağ bağlantısını koruyorsa, 
istersek onu erken bırakamayız.

Öte yandan, get_it ve Riverpod gibi paketler, belirli bir örneğin ne zaman 
elden çıkarılacağı konusunda bize daha fazla kontrol sağlar .

Aslında Riverpod oldukça akıllıdır ve bir sağlayıcının durumunun yaşam 
döngüsünü kolayca kontrol etmemizi sağlar.

5. Thread Safety
İplik Güvenliği
Çok iş parçacıklı dillerde, farklı iş parçacıkları arasındaki tekillere erişim 
konusunda dikkatli olmamız gerekir ve değişebilir verileri paylaşıyorlarsa bazı 
senkronizasyon mekanizmaları gerekli olabilir.

Ancak Dart'ta bu genellikle bir endişe kaynağı değildir çünkü bir Flutter 
uygulamasındaki tüm uygulama kodları ana izolata aittir .

Bazı ağır hesaplamalar yapmak için ayrı izolatlar oluşturursak daha dikkatli 
olmamız gerekir:
*/
/*
Singleton'lara Alternatifler
Singleton kullanmanın ana dezavantajlarını gözden geçirdikten sonra, Flutter 
uygulama geliştirme için hangi alternatiflerin daha uygun olduğunu görelim.

Bağımlılık Enjeksiyonu
Wikipedia, bağımlılık enjeksiyonunu şu şekilde tanımlar:

bir nesnenin bağlı olduğu diğer nesneleri aldığı bir tasarım deseni.
Dart'ta bu, açık yapıcı argümanlarla kolayca uygulanır :
*/
class FirebaseAuthRepository {
  // inject the dependency as a constructor argument
  const FirebaseAuthRepository(this._auth);
  // this property is a dependency
  final FirebaseAuth _auth;

  // use it when needed
  Future<void> signOut() => _auth.signOut();
}

class FirebaseAuth {
  signOut() {}
}

/// Bağımlılık enjeksiyonu , endişelerin iyi bir şekilde ayrılmasını sağlayarak 
/// sınıfları bağımlı oldukları nesnelerin oluşturulmasından bağımsız 
/// hale getirir.
/*
Ancak yukarıda yarattığımız sınıfı nasıl başlatabiliriz FirebaseAuthRepository 
ve onu derinlemesine iç içe geçmiş widget'larda 
(veya kodumuzun başka bir yerinde) nasıl kullanabiliriz?

Hizmet Bulucu olarak get_it kullanın
Get_it paketini kullanırsak , uygulama başladığında sınıfımızı tembel bir 
singleton olarak kaydedebiliriz :

void main() {
  // GetIt itself is a singleton, see note below for more info
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<FirebaseAuthRepository>(
    () => FirebaseAuthRepository(FirebaseAuth.instance),
  );
  runApp(const MyApp());
}

Ve sonra gerektiğinde bu şekilde erişebiliriz:

final authRepository = getIt.get<FirebaseAuthRepository>();

Not: GetItsınıfın kendisi bir tekildir. Ama bu sorun değil çünkü önemli olan, 
bağımlılıklarımızı onlara ihtiyaç duyan nesnelerden ayırmamıza izin vermesidir. 
Daha ayrıntılı bir genel bakış için paket belgelerini okuyun .

Sonuç olarak, tüm kod tabanında (birçok kez değil) yalnızca 
FirebaseAuth.instance bir kez çağırmamız gerekir , çünkü artık değerini 
alabilir veya okuyabiliriz ( get_it veya Riverpod kullanarak ).
*/
/*
Çözüm
Artık singletonları ve alternatiflerini kullanmanın temel sakıncalarını ele 
aldığımıza göre, size kişisel deneyime dayalı bazı pratik ipuçları 
vermek istiyorum.

1. Kendi singleton'larınızı oluşturmayın
Bir paket yazarı değilseniz ve bunu yapmak için iyi bir nedeniniz yoksa, 
kendi singleton'larınızı oluşturmayın. 3. taraf API'lere tekil olarak erişseniz 
bile Singleton.instance, kodunuzu test etmeyi zorlaştıracağından her yerde 
kullanmayın.

Bunun yerine, herhangi bir bağımlılığı yapıcı bağımsız değişkenler olarak 
ileterek sınıflarınızı oluşturun.

2. get_it veya Riverpod gibi paketleri kullanın
Bu paketler, bağımlılıklarınız üzerinde size çok daha iyi kontrol sağlar; bu, 
yukarıda belirtilen dezavantajlardan herhangi biri olmadan kolayca 
başlatabileceğiniz , erişebileceğiniz ve imha edebileceğiniz anlamına gelir.
Bunu bir kez kavradığınızda, farklı türdeki nesneler (widget'lar, 
denetleyiciler, hizmetler, depolar, vb.) arasında hangi bağımlılıkların 
olduğunu bulmanız gerekir . Bu da 3. adıma götürür. 👇

3. İyi bir uygulama mimarisi seçin
Karmaşık uygulamalar oluştururken size yardımcı olacak iyi bir uygulama 
mimarisi seçin:
kodunuzu yapılandırın ve büyüdükçe kod tabanınızı destekleyin
farklı nesnelerin neye bağlı olması (ve olmaması) gerektiğine karar vermek
Bu tavsiyeye uyarak, Riverpod tabanlı bu referans uygulama mimarisini 
kullanarak, herhangi bir singleton oluşturmadan test edilebilir ve 
sürdürülebilir koda sahip orta büyüklükte bir e-Ticaret uygulaması oluşturdum.

Sarmak
Singletons, kodunuzdaki bağımlılıklara erişmeyi kolaylaştırır. Ancak 
çözdüklerinden daha fazla sorun yaratırlar.

Daha iyi bir alternatif, get_it ve Riverpod gibi savaşta test edilmiş paketleri 
kullanarak bağımlılıkları yönetmektir .

Öyleyse bir tane seçin ve iyi bir mimariyle birlikte uygulamalarınızda kullanın. 
Bunu yaparak, birçok tuzaktan kaçınacak ve çok daha iyi bir kod temeli 
elde edeceksiniz. 👍

Mutlu kodlama!
*/
