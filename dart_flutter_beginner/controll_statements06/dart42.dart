/*
while Döngüler
Bu derste while döngüsü ile tanışacaksınız.

Giriş #
Bir cümlede “while” kelimesini kullanırken , onu zamanın yapısıyla 
ilişkilendiririz. İngilizce'de "while" , bir olayın meydana geldiğini ve 
bir diğerinin yerinde olduğunu belirten bir bağlaç olarak kullanılabilir. 
Örneğin, “Kız kardeşim hazırlanırken ben kitap okuyorum” diyebilirsiniz. 
Bu cümle, kitap okuma etkinliğinin, ablanın hazırlandığı etkinlik yerinde 
olduğu sürece gerçekleşmeye devam edeceğini belirtir .

Dart'ta bir whiledöngü aynı şekilde davranır. Bir olay bir koşuldur ve 
diğer olay yürütülecek bir kod gövdesidir. Kod gövdesi, koşul karşılandığı 
sürece (doğrudur) tekrar tekrar yürütülür.

sözdizimi #
Döngüyü çalışırken görmeden önce while, aşağıdaki sözdizimini gözden geçirelim.

whileEylemde #
Aşağıdaki örnekte, bir döngü kullanarak 1'den 10'a kadar olan sayıları 
yazdırmak istiyoruz .while
*/
main() {
  var count = 1;
  while (count <= 10) {
    print(count);
    count += 1;
  }
}

/*
Değişken count, döngü kontrol değişkenimiz olarak hareket ediyor. 
1 değeri ile başlatılır ve değeri 10'dan küçük veya ona eşit kalırken ( ) 
içindeki kod bloğu {}çalışmaya devam edecektir. Kod bloğu, 4. satırdakicount 
geçerli değeri yazdırıyor ve 5. satırda birer birer artırıyor .
*/

/*
do-while#
Dart ayrıca, koşulu kontrol etmeden önce kod bloğunu çalıştıran, 
eklenen bir farkla do-whiletam olarak döngü gibi çalışan bir döngüye sahiptir . 
küme parantezleri ( ) içindeki kodun en az bir kez 
yürütülmesini sağlar.whiledo-while{}

Örnek # ile öğrenin
whileve arasındaki ince farkı anlamak için çok basit bir örneğe bakalım do-while.

Aşağıdaki kod , 1alwaysOne değeri atanan değişmez bir değişken bildirir . 
1 olmadığında değerini yazdırmak istiyoruz . Ne paradoks!alwaysOne

koşulu alwaysOne != 1asla olamayacağından true, değeri alwaysOneasla 
yazdırılmamalıdır. Ama durum böyle değil. Aynı kodu kullanarak çalıştıralım 
whileve do-whilene olduğunu görelim.

while#
Aşağıdaki kod kullanıyor while:
*/
main1() {
  var alwaysOne = 1;
  while (alwaysOne != 1){
    print("Using while: $alwaysOne");
  }

  print("Nothing Happened");
}
/*
Yukarıdaki kod çalıştırıldığında yazdırılan tek şey Nothing Happened, 
programın hiçbir zaman while döngüsüne girmemesidir.

do-while#
Aşağıdaki kod kullanıyor do-while:
*/
main2() {
  var alwaysOne = 1;
  do {
    print("Using do-while: $alwaysOne");
  } while (alwaysOne != 1);
}
/*
whileDöngü, kod bloğunu yürütmezken, döngü do-while, blok yürütüldükten sonra 
koşulu kontrol ettiği gibi yapar.
*/
main3() {
  var alwaysOne = 1;
  do {
    print("Using do-while: $alwaysOne");
    alwaysOne++;
  } while (alwaysOne <= 10);
}
