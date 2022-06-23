// https://ptyagicodecamp.github.io/dart-generators.html
/*
Dart Generators
Dart generator işlevleri, istek üzerine tembel bir şekilde değer dizisi 
oluşturmak için kullanılır. Bu tür değer dizisi, senkron veya asenkron olarak 
üretilebilir. Her iki senaryoyu da desteklemek için kullanılabilen iki tür 
yerleşik oluşturucu işlevi vardır:

Senkron Oluşturucu: Senkron üreteç işlevi, Yinelenebilir bir nesne döndürür. 
Bu, önce değerlerin üretildiği ve ardından işlev tarafından istek üzerine 
tembel bir şekilde döndürüldüğü anlamına gelir.

Yinelenebilir: Sırayla erişilebilen bir değerler topluluğu veya "öğeler".

terable: A collection of values, or "elements", that can be accessed 
sequentially.

Eşzamansız Oluşturucu: Eşzamansız oluşturucu işlevi, bir Akış nesnesi döndürür. 
Değer dizisi, kullanılabilir olduklarında talep üzerine oluşturulur.

Akış: Eşzamansız veri olaylarının kaynağı.

Jeneratör fonksiyonlarını bir örnek yardımıyla anlayalım. Jeneratör 
fonksiyonlarını kullanarak, örneğin 5'ten 0'a kadar belirli bir sayıdan 
başlayarak sayılar üreteceğiz. Bu sayı dizisini oluşturmak için her iki yolu 
da (asenkron ve senkron üreteçler) gözlemleyeceğiz.
*/

/*
Kullanma sync*- Senkron Jeneratör
Fonksiyon Iterable<int> countDownFromSync(int num) sync*bir sayıyı olarak alır 
numve 0'dan başlayarak tüm sayıları gönderir num. Senkron üreteç fonksiyonu 
ile işaretlenir sync*. Değerler anahtar kelime kullanılarak döndürülür yield. 
Yinelenebilir sequence, sayı dizisini alır ve fordöngü kullanarak her sayıyı 
yazdırır. forBu sayı dizisi aslında döngü tarafından erişilene kadar 
oluşturulmaz .
*/
void main1() {
  Iterable<int> sequence = countDownFromSync(5);

  print(sequence);

  for (int value in sequence) {
    print(value);
  }

  /// ------------ -----------------------------
}

//sync*
Iterable<int> countDownFromSync(int num) sync* {
  while (num > 0) {
    yield num--;
  }
}

/// ------------ --------------------------------

/*
Kullanma async*- Asenkron Jeneratör
Fonksiyon Stream<int> countDownFromAsync(int num) async*bir sayıyı olarak alır 
numve 0'dan başlayarak sayı dizisini numiletir. Asenkron üreteç fonksiyonu ile 
işaretlenmiştir async*. Değerler anahtar kelime kullanılarak döndürülür yield. 
Akış sequence, sayı dizisini alır. Değerlerine, dinlemeye başlar başlamaz 
erişilebilir.
*/

void main2() {
  Stream<int> sequence = countDownFromAsync(5);

  print(sequence);

  sequence.listen((int value) {
    print(value);
  });
}

//async*
Stream<int> countDownFromAsync(int num) async* {
  while (num > 0) {
    yield num--;
  }
}

/*
Kullanma sync* + yield*- Özyinelemeli Senkron Üreteç
Jeneratör işlevleri özyinelemeli yield*olarak kullanıldığında, bu tür 
özyinelemeli işlev çağrılarını işaretlemek için kullanılır. Bu örnek, üreteç 
işlevlerinin yinelemeli olarak nasıl kullanılacağını gösterir. Özyinelemeli 
olmayan uygulama ile aynı çıktıyı fark edeceksiniz. Anahtar kelime yield*, 
özyinelemeli olarak adlandırılan işlev için kullanılır.
*/

void main3() {
  Iterable<int> sequence = countDownFromSyncRecursive(5);

  print(sequence);

  for (int value in sequence) {
    print(value);
  }
}

//sync* + yield* for recursive functions
Iterable<int> countDownFromSyncRecursive(int num) sync* {
  if (num > 0) {
    yield num;

    yield* countDownFromSyncRecursive(num - 1);
  }
}

/*
Kullanma async* + yield*- Özyinelemeli Asenkron Jeneratör
Bu, bir eşzamansız üreteç işlevini yinelemeli olarak kullanmaya bir örnektir. 
Ayrıca özyinelemeli olmayan karşı parçası ile aynı çıktıya sahiptir.
*/

void main4() {
  Stream<int> sequence = countDownFromAsyncRecursive(5);

  print(sequence);

  sequence.listen((int value) {
    print(value);
  });
}

//async* + yield* for recursive functions
Stream<int> countDownFromAsyncRecursive(int num) async* {
  if (num > 0) {
    yield num;

    yield* countDownFromAsyncRecursive(num - 1);
  }
}
