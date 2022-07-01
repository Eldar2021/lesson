/*
Members
Üyeler
Bir üye bir nesneye aittir ve yöntemler veya örnek değişkenler olabilir.

Alanları ve üst düzey değişkenleri TERCİH edin final.

Değişebilir olmayan - zamanla değişmeyen - durum, programcıların akıl yürütmesi 
daha kolaydır . Çalıştıkları değiştirilebilir durum miktarını en aza indiren 
sınıflar ve kitaplıkların bakımı daha kolay olma eğilimindedir. Tabii ki, 
genellikle değişken verilere sahip olmak yararlıdır. Ancak, ihtiyacınız yoksa, 
varsayılanınız, yapabildiğiniz finalzaman alanlar ve üst düzey değişkenler 
yapmak olmalıdır.

Bazen bir örnek alanı başlatıldıktan sonra değişmez, ancak örnek 
oluşturuluncaya kadar başlatılamaz. Örneğin, örnek üzerinde referans thisveya 
başka bir alana ihtiyaç duyabilir. Bu gibi durumlarda, alan yapmayı düşünün 
late final. Bunu yaptığınızda , alanı bildiriminde de başlatabilirsiniz .
*/
/*
Özelliklere kavramsal olarak erişen işlemler için alıcıları KULLANIN.

Bir üyenin bir yönteme karşı ne zaman alıcı olacağına karar vermek, iyi API 
tasarımının ince ama önemli bir parçasıdır, bu nedenle bu çok uzun kılavuz. 
Diğer bazı dillerin kültürleri alıcılardan çekinir. Bunları yalnızca işlem 
neredeyse tam olarak bir alan gibi olduğunda kullanırlar - tamamen nesne 
üzerinde yaşayan durum üzerinde çok az miktarda hesaplama yapar. Bundan daha 
karmaşık veya ağır olan herhangi bir şey (), "burada hesaplama yapılıyor!" 
sinyali vermek için ismin ardından gelir. .çünkü bir "alan" anlamına gelen 
çıplak bir isim

Dart öyle değil . Dart'ta tüm noktalı adlar, hesaplama yapabilen üye 
çağrılarıdır. Alanlar özeldir; uygulaması dil tarafından sağlanan alıcılardır. 
Başka bir deyişle, alıcılar Dart'ta “özellikle yavaş alanlar” değildir; alanlar 
“özellikle hızlı alıcılardır”.

Yine de, bir yöntem üzerinden bir alıcı seçmek, arayan kişiye önemli bir sinyal 
gönderir. Sinyal, kabaca, operasyonun "alan benzeri" olduğudur. İşlem, en 
azından prensipte, arayanın bildiği kadarıyla bir alan kullanılarak 
uygulanabilir . Bu şu anlama gelir:

  İşlem herhangi bir argüman almaz ve bir sonuç döndürür.

  Arayan kişi çoğunlukla sonuçla ilgilenir. Arayanın, üretilen sonuçtan daha 
  fazla işlemin sonucunu nasıl ürettiği konusunda endişelenmesini istiyorsanız, 
  işleme işi tanımlayan bir fiil adı verin ve onu bir yöntem yapın.
*/
