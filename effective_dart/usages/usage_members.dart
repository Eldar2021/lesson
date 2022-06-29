/*
Members
Dart'ta nesnelerin, işlevler (yöntemler) veya veri (örnek değişkenleri) 
olabilen üyeleri vardır. Aşağıdaki en iyi uygulamalar bir nesnenin üyeleri 
için geçerlidir.

Bir alanı bir alıcı ve ayarlayıcıya gereksiz yere sarmayın.

Java ve C#'da, uygulama alana yönlendirilse bile, tüm alanları alıcıların ve 
ayarlayıcıların (veya C#'taki özelliklerin) arkasına gizlemek yaygındır. Bu 
sayede o üyelerde daha fazla çalışmanız gerekirse, arama sitelerine dokunmanıza 
gerek kalmadan yapabilirsiniz. Bunun nedeni, bir alıcı yöntemi çağırmanın 
Java'da bir alana erişmekten farklı olması ve bir özelliğe erişmenin, C#'ta 
ham bir alana erişimle ikili uyumlu olmamasıdır.

Dart'ın bu sınırlaması yoktur. Alanlar ve alıcılar/ayarlayıcılar tamamen ayırt 
edilemez. Bir sınıftaki bir alanı açığa çıkarabilir ve daha sonra o alanı 
kullanan herhangi bir koda dokunmak zorunda kalmadan onu bir alıcı ve 
ayarlayıcıya sarabilirsiniz.
*/

/// Good!
class Box {
  Object? contents;
}

/// Bad!
class Box1 {
  Object? _contents;
  Object? get contents => _contents;
  set contents(Object? value) {
    _contents = value;
  }
}

/*
Salt finalokunur bir özellik yapmak için bir alan kullanmayı TERCİH edin.

Dış kodun görebilmesi ancak atamaması gereken bir alanınız varsa, çoğu durumda 
işe yarayan basit bir çözüm, onu basitçe işaretlemektir final.
*/
/// Good!
class Box2 {
  final contents = [];
}

/// Bad!
class Box3 {
  Object? _contents;
  Object? get contents => _contents;
}
// Elbette, yapıcı dışındaki alana dahili olarak atama yapmanız gerekiyorsa,
// “private field, public getter” modelini yapmanız gerekebilir, ancak
// ihtiyacınız olana kadar buna ulaşmayın.

/*
=> Basit üyeler için kullanmayı düşünün .

Dart, işlev ifadeleri için kullanılmasına ek olarak =>, onunla üye 
tanımlamanıza da olanak tanır. Bu stil, yalnızca hesaplayıp bir değer döndüren 
basit üyeler için uygundur.
*/
/// Good!
class Box4 {
  final double right;
  final double left;
  final double bottom;
  final double top;

  Box4(this.right, this.left, this.bottom, this.top);

  double get area => (right - left) * (bottom - top);

  String capitalize(String name) => '${name[0].toUpperCase()}${name.substring(1)}';
}

// Kod yazan insanlar seviyor gibi görünüyor , ancak onu kötüye kullanmak çok
// kolay ve okunması=> zor bir kodla sonuçlanıyor . Bildiriminiz birkaç
// satırdan fazlaysa veya derinlemesine iç içe ifadeler içeriyorsa - basamaklar
// ve koşullu operatörler yaygın suçlulardır - kendinize ve kodunuzu okuması
// gereken herkese bir iyilik yapın ve bir blok gövde ve bazı ifadeler kullanın.

/*
this. Adlandırılmış bir kurucuya yönlendirmek veya gölgelenmeyi önlemek 
dışında KULLANMAYIN.

JavaScript, şu anda yöntemi yürütülmekte olan nesne üzerindeki üyelere 
başvurmak için açık bir ifade gerektirir this., ancak Dart'ın C++, Java ve C# 
gibi bir sınırlaması yoktur.

Kullanmanız gereken sadece iki kez vardır this.. Bunlardan biri, aynı ada sahip 
yerel bir değişkenin erişmek istediğiniz üyeyi gölgelemesidir:
*/

/// Bad!
class Box5 {
  Object? value;

  void clear() {
    this.update(null);
  }

  void update(Object? value) {
    this.value = value;
  }
}

/// Good!
class Box6 {
  Object? value;

  void clear() {
    update(null);
  }

  void update(Object? value) {
    this.value = value;
  }
}

// Kullanılacak diğer zaman, this.adlandırılmış bir kurucuya yönlendirilirken:

/// Bad!
class ShadeOfGray {
  final int brightness;

  ShadeOfGray(int val) : brightness = val;

  ShadeOfGray.black() : this(0);

  // This won't parse or compile!
  // ShadeOfGray.alsoBlack() : black();
}

/// Good!
class ShadeOfGray1 {
  final int brightness;

  ShadeOfGray1(int val) : brightness = val;

  ShadeOfGray1.black() : this(0);

  // But now it will!
  ShadeOfGray1.alsoBlack() : this.black();
}

// Yapıcı parametrelerinin, yapıcı başlatıcı listelerindeki alanları hiçbir
// zaman gölgelemediğini unutmayın:

/// Good!
class Box7 extends BaseBox {
  Object? value;

  Box7(Object? value)
      : value = value,
        super(value);
}

class BaseBox {
  Object? value;
  BaseBox(this.value);
}

// Bu şaşırtıcı görünüyor, ancak istediğiniz gibi çalışıyor. Neyse ki, başlatma
// biçimleri ve süper başlatıcılar sayesinde bunun gibi kodlar nispeten
// nadirdir.

/*
Alanları mümkün olduğunda bildirimlerinde başlatınız.

Bir alan herhangi bir yapıcı parametresine bağlı değilse, bildiriminde 
başlatılabilir ve başlatılmalıdır. Sınıfta birden çok kurucu olduğunda daha az 
kod alır ve tekrarı önler.
*/

/// Bad!
class ProfileMark {
  final String name;
  final DateTime start;

  ProfileMark(this.name) : start = DateTime.now();
  ProfileMark.unnamed()
      : name = '',
        start = DateTime.now();
}

/// Good!
class ProfileMark1 {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark1(this.name);
  ProfileMark1.unnamed() : name = '';
}

// thisBazı alanlar, örneğin diğer alanları veya çağrı yöntemlerini kullanmak
// için başvurmaları gerektiğinden bildirimlerinde başlatılamaz . Ancak, alan
// işaretliyse , latebaşlatıcı erişebilirthis .

// Elbette, bir alan kurucu parametrelerine bağlıysa veya farklı kurucular
// tarafından farklı şekilde başlatılmışsa, bu kılavuz geçerli değildir.
