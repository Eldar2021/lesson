/*
Zorluk: Listelerin Toplamı
Kendinizi test edin ve şimdiye kadar öğrendiklerinizi bu meydan 
okumada uygulayın.

Sorun Bildirimi #
sumBu görevde, bir Listedeki tam sayıların toplamını döndüren özyinelemeli 
bir işlev oluşturmanız gerekir .

giriş #
İşlevin girişi, bir tamsayı listesi numberListve içindeki son öğenin 
dizinidir numberList.

çıktı #
Çıktı, içindeki tüm tamsayıların toplamı olacaktır numberList.

Örnek Giriş #
sum([1,2,3,4,5], 4)

Örnek Çıktı #
15
*/

int sum(List<int> numberList, int index) { 
  if(index<0){
    return 0;
  }else{
    return numberList[index] + sum(numberList, index-1);
  }
 // Remove this line after writing your code
}