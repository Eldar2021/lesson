/*
Fonksiyon Tanımlama
Bu derste, fonksiyonlar üzerine tartışmaya başlayacağız 
ve kendi fonksiyonumuzu nasıl tanımlayacağımızı öğreneceğiz.

İlk İşlevinizi Yazma #
Önceki bir derste yerleşik işlevlerle tanıştınız; yöntemler olarak da bilinir. 
Bu bölümde, kullanıcı tanımlı fonksiyonları ele alacağız ve kendi 
fonksiyonlarımızı nasıl yazacağımızı öğreneceğiz. Hemen konuya girelim ve 
çok basit bir kullanıcı tanımlı fonksiyon örneğine bakalım.

Bu ders boyunca Sürücü Kodunu görmezden gelin.
*/
void newPrint(){
  print("Function Called");
}

// Driver Code
main() {
  newPrint();
}
/*
sözdizimi #
voidfonksiyonun hiçbir şey döndürmediğini söylüyor. containsKoleksiyonlar 
tarafından kullanılan yöntemi tartıştığımız zamanı hatırlıyor musunuz? 
containsbir boole değeri döndürdü. intİşleviniz bir şey döndürürse, dönüş 
türünü, yani , , String, boolvb. ekleyeceğiniz yer burasıdır .

Dart , işlevin dönüş türünü çıkarmak için tür çıkarımını kullanabileceğinden, 
dönüş türünü eklemek gerekli değildir . Ancak dönüş türünü sizin eklemeniz 
tercih edildi.

newPrintkendinizi seçebileceğiniz işlevin adıdır. Adın işlevin işlevselliği 
için anlamlı olduğundan emin olun.

newPrinttarafından takip edilmektedir ().

İşlevin gövdesi küme parantezleri içine alınır {}.

Genel sözdizimi aşağıdaki gibidir:

Eğer fonksiyonunuzun bir dönüş değeri varsa, bir returnsonraki bölümde 
göreceğimiz gibi anahtar kelimeyi kullanarak değeri döndürmeniz gerekir.
*/

/*
Parametreli Fonksiyonlar #
Tıpkı metotlar gibi değer alan fonksiyonlar oluşturabiliriz.

Parametreler, değerleri fonksiyonlara iletmek için bir mekanizmadır.

İki parametre alan ve toplamlarını döndüren bir fonksiyon oluşturalım.
*/
num sum(num x, num y){
  return x+y;
}

// Driver Code
main1() {
  print(sum(1,2));
}
/*
İlk örnekte, fonksiyon adımızı boş parantezler ( ()) takip ediyordu. Bu sefer 
parantezler fonksiyona iletilecek parametreleri içerir.

2. satırda , (num x, num y)fonksiyonumuzun iki parametre aldığını söylüyor. 
İlki adlandırılmıştır x ve türünde olmalıdır num. İkincisi adlandırılmıştır y 
ve ayrıca türünde olmalıdır num.
3. satırda , anahtar kelimeyi x+ykullanarak geri dönüyoruz return.

İşlevin dönüş değerinin türü, işlevin dönüş türüyle eşleşmelidir. Örneğin, 
işlevin dönüş türü ise, işlevin bir değer Stringdöndürmesi gerekir .String

Sözdizimsel Şeker #
Daha önce tartıştığımız gibi, bir fonksiyonun gövdesi süslü parantezler ( {})
içindedir. Ancak, işlevin gövdesi yalnızca tek bir ifadeden oluşuyorsa küme 
parantezlerini kullanmamayı ve her şeyi tek bir satırda yazmayı seçebilirsiniz.

Steno sözdizimi biraz farklıdır.

returnBu söz dizimini kullanırken, bir değer döndürmek için anahtar kelimeyi 
kullanmanız gerekmez . Ok, fonksiyon parametrelerini ve fonksiyon tipini 
fonksiyon gövdesinden ayırır.

Bu fonksiyon yazma yöntemi basitçe sözdizimsel şekerdir. İşlevin 
işlevselliğini değiştirmez, yalnızca sözdizimini değiştirir.

sum Steno sözdizimini kullanarak fonksiyonumuzu yazalım .
*/
/*
nerede main()? #
Şu ana kadar tüm kodlarımızı main()fonksiyon içerisinde yazıyorduk. 
Kullanıcı tarafından oluşturulan işlevlerin ana işlevde tanımlanması gerekmez, 
ancak bunlar olabilir. Ancak işlevde çağrılmaları gerekir main(). Bunu bir 
sonraki derste biraz daha inceleyelim.
*/