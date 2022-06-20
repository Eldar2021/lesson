/*
if Bildirimi
Bu dersimizde if ifadesinin nasıl kullanılacağını inceleyeceğiz.

Giriş #
İfade , kodun yürütülebilmesi için yerine getirilmesiif gereken koşulları 
kodunuza dahil etmenize olanak tanır .

Bilgisayar dünyasından uzaklaşarak, sabah uyandığınızı ve dışarı çıkmak için 
hazırlandığınızı hayal edelim. Kapıya ulaştığınızda, dışarıda yağmur yağıp 
yağmadığından emin değilsiniz. Dışarıda yağmur yağıyorsa, yanınıza bir şemsiye 
alacaksınız. Yağmur yağmıyorsa, yanınıza şemsiye almak istemezsiniz, bu yüzden 
hiçbir şey yapmaz ve gidersiniz. Nihai kararınız, dışarıdaki hava durumuna 
bağlı olarak koşulludur. Bu, koşullu ifadelerin işleyiş şekliyle aynıdır.

Koşullu ifadeler, programın durumunu göz önünde bulundurdukları ve buna göre 
hareket ettikleri için inanılmaz derecede güçlüdür. Bu, programcıya karar 
verme yeteneği sağlar.

ifEylemde #
Aşağıdaki örneğimizde, sadece boş değilse bir listeyi boşaltmak istiyoruz .

Bir koleksiyonun boş olup olmadığını isEmptyve isNotEmpty özelliklerini 
kullanarak kontrol edebilirsiniz. isEmptybir true koleksiyonun boş olduğu ve 
isNotEmpty bir true koleksiyonun boş olmadığı zamandır.
*/
main() {
  var testList = [2,4,8,16,32];
  print(testList);

  if(testList.isNotEmpty){
    print("Emptying List");
    testList.clear();
  }

  print(testList);
}
