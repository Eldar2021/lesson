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
tasarımı için makul bir çözümdür .
*/

