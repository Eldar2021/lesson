import 'dart:math';
/*
Constructors
yapıcılar
Aşağıdaki en iyi uygulamalar, bir sınıf için yapıcıları bildirmek için 
geçerlidir.

Mümkün olduğunda başlatma biçimlerini KULLANIN.
Birçok alan, doğrudan aşağıdaki gibi bir yapıcı parametresinden başlatılır:
*/

/// Bad!
class Point {
  double x, y;
  Point(double x, double y)
      : x = x,
        y = y;
}

// Bir alan tanımlamak için buraya x dört kez yazmamız gerekiyor.
// Daha iyisini yapabiliriz:

/// Good!
class Point1 {
  double x, y;
  Point1(this.x, this.y);
}

// Bir yapıcı parametresinden önceki bu this.sözdizimine "başlatma biçimi"
// denir. Bundan her zaman yararlanamazsınız. Bazen adı, başlattığınız alanın
// adıyla eşleşmeyen adlandırılmış bir parametreye sahip olmak istersiniz.
// Ancak, başlatma biçimlerini kullanabildiğiniz zaman.

/*
late Bir yapıcı başlatıcı listesi işe yaradığında KULLANMAYIN .

Sıfır ses güvenliği, Dart'ın okunmadan önce null yapılamayan bir alanın 
başlatıldığından emin olmasını gerektirir. Alanlar yapıcı gövdesi içinde 
okunabildiğinden, bu, gövde çalıştırılmadan önce null olmayan bir alanı 
başlatmazsanız bir hata alacağınız anlamına gelir.

Alanı işaretleyerek bu hatayı ortadan kaldırabilirsiniz late. Bu , alana 
başlatılmadan önce erişirseniz , derleme zamanı hatasını çalışma zamanı 
hatasına dönüştürür. Bazı durumlarda ihtiyacınız olan şey budur, ancak 
genellikle doğru düzeltme, alanı yapıcı başlatıcı listesinde başlatmaktır:
*/

/// Good!
class Point2 {
  double x, y;
  Point2.polar(double theta, double radius)
      : x = cos(theta) * radius,
        y = sin(theta) * radius;
}

/// Bad!
class Point3 {
  late double x, y;
  Point3.polar(double theta, double radius) {
    x = cos(theta) * radius;
    y = sin(theta) * radius;
  }
}
// Başlatıcı listesi, yapıcı parametrelerine erişmenizi sağlar ve alanları
// okunmadan önce başlatmanıza olanak tanır. Bu nedenle, bir başlatıcı listesi
// kullanmak mümkünse, bu, alanı oluşturmaktan lateve bazı statik güvenlik ve
// performans kaybetmekten daha iyidir.

/*
Boş yapıcı gövdeleri ;yerine kullanın .{}
Dart'ta, boş bir gövdeye sahip bir kurucu yalnızca noktalı virgülle 
sonlandırılabilir. (Aslında, const yapıcıları için gereklidir.)
*/
/// Good!
class Point4 {
  double x, y;
  Point4(this.x, this.y);
}

/// Bad!
class Point5 {
  double x, y;
  Point5(this.x, this.y) {}
}

/*
KULLANMAYIN new.

Dart 2, newanahtar kelimeyi isteğe bağlı hale getirir. Dart 1'de bile, anlamı 
hiçbir zaman net değildi çünkü fabrika kurucuları, bir newçağrının hala yeni 
bir nesne döndürmeyebileceği anlamına geliyor.

Dil new, geçişi daha az acı verici hale getirmek için hala izin veriyor, ancak 
kullanımdan kaldırıldığını düşünün ve kodunuzdan kaldırın.
*/

/// Good!
// Widget build(BuildContext context) {
//   return Row(
//     children: [
//       RaisedButton(
//         child: Text('Increment'),
//       ),
//       Text('Click!'),
//     ],
//   );
// }

/// Bad!
// Widget build(BuildContext context) {
//   return new Row(
//     children: [
//       new RaisedButton(
//         child: new Text('Increment'),
//       ),
//       new Text('Click!'),
//     ],
//   );
// }

/*
const Gereksiz yere KULLANMAYIN.

Bir ifadenin sabit olmasıconst gereken bağlamlarda, anahtar kelime örtüktür, 
yazılması gerekmez ve yazılmamalıdır. Bu bağlamlar, içindeki herhangi 
bir ifadedir:

  Bir const koleksiyon değişmezi.

  Bir const yapıcı çağrısı

  Bir meta veri ek açıklaması.

  Bir const değişken bildirimi için başlatıcı.

  Bir switch case ifadesi— vakanın gövdesi değil, ' den casehemen 
  sonraki kısım .:
*/

class Color {
  final String name;
  final List<int> values;

  const Color(this.name, this.values);
}

/// Good!
const primaryColors = <Color>[
  Color('red', [255, 0, 0]),
  Color('green', [0, 255, 0]),
  Color('blue', [0, 0, 255]),
];

/// Bad!
const primaryColors1 = const [
  const Color('red', const [255, 0, 0]),
  const Color('green', const [0, 255, 0]),
  const Color('blue', const [0, 0, 255]),
];
