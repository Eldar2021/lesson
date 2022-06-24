/// https://codewithandrea.com/articles/flutter-app-architecture-domain-model/
/// https://codewithandrea.com/tutorials/
/*
Flutter App Architecture: The Domain Model

Hiç kullanıcı arayüzünüzü , iş mantığınızı ve ağ kodunuzu dağınık bir 
spagetti kodu paketinde karıştırdınız mı?

yaptığımı biliyorum. ✋

Sonuçta, gerçek dünyada uygulama geliştirme zordur.

Etki Alanına Dayalı Tasarım (DDD) gibi kitaplar , karmaşık yazılım projeleri 
geliştirmemize yardımcı olmak için yazılmıştır.

Ve DDD'nin kalbinde , eldeki sorunu çözmek için gerekli olan önemli bilgi ve 
kavramları yakalayan model yatar. Ve iyi bir etki alanı modeline sahip olmak, 
bir yazılım projesinin başarısı veya başarısızlığı arasındaki tüm 
farkı yaratabilir.

Modeller çok önemlidir ama izole yaşayamazlar. En basit uygulamalar bile bazı 
UI (kullanıcının gördüğü ve etkileşim kurduğu) gerektirir ve bazı anlamlı 
bilgileri göstermek için harici API'lerle iletişim kurması gerekir.

Flutter Katmanlı Mimari
Bu bağlamda, sistemin farklı bölümleri arasında endişelerin net bir şekilde 
ayrılmasını sağlayan katmanlı bir mimariyi benimsemek genellikle değerlidir. 
Bu da kodumuzu okumayı , korumayı ve test etmeyi kolaylaştırıyor .

Genel olarak konuşursak, normalde dört farklı katman tanımlanır:
    sunum katmanı/ presentation layer
    uygulama katmanı/ application layer
    etki alanı katmanı/ domain layer
    veri katmanı/ data layer

Veri katmanı en altta yer alır ve harici veri kaynaklarıyla konuşmak için 
kullanılan depoları içerir.

Hemen üstünde domain ve uygulama katmanlarını buluyoruz . Bu katmanlar, 
uygulamamızın tüm modellerini ve iş mantığını barındırdıkları için çok önemlidir.

Bu makalede, pratik bir örnek olarak bir e-Ticaret uygulamasını kullanarak etki 
alanı katmanına odaklanacağız . Bunun bir parçası olarak şunları öğreneceğiz:

    alan modeli nedir

    Dart'ta varlıkların nasıl tanımlanacağı ve bunların veri sınıfları 
    olarak nasıl temsil edileceği

    model sınıflarımıza iş mantığı nasıl eklenir

    bu iş mantığı için birim testleri nasıl yazılır

Etki Alanı Modeli Nedir?
Wikipedia, alan modelini şu şekilde tanımlar:

Etki alanı modeli, hem davranışı hem de verileri içeren etki alanının kavramsal 
bir modelidir.

Veriler , ilişkileriyle birlikte bir dizi varlık tarafından temsil 
edilebilirken , davranış , bu varlıkları manipüle etmek için bazı iş mantığı 
tarafından kodlanır.

Örnek olarak bir e-ticaret uygulamasını kullanarak aşağıdaki varlıkları 
tanımlayabiliriz:

    Kullanıcı : Kimlik ve e-posta
    Ürün : Kimlik, resim URL'si, başlık, fiyat, mevcut miktar vb.
    Öğe : Ürün kimliği ve miktarı
    Sepet : Ürün listesi, toplam
    Sipariş : Öğelerin listesi, ödenen fiyat, durum, ödeme ayrıntıları vb.

DDD'yi uygularken, varlıklar ve ilişkiler yoktan var ettiğimiz bir şey değil, 
(bazen uzun) bir bilgi keşif sürecinin sonucudur. Sürecin bir parçası olarak, 
bir alan sözlüğü de resmileştirilir ve tüm taraflarca kullanılır.    
*/
typedef ProductID = String;

class Product {
  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.availableQuantity,
  });

  final ProductID id;
  final String imageUrl;
  final String title;
  final double price;
  final int availableQuantity;

  // serialization code
  void fromMap(Map<String, dynamic> map, ProductID id) {}

  void toMap() {}
}

/// En azından bu sınıf, kullanıcı arayüzünde göstermemiz
/// gereken tüm özelliklere sahiptir:

/// Ayrıca serileştirme için kullanılan yöntemleri fromMap()de içerir.toMap()
/*
Model sınıflarında iş mantığı
Ancak model sınıfları, nasıl değiştirilmeleri gerektiğini ifade etmek için 
bazı iş mantığını içerebilir.

CartBunu göstermek için, bunun yerine bir model sınıf düşünelim :
*/
class Cart {
  const Cart([this.items = const {}]);

  /// All the items in the shopping cart, where:
  /// - key: product ID
  /// - value: quantity
  final Map<ProductID, int> items;

  void fromMap(Map<String, dynamic> map) {}
  void toMap() {}
}
/*
Bu, alışveriş sepetine eklediğimiz ürünlerin ürün kimliklerini ve miktarlarını 
temsil eden bir anahtar/değer çiftlerinin haritası olarak uygulanır.

Sepete ürün ekleyip çıkarabildiğimiz için , bu görevi kolaylaştıran bir uzantı 
tanımlamak faydalı olabilir:
*/
extension MutableCart on Cart {
  Cart addItem({required ProductID productId, required int quantity}) {
    final copy = Map<ProductID, int>.from(items);
    // * update item quantity. Read this for more details:
    // * https://codewithandrea.com/tips/dart-map-update-method/
    copy[productId] = quantity + (copy[productId] ?? 0);
    return Cart(copy);
  }

  Cart removeItemById(ProductID productId) {
    final copy = Map<ProductID, int>.from(items);
    copy.remove(productId);
    return Cart(copy);
  }
}
