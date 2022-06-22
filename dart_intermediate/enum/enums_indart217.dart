/*
Enhanced enums with members

Üyelerle geliştirilmiş numaralandırmalar

Numaralandırmalar, ayrı bir durum kümesini temsil etmek için harikadır. Örneğin, 
suyu şu şekilde modelleyebiliriz enum Water { frozen, lukewarm, boiling }. 
enumAncak , örneğin, durumların her birini bir sıcaklığa dönüştürmek ve 
bunun a'ya dönüştürülmesini desteklemek için enumbazı yöntemler eklemek 
istersek ne olur String? Belki bir waterToTemp()yöntem eklemek için uzantı 
yöntemlerini kullanabiliriz, ancak bunu enum. Dönüşüm için Stringgeçersiz 
kılmayı tercih ederiz toString(), ancak bu desteklenmiyor.

Dart 2.17 ile artık enumlarda üyeler için genel desteğimiz var. Bu, durumu 
tutan alanlar, bu durumu ayarlayan yapıcılar, işlevselliğe sahip yöntemler 
ve hatta mevcut üyeleri geçersiz kılabileceğimiz anlamına gelir. Birçoğunuz 
bu yeteneği talep ediyordunuz; dil izleyicide en yüksek oyu alan 
üçüncü konumuzdu.

Su örneğimiz için, intsıcaklığı tutan bir alan ve aşağıdakileri alan bir 
varsayılan kurucu ekleyebiliriz int:

*/
enum Water {
  frozen(32),
  lukewarm(100),
  boiling(212);

  final int temp;
  const Water(this.temp);

  @override
  String toString() {
    return 'The $name water is $temp';
  }
}

void main() {
  final w1 = Water.frozen;
  final w2 = Water.lukewarm;
  final w3 = Water.boiling;

  print(w1);
  print(w2);
  print(w3);
}

/*
Oluşturucu oluşturulduğunda çağrıldığından emin olmak için, enumher enumdeğer 
için onu çağırmamız gerekir:

enum Su { 
  donmuş(32), 
  ılık(100), 
  kaynar(212); 
… 
}

'ye dönüştürmeyi desteklemek için , aşağıdakilerden miras alınan 
Stringyalnızca geçersiz kılıyoruz :toStringenumsObject

@override
 String toString() => "$name suyu $tempInFahrenheit F'dir.";

enumVe bununla, kolayca somutlaştırılabilen bir tamamlamanız var ve şu 
yöntemleri çağırabilirsiniz: 

Bu iki yaklaşımın tam bir örneği aşağıda gösterilmiştir; 
yeni Dart 2.17 sürümünün okunması ve bakımının çok daha kolay olduğunu 
düşünüyoruz.
*/
