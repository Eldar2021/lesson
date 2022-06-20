/*
Fonksiyonlara ve Yöntemlere Kısa Bir Giriş
Bir sonraki derste, fonksiyonlara ve yöntemlere çok kısa bir giriş yapılacaktır.

Fonksiyonlar #
Bilgisayar programlamada, bir işlev veya yöntem, belirli bir görevi yerine 
getiren bir kod bloğudur. Kod bloğuna bir değişken gibi bir isim verilir. 
İşlev, belirli bir görevin gerçekleştirilmesi gerektiğinde bu ad kullanılarak 
çağrılır. Bu, aynı kodu tekrar tekrar yazma ihtiyacını ortadan kaldırır; 
tek yapmanız gereken işlevin adını aramak.

Nasıl Çalışırlar? #
Matematiksel işlevler gibi, programlama işlevleri de argüman olarak bilinen 
bir girdiyi alır, bu girdi üzerinde bazı işlemler gerçekleştirir ve ardından 
ortaya çıkan çıktıyı döndürür.

Adeta bir fabrikadaki konveyör bandının bir ucundan makineye giren ve diğer 
ucundan tamamen modifiye edilmiş olarak çıkan maddelerle bir taşıma bandı 
gibidir. Ancak makine ömrü boyunca aynı kaldığından, içine giren her öğeyi 
aynı şekilde değiştirecektir.

Dart'taki Fonksiyonlar #
Fonksiyonları iki geniş kategoriye ayırabiliriz:

Yerleşik İşlevler
Kullanıcı Tanımlı Fonksiyonlar

Kullanıcı tanımlı işlevler , kullanıcıların kendilerinin oluşturduğu 
işlevlerdir. Sadece bunlara ayrılmış koca bir bölümümüz var , bu yüzden şu 
anda bizi ilgilendirmiyorlar.

Yerleşik işlevler , Dart tarafından önceden tanımlanmış ve kitaplıklarının 
bir parçası olan işlevlerdir. Bunları kullanmak için tek yapmamız gereken 
fonksiyon isimlerini çağırmak.

Şimdilik metodların yerleşik fonksiyonlar dediğimiz şeyler olduğunu 
söyleyebiliriz. Yöntemler biraz daha karmaşık ama şimdilik bu kadarı yeterli.

Bölüm boyunca kullandığımız yazdırma ifadesi aynı zamanda yerleşik bir işlevdir.
*/
main() {
  var printMe = "Hello World";

  print(printMe);
}

/*
Yukarıdaki kodda print, belirli bir görevi gerçekleştiren bir yöntemdir print . 
printMeyönteme ilettiğimiz argüman ve sonuçta ortaya çıkan çıktı 
“Merhaba Dünya”. Bunca zamandır fonksiyonları kullanıyoruz!

Bir yöntem olsa printda, yalnızca herhangi bir türden olabilecek bir argüman 
iletmeyi gerektiren çok basit bir yöntemdir. Ancak, çoğu yöntem onları bir 
nesne üzerinde çağırmanızı gerektirir. Örneğin, objectName.method(arguments)
yöntemin çağrıldığı objectNameve . Yöntem, içinde depolanan veriler üzerinde 
bazı eylemler gerçekleştirecektir .argumentsmethodobjectName
*/
