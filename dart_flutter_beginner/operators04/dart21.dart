/*
Logical Operators
Mantıksal operatörler
In the following lesson, you will be introduced to logical operators.

Mantıksal Operatör Türleri

Mantıksal operatörler , Mantıksal AND ve Mantıksal VEYA gibi mantıksal 
işlemleri gerçekleştiren operatörlerdir . boolTür işlenenleri alırlar ve 
booltür sonuçları verirler. Aşağıda Dart tarafından desteklenen mantıksal 
operatörlerin bir listesi bulunmaktadır.

Şebeke	    İsim	                Kullanmak

!	          mantıksal DEĞİL 	    İşleneninin mantıksal durumunu tersine 
                                  çevirir. Bir koşul doğruysa, Mantıksal DEĞİL 
                                  operatörü onu yanlış yapacaktır.

||	        mantıksal VEYA	      İki işlenenden herhangi biri yanlış değilse, 
                                  sonuç doğrudur.

&&	        mantıksal VE	        Her iki işlenen de yanlış değilse, sonuç 
                                  doğrudur

Aşağıda, mantıksal işleçler için indirgeme kurallarının bir listesini 
bulacaksınız. Liste, her operatörün ifadeleri son biçimlerine nasıl 
indirgediğini özetleyeceği için kullanışlıdır.

ifade , türünde bir işlenenle değiştirilebilen isteğe bağlı bir ifadedir 
Boolean. İşlenen trueveya falsekendisi olabilir veya azaltan bir ifade olabilir 
true veya false.
*/

main() {
  var A = true;
  var B = false;
  var expr = A && B; //false

  print(!A); // !true --> false
  print(!B); // !false --> true
  // ignore: dead_code
  print(true || expr); // true || expr --> true
  print(false || expr); // false || expr --> expr
  print(true && expr); // true && expr --> expr
  print(false); // false && expr --> false
}
