/*
else and else if
Bu derste, else ve else if kullanarak koşullu ifadeleri nasıl 
iyileştireceğinizi öğreneceksiniz.

Giriş #
Basketbol oynadığınızı hayal edin. Oyun bittiğinde, kimin kazandığına karar 
vermek için hakem her takımın toplam puanlarını sayar. A takımı daha fazla 
puan alırsa , kazanan ilan edilir, aksi takdirde B takımı kazanan ilan edilir.

Sonuca bağlı olarak nasıl iki farklı eylemimiz olduğunu görüyor musunuz?

Yukarıdaki senaryo için biraz kod yazmak istersek, akla ilk gelen şey 
ifdeyimdir. Ancak ififade işi kendi başına yapamayacak çünkü yalnızca bir 
koşula ve bir sonuca hitap ediyor. Senaryomuzun iki sonucu var.

Dart bir elseaçıklama sağlar. elsebir deyimle birlikte kullanılır ve 
derleyiciye koşul sağlanmadığında ifne yapacağını söyler .if
*/
main() {
  var pointsA = 50;
  var pointsB = 64;

  if(pointsA > pointsB){
    print("Team A Wins!");
  } else {
    print("Team B Wins!");
  }
}
/*
Değişken pointsA, A takımı tarafından yapılan puanların sayısını ve B 
takımıpoints B tarafından yapılan puanların sayısını saklar .

A takımının B takımından daha fazla puanı varsa , yani , 
pointsA > pointsByazdırılır Team A Wins!. Aksi takdirde Team B Wins! yazdırılır.

Şimdi, ya her iki takım da aynı sayıda puana sahipse? ifKoşul yanlış olacak ve 
kodu çalıştırılarak elseB takımı kazanmadığı Team B Wins!için Ancak, bu 
yanlıştır . Aşağıda bu sorunu nasıl çözebileceğimize bakalım.

else ifAçıklama # _
elsesadece iki olası sonucumuz olduğunda harikadır. Ancak, ikiden fazla 
sonucumuz olursa ne olur?

Dart ayrıca bir else ifaçıklama sağlar. else ifayrıca bir ififadeyle birlikte 
kullanılır, ancak bunun aksine , yalnızca koşul ise elseyürütülecek olan 
alternatif kodla birlikte bir koşul belirtmeniz gerekir .else iftrue

Sözdizimi aşağıdaki gibidir:
*/
main1() {
  var pointsA = 50;
  var pointsB = 50;

  if(pointsA > pointsB){
    print("Team A Wins!");
  } else if(pointsB > pointsA) {
    print("Team B Wins!");
  } else {
    print("It's a Tie!");
  }
}
