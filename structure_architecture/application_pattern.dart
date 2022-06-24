// https://codewithandrea.com/articles/flutter-app-architecture-application-layer/
/*
Flutter App Architecture: The Application Layer
Flutter Uygulama Mimarisi: Uygulama Katmanı

Karmaşık uygulamalar oluştururken kendimizi şöyle bir mantık yazarken 
bulabiliriz:

    birden çok veri kaynağına veya havuza bağlıdır
    birden fazla widget tarafından kullanılması (paylaşılması) gerekiyor

Bu durumda, bu mantığı zaten sahip olduğumuz sınıfların 
(widget'lar veya depolar) içine yerleştirmek cazip gelebilir.

Ancak bu, endişelerin zayıf bir şekilde ayrılmasına yol açarak kodumuzu 
okumayı, korumayı ve test etmeyi zorlaştırır.

Aslında, iyi bir uygulama mimarisine ihtiyaç duymamızın 1 numaralı nedeni 
endişelerin ayrılmasıdır .

Ve önceki makalelerde, projelerim için çok işe yarayan bir referans uygulama 
mimarisini tanıtmıştım:

Ve bu yazıda, uygulama katmanına odaklanacağız ve Flutter'da bir e-Ticaret 
uygulaması için alışveriş sepeti özelliğinin nasıl uygulanacağını öğreneceğiz.

Her şeyin üst düzeyde nasıl bir araya geldiğini görmek için bu özelliğe 
kavramsal bir genel bakışla başlayacağız.

Ardından, bazı uygulama ayrıntılarına CartServicedalacağız ve birden çok 
havuza bağlı bir sınıf uygulayacağız.

Çoklu widget'lar, paylaşılan mantık?
Gördüğümüz gibi , doğru kullanıcı arayüzünü göstermek için alışveriş sepeti 
verilerine erişmesi gereken birden fazla pencere öğesi (her sayfa bir pencere 
öğesinin kendisidir) vardır.

Başka bir deyişle, alışveriş sepeti öğelerinin (ve bunları güncelleme 
mantığının) birden çok pencere öğesi arasında paylaşılması gerekir.

İşleri daha da ilginç hale getirmek için, bir gereksinim daha ekleyelim.

Öğeleri misafir veya oturum açmış kullanıcı olarak ekleme

Amazon veya eBay gibi e-ticaret siteleri, bir hesap oluşturmadan önce alışveriş 
sepetine ürün eklemenize izin verir.

Bu şekilde, ürün kataloğunu misafir olarak özgürce arayabilir ve yalnızca 
ödeme işlemine devam ettiğinizde oturum açabilir veya kayıt olabilirsiniz.

Peki aynı işlevi örnek uygulamamızda nasıl çoğaltabiliriz?

Bunu yapmanın bir yolu, iki alışveriş sepetine sahip olmaktır :

    misafirler tarafından kullanılan yerel bir alışveriş sepeti
    oturum açmış kullanıcılar tarafından kullanılan uzak bir alışveriş sepeti

Bu kurulumla, şu mantıkla doğru sepete bir ürün ekleyebiliriz:

if user is signed in, then
    add item to remote cart
else
    add item to local cart

Bunun pratikte anlamı, işleri yürütmek için üç depoya ihtiyacımız olduğudur:

oturum açmak ve oturumu kapatmak için kullanılan bir yetkilendirme deposu

Konuk kullanıcılar tarafından kullanılan yerel bir alışveriş sepeti deposu 
(yerel depolama tarafından desteklenir)

kimliği doğrulanmış kullanıcılar tarafından kullanılan bir uzak alışveriş 
sepeti deposu (uzak bir veritabanı tarafından desteklenir)

Alışveriş Sepeti: Tam Gereksinimler
Özetle, şunları yapabilmemiz gerekir:

    sepete misafir veya kimliği doğrulanmış kullanıcı olarak ürün 
    ekleyin (farklı depolar kullanarak)

    bunu farklı widget'lardan/sayfalardan yapın

Uygulama Katmanı
Bu senaryoda, kodumuzu düzenli tutmanın en iyi yolu, tüm mantığımızı içeren 
bir uygulama katmanı sunmaktır:CartService  

Gördüğümüz CartServicegibi, denetleyiciler (yalnızca widget durumunu yöneten) 
ve depolar (farklı veri kaynaklarıyla konuşan) arasında bir aracı görevi görür.

CartServiceŞunlarla ilgilenmiyor : _

widget durumunu yönetmek ve güncellemek (denetleyicinin işi budur)
veri ayrıştırma ve serileştirme (depoların işi budur)

Tek yaptığı, gerektiğinde ilgili depolara erişerek uygulamaya özel mantığı 
uygulamaktır.

Not: MVC veya MVVM'ye dayalı diğer yaygın mimariler, bu uygulamaya özel mantığı 
(veri katmanı koduyla birlikte) model sınıfının kendisinde tutar. Ancak bu, çok 
fazla kod içeren ve bakımı zor olan modellere yol açabilir. Gerektiğinde 
depolar ve hizmetler oluşturarak, endişelerin çok daha iyi bir şekilde 
ayrılmasını sağlıyoruz.

Ve şimdi yapmaya çalıştığımız şeyin net bir resmine sahip olduğumuza göre, 
tüm ilgili kodu uygulayalım.

Alışveriş Sepeti Uygulaması

CartServiceAmacımız sınıfın nasıl uygulanacağını bulmaktır.

Bu, birden çok veri modeline ve veri havuzuna bağlı olduğundan, önce 
bunları tanımlayalım.
*/

