/*
Type Test Operators
Tip Test Operatörleri

Tip testi operatörleri, çalışma zamanında bir nesnenin tipini kontrol etmek 
için kullanılabilen operatörlerdir. Aşağıda Dart tarafından desteklenen tip 
testi operatörlerinin bir listesi bulunmaktadır.


Şebeke	                  Kullanmak

as	                      daktilo
                          typecast

is	                      Nesne belirtilen türe sahipse doğru
                          True if the object has the specified type

is!	                      Nesne belirtilen türe sahipse False
                          False if the object has the specified type

sözdizimi #
Tip testi operatörlerinin iki işleneni olsa da işlenenlerin sırası önemlidir. 
Türü kontrol edilmesi gereken değer operatörün solunda, türün kendisi ise 
operatörün sağında olmalıdır.

value operator type

Temel sözdizimi aşağıdaki gibidir:                          
*/

main() {
  double type1 = 5.0;
  int type2 = 87;
  String type3 = "educative";
  bool type4 = true;

  print(type1 is int);
  // ignore: unnecessary_type_check
  print(type2 is int);
  // ignore: unnecessary_type_check
  print(type3 is String);
  print(type4 is double);
  print(type4 is! double);
}
