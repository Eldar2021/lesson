/*
Aritmetik operatörler
Bir sonraki derste, aritmetik operatörlerle tanışacaksınız.
Operatör Listesi
Önek ve Sonek Operatörleri
++var
var++
- -var
var- 

Şebeke	                   Kullanmak

+	                         İki işlenen ekler

-	                         İkinci işleneni birinciden çıkarır

-                          ifade	İfadenin işaretini ters çevirir (birli eksi)

*	                         Her iki işleneni de çarpar

/	                         İlk işleneni ikinci işlenene böler

~/	                       İlk işleneni ikinci işlenene böler ve bir 
                           tamsayı değeri döndürür

%	                         Bir sayının diğeriyle bölümünden kalanı verir

*/
main() {
  var operand1 = 10;
  var operand2 = 7;

  print(operand1 + operand2);
  print(operand1 - operand2);
  print(- operand1);
  print(operand1 * operand2);
  print(operand1 / operand2);
  print(operand1 ~/ operand2);
  print(operand1 % operand2);
}

/*
Çalıştır'a bastığımızda gördüğümüz çıktı, beklenen bir çıktıdır.

Operatörlerin çoğu matematikte düzenli olarak gördüğümüz operatörlerdir. 
Yeni olabilecek tek şey ~/. Yapılması ~/gereken her iki işleneni de bölmek, 
ondalık değerden kesirli kısmı çıkarmak ve tam sayıyı tutmaktır. Fark, 
yukarıdaki kodun 9. ve 10. satırında açıktır .

Prefix and Postfix Operators#
Dart ayrıca hem önek hem de sonek artırma ve eksiltme operatörlerini destekler.

Aşağıda Dart tarafından desteklenen aritmetik önek ve sonek artırma ve 
eksiltme operatörlerinin bir listesi bulunmaktadır.

Operator	                          Use

++var	                              var = var + 1

var++	                              var = var + 1

--var	                              var = var - 1

var--	                              var = var - 1

*/
