/*
for Loops
Döngüler için
Bu derste for döngüsü ile tanışacaksınız.

Giriş #
Bir belgenin 100 kopyasını yazdırmanız gerekir . Her bir kopyayı ayrı ayrı 
yazdırmanız gerektiğini ve baskıya 100 kez bastığınızı hayal edin. Yazıcıya 
sadece 100 kopya yazdırmasını söylemek ve bir kez yazdır düğmesine basmak çok 
daha verimli ve kolaydır.

Yazıcı, hedefine ulaşana kadar ( 100 kopya) döngü halinde art arda bir işlem 
(bir belge yazdırma) gerçekleştiriyor.

Bilgisayar programlamada bazen bir kod bloğunun birden çok kez çalıştırılması 
gereken senaryolarla karşılaşırız.

Dart, fortam olarak bu amaç için döngüler sağlar.

Kontrol Akışı #
forAşağıdaki döngünün genel kontrol akışına bakalım .

Döngü , fordöngünün üzerinde çalışmasını istediğimiz bir sayı aralığı 
belirlememizi sağlar.

Yineleyici , yinelemelerin takibinden sorumludur. Başlangıçta değeri döngü 
aralığının başlangıcıdır ve her yinelemede değişir.

sözdizimi #
forDart'ta döngü yazmanın birden fazla yolu vardır. Aşağıdaki sözdizimini 
genelleştirmeye çalışalım.

Sözdizimi for, yineleyici tarafından takip edilen anahtar sözcükle başlar. 
Ancak yineleyiciyi nasıl tanımlamalıyız?

Kullanacağımız yineleyici, bir dizi sayı atanan bir değişkendir. Üç şey 
belirtmeniz gerekir, ilk değer veya aralığın başladığı yer ve son değer, 
nerede bittiği. forArdından, döngünün her yinelemesinde yineleyicinin aralıkta 
nasıl hareket edeceğini de belirtmeniz gerekir . Örneğin, 1 artırılabilir 
veya 1 azaltılabilir .

Her üç şey de parantez içinde belirtilir ve noktalı virgülle ( ;) ayrılır.

forEylemde Döngü #
Bir şeyi beş kez yazdırmak istediğimizi varsayalım. Üç şeyi belirtmemiz gerekiyor.

Yineleyicinin başlangıç ​​değeri: var i = 0(başlangıç ​​değeri 0 dır )
Yineleyicinin son değeri: ( 5'ei < 5 kadar )
Yineleyici belirtilen aralıkta nasıl hareket eder: ( 1i++ ile artış )
Aşağıdaki koda bir göz atalım:
*/
main() {
  for (var i = 0; i < 5; i++) {
    print(i);
  }
}

/*
Bir Koleksiyonda Yineleme #
forBir koleksiyondaki her öğe üzerinde bazı işlemler gerçekleştirmek için 
döngüleri kullanabiliriz .

Her öğeyi bir renk listesinde yazdıralım.
*/
main1() {
  var colorList = ['blue', 'yellow', 'green', 'red'];
  for (var i = 0; i < colorList.length; i++) {
    print(colorList[i]);
  }
}

/* 
For-In Formu #
Kümeler ve listeler için, yinelemenin for-in biçimini kullanabilirsiniz.

for-in kullanan fordöngü aşağıdaki sözdizimine sahiptir:

Yukarıdakiyle aynı örneği kullanalım ve kodu yeni formu kullanacak 
şekilde değiştirelim.
*/
main2() {
  var colorList = ['blue', 'yellow', 'green', 'red'];

  for (var i in colorList) {
    print(i);
  }
}

/*
Döngülerle Koşullar #
Şimdiye kadar basit baskı işlemini yapıyorduk. Ancak döngülerle 
gerçekleştirebileceğiniz çok daha fazlası var.

Bir döngü ile bir koşullu birleştirelim.

Örneğimizde bir tamsayı listemiz var intList. Biz sadece bu listedeki çift tam 
sayıları yazdırmak istiyoruz.
*/
main3() {
  var intList = [6, 7, 3, 9, 2, 5, 4];

  for (var i in intList) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}
