/*
String Interpolation
In the following lesson, you will learn how to concatenate strings using 
string interpolation.

Dize Birleştirme #
İki diziyi birleştirmek, onları birleştirmek anlamına gelir. +Operatör 
kullanılarak iki veya daha fazla dizenin birleştirilmesi yapılır.

*/

main() {
  String s1 = "First half of the string. ";
  String s2 = "Second half of the string";
  print(s1 + s2);
}

/*
Dize Enterpolasyonu #
Dize enterpolasyonu, yeni dizeler oluşturma veya mevcut dizeleri ifadelerle 
gömerek değiştirme yeteneğidir. İfadeler değerlendirilir ve elde edilen 
değerler dizelere dönüştürülür ve çevreleyen dizeyle birleştirilir. 
Enterpolasyon, Dart'ın dize birleştirmeye daha özlü ve verimli alternatifidir. 
Bununla birlikte, dize enterpolasyonu, çok daha fazla esneklik sağlayan basit 
birleştirmeden çok daha karmaşıktır.

sözdizimi #
Bir $dizedeki çıkışsız karakter, enterpolasyonlu bir ifadenin başlangıcını 
belirtir.

İşareti, karakteri içermeyen $tek bir tanımlayıcı kimliği takip edebilir .$

svg görüntüleyici
İşaretin $ardından küme parantezleriyle ayrılmış bir ifade de gelebilir.

svg görüntüleyici
Örnekle Öğrenme #
Dize enterpolasyonunun nasıl çalıştığı hakkında daha iyi bir fikir edinmek için 
bazı farklı kodlama örneklerine bakalım.
*/