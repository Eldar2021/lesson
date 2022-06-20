/*
Unordered Sets
In the following lesson, you will learn how to create a set in Dart.

Küme = Set

Sırasız Kümeler
Bir sonraki derste Dart'ta nasıl set oluşturulacağını öğreneceksiniz.

Giriş #
Dart'ta set , sıralanmamış benzersiz öğeler topluluğudur . Bu, öğelerin bir 
kümede belirli bir konuma sahip olmadığı anlamına gelir, bu nedenle bir kümede 
aynı öğenin kopyaları olamaz.

Set Oluşturma #
Bir küme oluşturmanın birden çok yolu vardır. Aşağıda daha yaygın olanlara 
bakalım.

Listeler gibi, setler de set değişmezleri kullanılarak oluşturulabilir. 
Sözdizimi hemen hemen aynıdır, tek fark, liste değişmezlerinin köşeli 
parantezler ( []) kullanması ve set değişmezlerinin küme parantezleri 
( {}) kullanmasıdır.
*/
main() {
  var simpleSet = {1, 2, 3};

  print(simpleSet);
}

/*
var Anahtar kelime ve ardından benzersiz bir tanımlayıcı ( ) ile başlıyoruz 
setName. Eşittir işaretinden ( ) sonra, kümemizde olmasını istediğimiz öğeleri, 
her bir öğe virgülle ( ) ayırarak =, açılış küme parantezini ( ) ekleriz . 
Son elemandan sonra, kapanış küme parantezini ( ) yerleştiriyoruz.{,}
*/
main1() {
  // ignore: equal_elements_in_set
  var simpleSet = {1, 2, 3, 3};

  print(simpleSet);
}

/*
Yukarıdaki kod parçasında iki 3' li bir set oluşturuyoruz. Ancak seti 
yazdırdığımızda ikincisi 3görüntülenmiyor. Bunun nedeni Dart'ın kopyaları 
yok saymasıdır.

Bir Oluşturucu Kullanarak Boş Bir Küme Oluşturma #
Set yapıcısını kullanarak da bir set bildirebilirsiniz . Bir Set yapıcısı , 
küme parantezleri ( ) kullanarak bir nesne oluşturur {}.

Bunun için birden fazla yol var. Aşağıdaki genel sözdizimlerinden bazılarına 
bakalım:

Boş bir küme bildirirken veri tipinden bahsetmek önemlidir. Veri türünü 
atlarsak, bunun yerine bir harita elde ederiz. Haritaları tartışırken bununla 
ilgili daha fazla bilgi.
*/
main2() {
  var setOfFruit = <String>{};
  print(setOfFruit);

  Set<String> anotherSetOfFruit = {};
  print(anotherSetOfFruit);
}
