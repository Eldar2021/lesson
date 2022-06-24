/// https://codewithandrea.com/articles/flutter-repository-pattern/
/*
Flutter Uygulama Mimarisi: Depo Kalıbı

Tasarım kalıpları, yazılım tasarımında sık karşılaşılan sorunları çözmemize 
yardımcı olan kullanışlı şablonlardır.

Uygulama mimarisi söz konusu olduğunda, yapısal tasarım kalıpları, 
uygulamanın farklı bölümlerinin nasıl düzenlendiğine karar vermemize 
yardımcı olabilir.

Bu bağlamda, bir arka uç API gibi çeşitli kaynaklardan veri nesnelerine erişmek 
ve bunları uygulamanın etki alanı katmanında (iş mantığımızın yaşadığı yer olan)
tür güvenli varlıklar olarak kullanılabilir hale getirmek için depo modelini 
kullanabiliriz.

Ve bu makalede, depo düzenini ayrıntılı olarak öğreneceğiz:

    nedir ve ne zaman kullanılır

    bazı pratik örnekler

    somut veya soyut sınıfları ve bunların ödünleşimlerini 
    kullanarak uygulama ayrıntıları

    depolarla kod nasıl test edilir

Depo tasarım modeli nedir?
Bunu anlamak için aşağıdaki mimari diyagramı ele alalım:

Bu bağlamda, veri katmanında depolar bulunur . Ve onların işi:

etki alanı modellerini (veya varlıkları ) veri katmanındaki veri kaynaklarının 
uygulama ayrıntılarından ayırın .

veri aktarım nesnelerini , etki alanı katmanı tarafından anlaşılan 
doğrulanmış varlıklara dönüştürün

(isteğe bağlı olarak) veri önbelleğe alma gibi işlemleri gerçekleştirin.

Yukarıdaki şema, uygulamanızın mimarisini oluşturmanın birçok olası yolundan 
yalnızca birini göstermektedir. MVC, MVVM veya Temiz Mimari gibi farklı bir 
mimariyi takip ederseniz işler farklı görünecektir, ancak aynı kavramlar 
geçerlidir.

Ayrıca widget'ların , iş mantığı veya ağ koduyla hiçbir ilgisi olmayan sunum 
katmanına nasıl ait olduğuna da dikkat edin.

Widget'larınız doğrudan bir REST API'sinden veya uzak bir veritabanından 
anahtar/değer çiftleriyle çalışıyorsa, yanlış yapıyorsunuz demektir. 
Başka bir deyişle: iş mantığını UI kodunuzla karıştırmayın . Bu, kodunuzu test 
etmeyi, hata ayıklamayı ve nedenini bulmayı çok daha zor hale getirecektir.

Depo deseni ne zaman kullanılır?
Uygulamanızın, uygulamanın geri kalanından izole etmek istediğiniz 
yapılandırılmamış verileri (JSON gibi) döndüren birçok farklı uç noktaya 
sahip karmaşık bir veri katmanı varsa, depo modeli çok kullanışlıdır .

Daha geniş anlamda, depo modelinin en uygun olduğunu düşündüğüm birkaç 
kullanım örneği:

  REST API'leri ile konuşmak
  yerel veya uzak veritabanlarıyla konuşmak (örn. Sembast, Hive, Firestore, vb.)
  cihaza özel API'lerle konuşmak (ör. izinler, kamera, konum vb.)

Bu yaklaşımın büyük bir yararı, kullandığınız herhangi bir 3. taraf API'sinde 
son derece önemli değişiklikler olması durumunda, yalnızca depo kodunuzu 
güncellemeniz gerekmesidir .

Ve bu tek başına depoları %100 buna değer kılar. 💯

Öyleyse onları nasıl kullanacağımızı görelim! 🚀

Örneğin, depomuz için arabirimi tanımlayan soyut bir sınıf:
*/
abstract class WeatherRepository {
  Future<Weather> getWeather({required String city});
}

class Weather {}
/*
Yukarıdakilerin WeatherRepositoryyalnızca bir yöntemi vardır, ancak daha 
fazlası olabilir (örneğin, tüm CRUD işlemlerini desteklemek istiyorsanız).

Önemli olan, veri havuzunun, belirli bir şehir için hava durumunu nasıl 
alacağımıza dair bir sözleşme tanımlamamıza izin vermesidir.

Ve http veya dio gibi bir ağ istemcisi kullanarak gerekli API çağrılarını yapan 
somut bir sınıfla uygulamamız gerekiyor :WeatherRepository

import 'package:http/http.dart' as http;

class HttpWeatherRepository implements WeatherRepository {
  HttpWeatherRepository({required this.api, required this.client});
  // custom class defining all the API details
  final OpenWeatherMapAPI api;
  // client for making calls to the API
  final http.Client client;

  // implements the method in the abstract class
  Future<Weather> getWeather({required String city}) {
    // TODO: send request, parse response, return Weather object or throw error
  }
}

Tüm bu uygulama ayrıntıları, veri katmanıyla ilgili endişelerdir ve uygulamanın 
geri kalanı bunları umursamamalı, hatta bilmemelidir.

Soyut veya somut sınıflar?
Depo oluştururken sık sorulan bir soru şudur: gerçekten soyut bir sınıfa 
ihtiyacınız var mı , yoksa sadece somut bir sınıf oluşturup tüm töreni ortadan 
kaldırabilir misiniz?

İki sınıfa giderek daha fazla yöntem eklemek oldukça sıkıcı olabileceğinden, 
bu çok geçerli bir endişedir:

abstract class WeatherRepository {
  Future<Weather> getWeather({required String city});
  Future<Forecast> getHourlyForecast({required String city});
  Future<Forecast> getDailyForecast({required String city});
  // and so on
}

class HttpWeatherRepository implements WeatherRepository {
  HttpWeatherRepository({required this.api, required this.client});

  final OpenWeatherMapAPI api;

  final http.Client client;

  Future<Weather> getWeather({required String city}) { ... }

  Future<Forecast> getHourlyForecast({required String city}) { ... }

  Future<Forecast> getDailyForecast({required String city}) { ... }
 
}

Yazılım tasarımında sıklıkla olduğu gibi, cevap şudur : .

Öyleyse, her yaklaşımın bazı artılarına ve eksilerine bakalım.

Soyut sınıfları kullanma
Pro : Depomuzun arayüzünü karışıklık olmadan tek bir yerde görmek güzel.
Pro : Depoyu tamamen farklı bir uygulama ile değiştirebiliriz (örneğin 
      DioWeatherRepositoryyerine HttpWeatherRepository) ve uygulamanın geri 
      kalanı yalnızca WeatherRepository.
Con : "Başvuruya atladığımızda" ve bizi somut sınıftaki uygulama yerine soyut 
      sınıftaki yöntem tanımına götürdüğümüzde VSCode'un kafası biraz karışacak.
Con : Daha fazla ortak kod.

Yalnızca somut sınıfları kullanma
Pro : Daha az ortak kod.
Pro : "referansa atla", depo yöntemleri yalnızca bir sınıfta bulunacağı 
      için çalışır.
Con : depo adını değiştirirsek farklı bir uygulamaya geçmek daha fazla 
      değişiklik gerektirir (ancak VSCode ile tüm projedeki şeyleri yeniden 
      adlandırmak kolaydır).

Basit tutun
Her zamanki gibi, işleri basit tutmak her zaman iyi bir fikirdir. Bu nedenle, 
API'lerinizi fazla düşünmekten kendinizi alıkoymayın.

Deponuzun arayüzünü kullanmanız gereken API'den sonra modelleyebilir ve bir 
gün olarak adlandırabilirsiniz. Gerekirse daha sonra her zaman yeniden 
düzenleme yapabilirsiniz. 👍      
*/
