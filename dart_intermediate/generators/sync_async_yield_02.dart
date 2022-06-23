// https://bwnyasse.net/post/5-sync-async-yield-and-yield-dart/
/*
Dart ile bir uygulama geliştirmeye başladığınızda ve asenkronizm ile biraz 
ilgilendiğinizde, async anahtar kelimesine sahip kod görüyorsunuz , ancak 
yıldızla (*) async nedir? veya yıldızla senkronize edin: async* ve sync*

Oldukça basit, bunlar üreteç işlevlerinde kullanılan anahtar sözcüklerdir 
(İngilizce'de generators işlevlerinden bahsediyoruz .

Üreteç işlevleri , değer dizileri üretir (normal işlevlerin aksine, 
Normal işlevler tek bir değer döndürür)

Jeneratör işlevleri şunlar olabilir:

asenkron : değerleri bir Akış olarak döndürür

senkron : bir değerler listesi döndürür
*/
/*
Yield nedir?

Yield, oldukça basit bir şekilde, devam eden dizide yalnızca bir değer 
döndürdüğünü ancak işlevi durdurmadığını (değerlerin üretimi devam eder) 
bildirmeyi mümkün kılan bu anahtar kelimedir

Jeneratörlerle ilgili çok ilginç olan şey, değerleri talep üzerine 
üretmeleridir, yani bir yineleme yapmaya çalıştığımızda veya akışı dinlemeye 
başladığımızda dizinin değerlerinin üretilmesidir, ÖNCE DEĞİL!
*/
/// Senkronizasyon İşlemi*
/// Aşağıda, senkronizasyonun* nasıl çalıştığını gösteren bir örnek verilmiştir

main() async {
  /// evenNumbersDownFrom
  final iterableNumbers = evenNumbersDownFrom(7);
  print(iterableNumbers);

  /// printNumbersDownAsync
  // final streamNumbers = printNumbersDownAsync(7);
  // streamNumbers.listen((event) {
  //   print(event);
  // });

  /// loadMessageForNumber
  // final futureNumbers = await loadMessageForNumber(22);
  // print(futureNumbers);
}

// sync* functions return an iterable
Iterable<int> evenNumbersDownFrom(int n) sync* {
  // the body isn't executed until an iterator invokes moveNext()
  int k = n;
  print('generator started');
  while (k >= 0) {
    if (k % 2 == 0) {
      // 'yield' suspends the function
      yield k;
    }
    k--;
  }
  print('generator ended');
  // when the end of the function is executed,
  // there are no more values in the Iterable, and
  // moveNext() returns false to the caller
}

/// async* nasıl çalışır?
/// async* ile başka bir örnek

Stream<String> printNumbersDownAsync(int n) async* {
  int k = n;
  print('started generating values...');
  while (k >= 0) {
    yield await loadMessageForNumber(k--);
  }
  print('ended generating values...');
}

Future<String> loadMessageForNumber(int i) async {
  await new Future.delayed(new Duration(milliseconds: 50));
  if (i % 2 == 0) {
    return '$i is even';
  } else {
    return '$i is odd';
  }
}
