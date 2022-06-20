/*
Zorluk: Mutlak Değer
Kendinizi test edin ve şimdiye kadar öğrendiklerinizi bu meydan okumada 
uygulayın.

Sorun Bildirimi #
absoluteBelirli bir sayının mutlak değerini hesaplayan bir işlev 
oluşturmanız gerekir .

giriş #
Fonksiyonun girişi , mutlak değerini hesaplamak istediğiniz xtürden 
bir sayıdır .num

çıktı #
Çıktı mutlak değer olacaktır x.
*/
num absolute(num x) {
  // Write your code here
  if(x<0){
    return x*-1;
  }else{
    return x;
  }// Remove this line after writing your code
}

num absolute1(num x) {
  var abs = x < 0 ? -x : x;
  return abs;
}