import 'dart:math';
/*
Variables
Aşağıdaki en iyi uygulamalar, Dart'ta değişkenlerin en iyi şekilde nasıl 
kullanılacağını açıklar.

Yerel değişkenler için varve bunlar üzerinde tutarlı bir kural izleyin .final

Çoğu yerel değişken, tür açıklamalarına sahip olmamalı ve just varveya 
kullanılarak bildirilmelidir final. Birinin veya diğerinin ne zaman 
kullanılacağı konusunda yaygın olarak kullanılan iki kural vardır:

  final Yeniden atanmamış yerel değişkenler ve atanmış varolanlar için kullanın.

  var Yeniden atanmamış olanlar dahil tüm yerel değişkenler için kullanın. 
  final Yerliler için asla kullanmayın . ( final Elbette, alanlar ve üst düzey 
  değişkenler için kullanılması hala teşvik edilmektedir.)

Her iki kural da kabul edilebilir, ancak birini seçin ve kodunuz boyunca 
tutarlı bir şekilde uygulayın. Bu şekilde bir okuyucu gördüğünde var, bunun 
değişkenin fonksiyonda daha sonra atandığı anlamına gelip gelmediğini bilir.

Hesaplayabileceklerinizi saklamaktan KAÇININ.
Bir sınıf tasarlarken, genellikle birden çok görünümü aynı temel duruma 
getirmek istersiniz. Genellikle, yapıcıda tüm bu görünümleri hesaplayan ve 
ardından bunları depolayan bir kod görürsünüz:
*/

/// Bad!
class Circle {
  double radius;
  double area;
  double circumference;

  Circle(double radius)
      : radius = radius,
        area = pi * radius * radius,
        circumference = pi * 2.0 * radius;
}

/*
Bu kodda yanlış olan iki şey var. İlk olarak, muhtemelen hafızayı boşa 
harcıyor. Alan ve çevre, kesinlikle konuşursak, önbelleklerdir . Zaten sahip 
olduğumuz diğer verilerden yeniden hesaplayabileceğimiz depolanmış 
hesaplamalardır. Azaltılmış CPU kullanımı için artırılmış bellek ticareti 
yapıyorlar. Bu takası hak eden bir performans sorunumuz olduğunu biliyor muyuz?

Daha da kötüsü, kod yanlıştır . Önbelleklerle ilgili sorun geçersiz kılmadır; 
önbelleğin ne zaman güncel olmadığını ve yeniden hesaplanması gerektiğini nasıl 
anlarsınız? radiusBurada, değişken olmasına rağmen asla yapmayız . Farklı bir 
değer atayabilirsiniz ve areaand circumference, önceki, şimdi yanlış 
değerlerini koruyacaktır.

Önbellek geçersiz kılmayı doğru şekilde işlemek için şunu yapmamız gerekir:
*/
/// Bad!
class Circl1e {
  double _radius;
  double get radius => _radius;
  set radius(double value) {
    _radius = value;
    _recalculate();
  }

  double _area = 0.0;
  double get area => _area;

  double _circumference = 0.0;
  double get circumference => _circumference;

  Circl1e(this._radius) {
    _recalculate();
  }

  void _recalculate() {
    _area = pi * _radius * _radius;
    _circumference = pi * 2.0 * _radius;
  }
}
// Bu, yazılacak, bakımı yapılacak, hata ayıklanacak ve okunacak çok fazla kod
// demektir. Bunun yerine, ilk uygulamanız şöyle olmalıdır:

/// Good!
class Circle3 {
  double radius;

  Circle3(this.radius);

  double get area => pi * radius * radius;
  double get circumference => pi * 2.0 * radius;
}
// Bu kod daha kısadır, daha az bellek kullanır ve daha az hataya açıktır.
// Çemberi temsil etmek için gereken minimum miktarda veriyi depolar.
// Senkronizasyondan çıkacak alan yok çünkü yalnızca tek bir hakikat 
// kaynağı var.

// Bazı durumlarda, yavaş bir hesaplamanın sonucunu önbelleğe almanız
//  gerekebilir, ancak bunu yalnızca bir performans sorununuz olduğunu
// öğrendikten sonra yapın, dikkatlice yapın ve optimizasyonu açıklayan bir
// yorum bırakın.
