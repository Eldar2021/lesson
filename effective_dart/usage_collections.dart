/*
Collections
Dart, kullanıma hazır dört koleksiyon türünü destekler: lists, maps, queues, 
ve sets.

Aşağıdaki en iyi uygulamalar koleksiyonlar için geçerlidir.

Mümkün olduğunda koleksiyon değişmezlerini kullanın.

Dart'ın üç temel koleksiyon türü vardır: Liste, Harita ve Küme. Map ve Set 
sınıfları, çoğu sınıfın yaptığı gibi adsız kuruculara sahiptir. Ancak bu 
koleksiyonlar çok sık kullanıldığı için Dart'ın bunları oluşturmak için daha 
iyi yerleşik sözdizimi vardır:
*/
/// Good!
var points = <double>[];
var addresses = <String, bool>{};
var counts = <int>{};

/// Bad!
var varible = Map<String, bool>();
var varibleSet = Set<int>();

/*
Bu kılavuzun, bu sınıflar için adlandırılmış oluşturucular için geçerli 
olmadığını unutmayın . List.from(), Map.fromIterable()ve arkadaşların hepsinin 
kullanımları vardır. (List sınıfı ayrıca adsız bir kurucuya sahiptir, ancak boş 
güvenli Dart'ta yasaktır.)
*/
/*
.lengthBir koleksiyonun boş olup olmadığını görmek için KULLANMAYIN .

Yinelenebilir sözleşme , bir koleksiyonun uzunluğunu bilmesini veya sabit bir 
zamanda sunabilmesini gerektirmez. Sadece koleksiyonun herhangi bir şey.length 
içerip içermediğini görmek için aramak acı verici bir şekilde yavaş olabilir.

Bunun yerine, daha hızlı ve daha okunabilir alıcılar var: .isEmptyve 
.isNotEmpty. Sonucu reddetmenizi gerektirmeyen birini kullanın.
*/

/// Good!
dynamic playGood(List lunchBox, List words) {
  if (lunchBox.isEmpty) return 'so hungry...';
  if (words.isNotEmpty) return words.join(' ');
}

/// Bad!
dynamic playBad(List lunchBox, List words) {
  if (lunchBox.length == 0) return 'so hungry...';
  if (!words.isEmpty) return words.join(' ');
}

/*
Iterable.forEach()Bir işlev değişmezi ile kullanmaktan KAÇININ .

forEach()İşlevler JavaScript'te yaygın olarak kullanılır çünkü yerleşik 
for-indöngü genellikle istediğinizi yapmaz. Dart'ta, bir dizi üzerinde yineleme 
yapmak istiyorsanız, bunu yapmanın deyimsel yolu bir döngü kullanmaktır.

good*
  for (final person in people) {
   ...
  }

bad*
  people.forEach((person) {
    ...
  });


Bu kılavuzun özellikle "işlev değişmezi " dediğine dikkat edin. Her öğede zaten 
var olan bir işlevi çağırmak istiyorsanız , sorun değil forEach().

good*
  people.forEach(print);

Ayrıca, kullanmanın her zaman uygun olduğunu unutmayın Map.forEach(). Haritalar 
yinelenemez, bu nedenle bu kılavuz geçerli değildir.  
*/
/*
whereType() Bir koleksiyonu türe göre filtrelemek için KULLANIN .

Diyelim ki, nesnelerin bir karışımını içeren bir listeniz var ve bundan sadece 
tam sayıları almak istiyorsunuz. Bunun gibi kullanabilirsiniz where():
*/
/// Bad!
var objects = [1, 'a', 2, 'b', 3];
var ints = objects.where((e) => e is int);

// Bu ayrıntılıdır, ancak daha da kötüsü, türü muhtemelen istediğiniz gibi
// olmayan yinelenebilir bir öğe döndürür. Buradaki örnekte, filtrelediğiniz
// tür olduğu için Iterable<Object>büyük olasılıkla istemenize rağmen bir
//  döndürür.Iterable<int>

// Bazen şunu ekleyerek yukarıdaki hatayı "düzelten" bir kod görürsünüz cast():

/// Bad!
var objects1 = [1, 'a', 2, 'b', 3];
var ints1 = objects.where((e) => e is int).cast<int>();

// Bu ayrıntılıdır ve iki katman dolaylı ve yedek çalışma zamanı denetimi ile
// iki sarmalayıcının oluşturulmasına neden olur. Neyse ki, çekirdek kitaplık
// whereType()tam olarak bu kullanım durumu için bir yönteme sahiptir:

/// Good!
var objects2 = [1, 'a', 2, 'b', 3];
var ints2 = objects.whereType<int>();

// Kullanım özlüdür, istenen türde bir YinelenebilirwhereType() üretir ve
// gereksiz sarma seviyeleri yoktur.

/*
cast() Yakındaki bir işlem uygun olduğunda KULLANMAYIN .

Genellikle bir yinelenebilir veya akışla uğraşırken, üzerinde birkaç dönüşüm 
gerçekleştirirsiniz. Sonunda, belirli bir tür argümanına sahip bir nesne 
üretmek istiyorsunuz. Bir çağrıyı takip etmek yerine cast(), mevcut 
dönüşümlerden birinin türü değiştirip değiştiremeyeceğini görün.
*/

/// Good!
var stuff = <dynamic>[1, 2];
var sayilar = List<int>.from(stuff);

/// Bad!
var stuff1 = <dynamic>[1, 2];
var sayilar1 = stuff.toList().cast<int>();

// 'yi çağırıyorsanız map(), istenen türde bir yinelenebilir üretebilmesi için
// ona açık bir tür bağımsız değişkeni verin. Tür çıkarımı, genellikle
// ilettiğiniz işleve göre sizin için doğru türü seçer map(), ancak bazen açık
// olmanız gerekir.

/// Good!
var stuff2 = <dynamic>[1, 2];
var sayilar2 = stuff.map<double>((n) => 1 / n);

/// Bad!
var stuff3 = <dynamic>[1, 2];
var sayilar3 = stuff.map((n) => 1 / n).cast<double>();

/*
kullanarak KAÇININ cast().

Bu, önceki kuralın daha yumuşak genellemesidir. Bazen, bazı nesnelerin türünü 
düzeltmek için kullanabileceğiniz yakınlarda bir işlem yoktur. cast()O zaman 
bile, mümkün olduğunda bir koleksiyonun türünü "değiştirmek" için kullanmaktan 
kaçının .

Bunun yerine şu seçeneklerden herhangi birini tercih edin:

  Doğru tiple oluşturun. Koleksiyonun ilk oluşturulduğu kodu, doğru türe 
  sahip olacak şekilde değiştirin.

  Öğeleri erişimde yayınlayın. Derhal koleksiyonu yinelerseniz, her öğeyi 
  yinelemenin içine yayın.

  hevesle kullanarak döküm List.from(). Sonunda koleksiyondaki öğelerin çoğuna 
  erişecekseniz ve nesnenin orijinal canlı nesne tarafından desteklenmesine 
  ihtiyacınız yoksa, kullanarak dönüştürün List.from().

Yöntem , her işlemdecast() öğe türünü kontrol eden tembel bir koleksiyon 
döndürür. Sadece birkaç element üzerinde sadece birkaç işlem yaparsanız, o 
tembellik iyi olabilir. Ancak çoğu durumda, tembel doğrulamanın ve paketlemenin 
ek yükü, faydalarından daha ağır basar.  
*/

/// Good!
List<int> singletonList(int value) {
  var list = <int>[];
  list.add(value);
  return list;
}

/// Bad!
List<int> singletonList1(int value) {
  var list = []; // List<dynamic>.
  list.add(value);
  return list.cast<int>();
}

/// Good!
void printEvens(List<Object> objects) {
  // We happen to know the list only contains ints.
  for (final n in objects) {
    if ((n as int).isEven) print(n);
  }
}

/// Bad!
void printEvens1(List<Object> objects) {
  // We happen to know the list only contains ints.
  for (final n in objects.cast<int>()) {
    if (n.isEven) print(n);
  }
}

/// Good!
int median(List<Object> objects) {
  // We happen to know the list only contains ints.
  var ints = List<int>.from(objects);
  ints.sort();
  return ints[ints.length ~/ 2];
}

/// Bad!
int median1(List<Object> objects) {
  // We happen to know the list only contains ints.
  var ints = objects.cast<int>();
  ints.sort();
  return ints[ints.length ~/ 2];
}

// Bu alternatifler elbette her zaman işe yaramaz ve bazen cast()doğru
// cevaptır. Ancak bu yöntemi biraz riskli ve istenmeyen bir yöntem olarak
// düşünün; dikkatli olmazsanız yavaş olabilir ve çalışma zamanında başarısız
// olabilir.
