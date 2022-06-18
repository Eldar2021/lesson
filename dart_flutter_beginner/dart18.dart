/*
Equality and Relational Operators
Eşitlik ve İlişkisel Operatörler

İlişkisel işleçler, sayısal türdeki işlenenleri karşılaştıran işlemleri 
gerçekleştiren işleçlerdir, örneğin, küçük ve büyük . Eşitlik operatörleri, 
herhangi bir türdeki işlenenleri karşılaştırabilir ve sayıları ikidir 
( ==ve !=). Aşağıda Dart tarafından desteklenen eşitlik ve ilişkisel 
operatörlerin bir listesi bulunmaktadır.


Şebeke	                 Kullanmak

==	                     İki işlenenin değerlerinin eşit olup olmadığını 
                         kontrol eder (eşitse doğru)

!=	                     İki işlenenin değerlerinin eşit olup olmadığını 
                         kontrol eder (eşit değilse doğru)

>	                       Sol işlenenin değerinin sağ işlenenin değerinden 
                         büyük olup olmadığını kontrol eder

<	                       Sol işlenenin değerinin sağ işlenenin değerinden küçük 
                         olup olmadığını kontrol eder

>=	                     Sol işlenenin değerinin sağ işlenenin değerinden büyük 
                         veya ona eşit olup olmadığını kontrol eder

<=	                     Sol işlenenin değerinin sağ işlenenin değerinden küçük 
                         veya ona eşit olup olmadığını kontrol eder

Eşitlik ve ilişkisel işleçler bir Booleantür sonucu verir.
İlk işleneni 10 ve ikinci işleneni 7 olarak alarak , her operatör için bir 
örneğe bakalım.                         
*/

main() {
  var operand1 = 10;
  var operand2 = 7;

  print(operand1 > operand2);
  print(operand1 < operand2);
  print(operand1 >= operand2);
  print(operand1 <= operand2);

  print(operand1 == operand2);
  print(operand1 != operand2);

  var a = 'a';
  var b = 'b';

  print(a == b);
  print(a != b);  
}
