/*
Ternary Operator
Üçlü operatör
Bu derste, üçlü operatörün if-else ifadesinin yerine nasıl hizmet 
ettiğini anlayacağız.

Giriş #
Dart, aksi takdirde ifadeler gerektirebilecek if-elseifadeleri kısaca 
değerlendirmenize olanak tanıyan bir operatöre sahiptir.

Tartışacağımız operatör , ile temsil edilen üçlü operatördür?: .

Koşul ise , ifade1true değerlendirilir ve değeri döndürülür. Aksi takdirde, 
ifade2 değerlendirilir ve değeri döndürülür.

Örnek #
İki tamsayıya sahip olduğumuz bir örneğe bakalım ave b. Eğer abüyükse , 
'den çıkarılmak bistiyoruz . Aksi takdirde, çıkarmak istiyoruz .baab
*/
main() {
  var a = 5;
  var b = 2;
  
  var result = a > b ? a - b : b - a;
  print(result);
}

main1() {
  var a = 5;
  var b = 2;
  var result;

  if(a > b){
    result = a - b;
  } else {
    result = b - a;
  }
  
  print(result);
}
