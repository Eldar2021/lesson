/*
Classes and mixins

Dart, tüm nesnelerin sınıf örnekleri olduğu “saf” nesne yönelimli bir dildir. 
Ancak Dart, tüm kodun bir sınıf içinde tanımlanmasını gerektirmez; prosedürel 
veya işlevsel bir dilde yapabileceğiniz gibi üst düzey değişkenleri, sabitleri 
ve işlevleri tanımlayabilirsiniz.
*/
/*
Basit bir işlev yapılacaksa tek üyeli bir soyut sınıf tanımlamaktan KAÇININ.

Java'dan farklı olarak Dart, birinci sınıf işlevlere, kapaklara ve bunları 
kullanmak için güzel bir ışık sözdizimine sahiptir. Tek ihtiyacınız olan geri 
arama gibi bir şeyse, sadece bir işlev kullanın. Bir sınıf tanımlıyorsanız ve 
yalnızca callveya gibi anlamsız bir ada sahip tek bir soyut üyeye 
invoke sahipseniz, yalnızca bir işlev istemeniz için iyi bir şans vardır.
*/
/// Good!
typedef PredicateType<E> = bool Function(E element);

/// Bad!
abstract class Predicate<E> {
  bool test(E element);
}

/*
Yalnızca statik üyeler içeren bir sınıf tanımlamaktan KAÇININ.

Java ve C#'da, her tanım bir sınıfın içinde olmalıdır , bu nedenle yalnızca 
statik üyeleri doldurmak için bir yer olarak var olan “sınıfları” görmek 
yaygındır. Diğer sınıflar ad alanları olarak kullanılır - bir grup üyeyi 
birbirleriyle ilişkilendirmek veya bir ad çakışmasını önlemek için paylaşılan 
bir önek vermenin bir yolu.

Dart'ın üst düzey işlevleri, değişkenleri ve sabitleri vardır, bu nedenle 
yalnızca bir şeyi tanımlamak için bir sınıfa ihtiyacınız yoktur. İstediğiniz 
bir ad alanıysa, kitaplık daha uygundur. Kitaplıklar içe aktarma öneklerini ve 
birleştiricileri göster/gizle destekler. Bunlar, kodunuzun tüketicisinin ad 
çakışmalarını kendileri için en iyi şekilde işlemesini sağlayan güçlü 
araçlardır.

Bir işlev veya değişken mantıksal olarak bir sınıfa bağlı değilse, onu en üst 
düzeye koyun. Ad çakışmalarından endişe ediyorsanız, ona daha kesin bir ad 
verin veya önekle içe aktarılabilecek ayrı bir kitaplığa taşıyın.
*/
/// Good!
DateTime mostRecent(List<DateTime> dates) {
  return dates.reduce((a, b) => a.isAfter(b) ? a : b);
}

// ignore: unused_element
const _favoriteMammal = 'weasel';

/// Bad!
class DateUtils {
  static DateTime mostRecent(List<DateTime> dates) {
    return dates.reduce((a, b) => a.isAfter(b) ? a : b);
  }
}

// ignore: unused_element
class _Favorites {
  // ignore: unused_field
  static const mammal = 'weasel';
}

// Deyimsel Dart'ta sınıflar , nesne türlerini tanımlar . Hiçbir zaman
// somutlaştırılmayan bir tür, bir kod kokusudur.

// Ancak bu zor bir kural değildir. Sabitler ve enum benzeri türlerle, bunları
// bir sınıfta gruplamak doğal olabilir.

/// Good!
class Color {
  static const red = '#f00';
  static const green = '#0f0';
  static const blue = '#00f';
  static const black = '#000';
  static const white = '#fff';
}

/*
Alt sınıflara ayrılması amaçlanmayan bir sınıfı genişletmekten KAÇININ.

Bir kurucu, üretici bir kurucudan bir fabrika kurucusuna değiştirilirse, bu 
kurucuyu çağıran herhangi bir alt sınıf kurucusu bozulur. Ayrıca, bir sınıf 
kendi metotlarından hangisini çağırdığını değiştirirse this, bu metotları 
geçersiz kılan alt sınıfları kırabilir ve belirli noktalarda çağrılmalarını 
bekleyebilir.

Bunların her ikisi de, bir sınıfın alt sınıflamaya izin vermek isteyip 
istemediği konusunda bilinçli olması gerektiği anlamına gelir. Bu, bir belge 
yorumunda veya sınıfa gibi açık bir ad verilerek iletilebilir IterableBase. 
Sınıfın yazarı bunu yapmazsa , sınıfı genişletmemeniz gerektiğini varsaymak en 
iyisidir . Aksi takdirde, daha sonra yapılan değişiklikler kodunuzu bozabilir.
*/
/*
Sınıfınız genişletilmeyi destekliyorsa belgeleyin.

Bu, yukarıdaki kuralın doğal sonucudur. Sınıfınızın alt sınıflarına izin vermek 
istiyorsanız, bunu belirtin. Sınıf adının sonuna ekleyin Base veya sınıfın 
doküman yorumunda belirtin.
*/
/*
Arayüz olması amaçlanmayan bir sınıfı uygulamaktan KAÇININ.

Örtülü arabirimler, Dart'ta bir sınıfın sözleşmesini, o sözleşmenin bir 
uygulamasının imzalarından önemsiz bir şekilde çıkarılabildiğinde tekrarlamak 
zorunda kalmamak için güçlü bir araçtır.

Ancak bir sınıfın arabirimini uygulamak, o sınıfla çok sıkı bir bağlantıdır. 
Bu, arayüzünü uyguladığınız sınıfta yapılacak herhangi bir değişikliğin 
uygulamanızı bozacağı anlamına gelir. Örneğin, bir sınıfa yeni bir üye eklemek 
genellikle güvenli ve kesintisiz bir değişikliktir. Ancak, o sınıfın 
arabirimini uyguluyorsanız, şimdi sınıfınız statik bir hataya sahiptir çünkü 
bu yeni yöntemin bir uygulamasından yoksundur.

Kütüphane yöneticileri, kullanıcıları bozmadan mevcut sınıfları geliştirme 
yeteneğine ihtiyaç duyar. Her sınıfa, kullanıcıların uygulamakta özgür olduğu 
bir arabirim sunuyormuş gibi davranırsanız, bu sınıfları değiştirmek çok 
zorlaşır. Bu zorluk, güvendiğiniz kitaplıkların daha yavaş büyümesi ve yeni 
ihtiyaçlara uyum sağlaması anlamına gelir.

Kullandığınız sınıfların yazarlarına daha fazla hareket alanı sağlamak için, 
açıkça uygulanması amaçlanan sınıflar dışında örtük arabirimler uygulamaktan 
kaçının. Aksi takdirde, yazarın istemediği bir bağlantı kurabilirsiniz ve 
kodunuzu farkında olmadan bozabilirler.
*/
/*
DO sınıfınız bir arayüz olarak kullanılmasını destekliyorsa belgeleyin.

Sınıfınız bir arayüz olarak kullanılabiliyorsa, bunu sınıfın doküman yorumunda 
belirtin.
*/
