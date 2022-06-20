/*
https://www.educative.io/courses/learn-dart-first-step-to-flutter/xo10Y7rXnr3
Bitwise and Shift Operators
In the following lesson, you will be introduced to bitwise and shift operators.
Bitsel ve Shift Operatörleri

Bitsel ve Shift Operatörlerinin Türleri #
Bitsel operatörler ve kaydırma operatörleri, tamsayı türlerinin ayrı bitleri 
üzerinde işlem gerçekleştiren operatörlerdir. Aşağıda Dart tarafından 
desteklenen bitsel operatörlerin bir listesi bulunmaktadır.

Şebeke	İsim	                    Kullanmak

&	      bit düzeyinde VE	        Her iki işlenende de karşılık gelen 
                                  bit 1 ise 1 verir , yoksa 0

|	      Bit düzeyinde VEYA	      En az bir işlenendeki karşılık gelen 
                                  bit 1 ise 1 verir , yoksa 0

^	      Bitsel XOR	              Yalnızca bir işlenendeki karşılık gelen 
                                  bit 1 ise 1 verir , yoksa 0

~	      Tekli Bitsel Tamamlayıcı	0 olan bitler 1 olur ve 1 olan bitler 0 olur


Aşağıda Dart tarafından desteklenen vardiya operatörlerinin bir listesi 
bulunmaktadır.

Şebeke	  İsim	            Kullanmak

<<	      Sola kay	        İşlenenin tüm bitlerini belirtilen miktarda 
                            sola kaydırır

>>	      Sağa Kaydır     	İşlenenin tüm bitlerini belirtilen miktarda 
                            sağa kaydırır

Hem bit düzeyinde hem de kaydırma operatörleri ikili sayılar üzerinde çalışır.

Sayılar ikili biçimde saklanır. Ancak, işlemler ikili olarak gerçekleşirken 
işlenenleri ve sonuçları ondalık olarak görüyoruz. 

Aşağıda, her bir bitsel operatörün izlediği kuralların bir listesi 
bulunmaktadır. Bitsel operatörler için ikili sayılarla çalışıyoruz. 
Dolayısıyla, yanlış ve doğru yerine, 1 ve 0 kullanacağız, burada 1 doğru ve 
0 yanlış gibi davranır. bit 1 veya 0 olabilir .

*/
main() {
  var A = 12;
  var B = 5;

  print(~A); // A complement
  print(~B); // B complement
  print(A & B); // A AND B
  print(A | B); // A OR B
  print(A ^ B); // A XOR B
  print(B << 2); // B Shift Left 2
  print(A >> 2); // A Shift Right 2
}

/*
Kodu Anlamak #
Kodun çıktısı, bu bölümde incelediğimiz çıktılar kadar net olmayabilir. 
Operatörlerin her seferinde bir adım ne yaptığını parçalayalım.

A & B#
Operatör önce her ondalık işleneni ikili biçimine dönüştürür.

12 ikili biçimde0000
0000
 1100
1100
5 ikili biçimde0000
0000
 0101
0101

Oradan, ikili AND operatörü ( &) için yukarıdaki kuralları her bit çifti için 
uygulayacaktır, yani ilk bit 12 ile ilk bit 5 vb.
Ve bu şekilde A & Bbir sonuç verecektir 4.
*/
