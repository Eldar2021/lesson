/*
yieldAnahtar kelime Dart'ta gerçekte ne yapar ?
yieldasync * çevreleyen işlevin çıkış akışına bir değer ekler . 
Gibi return, ancak işlevi sonlandırmıyor.
*/

void main() async {
  Iterable<int> itarableNumbers = syncYieldItarable(7);
  print(itarableNumbers);

  Iterable<int> itarableNumbers1 = syncYieldItarable1(9);
  print(itarableNumbers1);

  Stream<int> streamNumbers = asyncYieldStream(-7);

  streamNumbers.listen((int value) {
    print('$value');
  });

  Stream<int> streamNumbers1 = asyncYieldStream1(9);

  streamNumbers1.listen((int value) {
    print('$value');
  });
}

/// sync* yield bir döndürür Iterable<dynamic>.
Iterable<int> syncYieldItarable(int number) sync* {
  for (int i = 0; i < number; i++) {
    yield i;
  }
}

/// sync* yield* bir işlev çağırır ve geri döner Iterable<dynamic>.
Iterable<int> syncYieldItarable1(int n) sync* {
  if (n > 0) {
    yield n;
    yield* syncYieldItarable1(n - 1);
  }
}

/// async* yield bir döndürür Stream<dynamic>.
Stream<int> asyncYieldStream(int n) async* {
  for (int i = n; i < 0; i++) {
    await new Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

/// async* yield* bir işlev çağırır ve geri döner Stream<dynamic>.
Stream<int> asyncYieldStream1(int n) async* {
  if (n > 0) {
    await new Future.delayed(const Duration(seconds: 1));
    yield n;
    yield* asyncYieldStream1(n - 1);
  }
}
