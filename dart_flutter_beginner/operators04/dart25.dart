/*
Challenge: Temperature Conversion
Zorluk: Sıcaklık Dönüşümü
Kendinizi test edin ve şimdiye kadar öğrendiklerinizi bu meydan okumada 
uygulayın.

Sorun Bildirimi #
fahrenheitSize bir sıcaklığı Fahrenheit derece olarak kaydeden bir değişken 
verilir . Depolanan sıcaklığı Santigrat derecesine celsiusdönüştüren bir 
değişken oluşturmanız gerekir .fahrenheit

Sıcaklığı Fahrenhayt dereceden Santigrat dereceye dönüştürmek için önce 
sıcaklıktan 32 çıkarmanız, ardından 5 ile çarpmanız ve ardından 9 ile 
bölmeniz gerekir .

Çözüm #
Sıcaklıkları Fahrenheit dereceden Celsius'a dönüştürmek için kullanılan formül:

(fahrenheit - 32) * 5 / 9

Tek yapmanız gereken, celsiusyukarıdaki dönüştürme formülünü yeniden yazmak ve ona atamaktı.

var celsius = (fahrenheit - 32) * 5 / 9;
*/

main() {
  var fahrenheit = 50;
  var celsius = (fahrenheit - 32) * (5 / 9);

  // Driver Code
  print(celsius);
}
