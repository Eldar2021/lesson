/*
Anonymous Functions

Anonim İşlevler
Bu derste, anonim işlevlerle tanışacak ve sözdizimlerini öğreneceksiniz.

onksiyon Değişmezleri #
Harfleri öğrendiğimizi hatırlıyor musun ? Doğrudan kaynak kodunda görünen sabit 
değerler olarak tanımlanırlar. Değişmezlerin adlandırılmasına gerek yoktur, 
doğrudan kullanılabilirler.

İşlevleri yalnızca bir kez veya geçici olarak kullanmamız gereken zamanlar 
vardır; yalnızca bu işlevlerin işlevselliğini gerektirir. Bunları adlandırmak, 
bu senaryoda fazladan gereksiz bir adımdır.

İhtiyacımız olan şey, değişmezlere benzer bir şey. İşlevleri olarak 
adlandırılması gerekmeyen işlevler, yalnızca tek bir örnek için gereklidir.

Dart, anonim işlevler olarak bilinen bir çözüm sunar .

Anonim işlevler bazen lambda işlevleri veya kapatmalar olarak bilinir .

Örnekle Öğrenme #
Anonim küp işlevimizi yerleşik yönteme geçirelim forEach. Amacımız, 
bir listedeki her öğenin küpünü elde etmektir.
*/
main() {
  var list = [1,2,3];
  list.forEach((item) {
   print(item*item*item);
  });
}