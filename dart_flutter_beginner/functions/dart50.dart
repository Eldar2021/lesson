/*
Recursive Functions
Özyinelemeli Fonksiyonlar
Bu derste özyinelemeye kısa bir giriş yapılacak ve Dart'ta özyinelemenin 
nasıl uygulandığını gözden geçireceksiniz.

Özyinelemeli işlevler , kendilerini kendi işlev gövdelerinde çağıran 
işlevlerdir. Bu şu anda biraz garip görünebilir, ancak bunun nasıl 
çalıştığını görelim.

Özyineleme #
Özyineleme , her bir ifadeyi çözmek için aynı algoritmayı kullanana kadar 
bir ifadeyi giderek daha küçük ifadelere ayırma işlemidir. Daha küçük ifadeler, 
orijinal ifadenin benzer versiyonlarıdır.

Özyinelemeli işlevleri uygulamanın bir yolu, bir if-elseifade kullanmaktır. 
Bir algoritmanın üzerinde çalışacağı olası en küçük ifade olan temel durumuif 
temsil eder ve özyinelemeli çağrıyı temsil eder ; bir işlev kendini 
çağırdığında, özyinelemeli çağrı olarak bilinir . Özyinelemeli işlev , temel 
duruma eşdeğer olana kadar aramayı sonlandırmadan iç içe geçmiş bir şekilde 
kendisini aramaya devam edecektir, bu durumda algoritma uygulanacaktır. İşlev 
çağrıları dışa doğru hareket edecek, bir sonrakine geçmeden önce sona erecek 
ve orijinal işlev çağrısına ulaşana kadar kendilerini azaltacaktır.else

Özyinelemeli çağrılara kutular içinde kutular olarak bakalım.

faktöriyeller #
Faktöriyellerin uygulanması çok ünlü bir özyinelemeli problemdir. Bir sayının 
faktöriyeli, 1 ile başlayan tüm ardışık sayılar , söz konusu sayıya ulaşana 
kadar çarpılarak elde edilir. Bu nedenle, 4'ün faktöriyeli 
( 4 ile temsil edilir ! ) 1 x 2 x 3 x 4 = 24'e eşittir . Yinelemeli olarak, 
4 gibi görünürdü ! = 4 x (3!) .

Kodlamaya başlamadan önce, soruna farklı bir perspektiften bakalım.

Özyinelemeyi düşünmenin bir yolu, bir şeyi gerçekten yanıtlamadan yanıtlamanın 
akıllı-alec yoludur. Birine 5'in faktöriyelinin ne olduğunu sorarsanız , 
4'ün faktöriyelinin 5 katı olduğunu söylerler . Merhaba! 4'ün faktöriyelinin 
ne olduğunu bilseydim , muhtemelen 5'in faktöriyelini nasıl bulacağımı 
da bilirdim . Yani soru tam olarak cevaplanmış değil. 4'ün faktöriyeli nedir , 
o zaman? Konuşma 1 faktörünün ne olduğuna gelinceye kadar beklenen cevabı 
alırsınız . O noktada, evet, bu kolay; 1 olduğunu biliyorum . O andan itibaren 
tüm parçaları bir araya getirmeye başlıyorsunuz ve cevabınızı alıyorsunuz.
*/
int factorial(int x) {
  if (x == 1) { // Base Case
    return 1;
  } else {
    return x*factorial(x-1); // Recursive Call
  }
}

main() {
  // Driver Code
  var result = factorial(5);
  print(result);
}