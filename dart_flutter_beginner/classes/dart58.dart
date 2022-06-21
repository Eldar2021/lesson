/*
Dart'ta Sınıf Oluşturma
Bu dersimizde nesne yönelimli programlama ile çalışmaya başlayacağız ve 
Dart'ta kendi sınıfınızı nasıl oluşturacağınızı öğreneceksiniz.

Sınıf Tanımlama #
Dart'ta bir sınıf tanımlamak için, classanahtar kelime ve ardından seçtiğiniz 
bir tanımlayıcı (sınıf adı) kullanılır. Bunu, bir çift süslü parantez ( ) ile 
çevrelenen sınıf gövdesi takip eder {}.

Örnek Değişkenleri #
Sınıfımızın Personüç tane örnek değişkeni var. Dart'ta örnek değişkenleri 
şu şekilde ilan edersiniz.

Bir sınıfta kullanabileceğiniz birden çok yöntem türü olsa da, bu ders 
yalnızca örnek yöntemlere odaklanacaktır.

Nesnelerdeki örnek yöntemleri, örnek değişkenlere erişebilir.

Yöntemlerimiz, sırasıyla yürüyen veya konuşan kişinin adını yazdıracak olan 
yürüme ve konuşmadır.
*/
class Person {
  Person({
    required this.name,
    required this.gender,
    required this.age,
  });

  final String name; // Declare name, initially null.
  final String gender; // Declare gender, initially null.
  final int age; // Declare age, initially 0.

  void walking() => print('$name is walking');
  void talking() => print('$name is talking');
}
