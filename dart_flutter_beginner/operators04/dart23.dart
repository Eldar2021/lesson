/*
https://www.educative.io/courses/learn-dart-first-step-to-flutter/m7yoq4VPlR0
Challenge: Using Multiple Operators
Test yourself and implement what you have learned so far in this challenge.
Zorluk: Birden Çok Operatör Kullanmak

Sorun Bildirimi #
checkSize bir tamsayı değeri depolayan bir değişken verilir . 
compareCheckDepolanan değerin 75'ten küçük ve 8'den büyük veya ona eşit olup 
olmadığını kontrol checkeden bir değişken oluşturmanız gerekir . Sonuç, 
8 ile 75true arasındaysa ve değilse, olmalıdır.false

Solution Review: Using Multiple Operators
*/

main() {
  var check = 33;
  var compareCheck = (check < 75) && (check >= 8);

  // Driver Code
  print(compareCheck);
}
