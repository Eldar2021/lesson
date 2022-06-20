/*
Liste: Dart Dizisi
Listeler, muhtemelen Dart'ta kullanılan en yaygın veri yapısıdır. 
Bir sonraki derste, bir Liste oluşturmayı öğreneceksiniz.

Giriş #
Diziler, bir programlama dili tarafından sağlanan en yaygın ve en popüler veri 
yapılarından biridir. Olduğu söyleniyor, Dart'ta dizi yok. Bunun yerine 
Dart, bir dizinin sağladığı her şeyi aşağı yukarı sağlayan listelere sahiptir.

dizi = array => чоңое албайт
liste = list => чоңое алат

Listeler , sıralı bir nesne koleksiyonudur. Bu, bir listedeki her öğenin 
sabit bir konuma sahip olduğu anlamına gelir. Nesnelere dizine göre erişmeniz 
gerektiğinde bir Liste kullanın.

Liste Oluşturma #
Liste oluşturmanın birden çok yolu vardır. Aşağıda daha yaygın olanlara bakalım.

Değişmezleri Kullanma #
En basit yol, köşeli parantezler ( []) ile birlikte değişmez değerleri 
kullanmaktır.
*/
main() {
  var simpleList = [1,2,3];

  print(simpleList);
}

/*
Bir Yapıcı Kullanma #
Ayrıca List yapıcısını kullanarak bir liste bildirebilirsiniz .
Bir List yapıcısıList , anahtar kelimeyi ve ardından parantez ( ) 
kullanarak bir nesne oluşturur ().

Genel sözdizimi aşağıdaki gibidir:
*/

main1() {
  var listOfVegetables = List;

  print(listOfVegetables);
}
