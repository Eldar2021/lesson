/*
https://blog.logrocket.com/understanding-flutter-streams/
Understanding streams

Uygulamalar yirmi yıl önce geliştirildiğinde ve arka ucu olmayan 
bilgisayarlarda çalıştırıldığında, program tarafından gerçekleştirilen 
işlemlerin çoğu eşzamanlıydı ve uygulamanın geri kalanının belirli komutlar 
veya işlevler tamamlanırken beklemesine neden oluyordu.

Zaman geçtikçe ve uygulamalar, API'ler veya bir cihazın kendisinde yerel olarak 
bulunmayan diğer kaynaklar aracılığıyla verilere erişmeye daha bağımlı hale 
geldikçe, verileri senkronize bir şekilde işlemek çekici değildi ve 
haklı olarak.

Kullanıcımız bir API'den veri isterken bir kullanıcı arayüzünü saniyeler 
içinde kilitleyemeyiz.

Bu ve diğer birçok nedenden dolayı, modern programlama dilleri ve çerçeveleri 
(Dart ve Flutter gibi) akışlarla başa çıkmamıza yardımcı olan yapılar içerir.

Bu yazıda, aşağıdaki kavramlara bakacağız:

What streams are
How we can use a StreamController and how we can emit events into it
How we can use a StreamBuilder in Flutter to update our UI

Akışlar hakkında konuşurken hemen söylenmesi gereken bir şey, onları ilk 
öğrenmeye başladığımda gözlerimi kamaştırdıkları ve kafamı karıştırdıklarıdır. 
Sadece ortalama bir geliştirici olmam mümkün, ancak çevrimiçi olarak akışları 
gerçekten anlamayan insanlar hakkında sayısız makale var.

Aslında oldukça basit olsalar da çok güçlüler ve güçteki bu artışla birlikte 
bunları yanlış uygulamanız ve sorunlara neden olmanız ihtimali ortaya çıkıyor. 
O halde ilk etapta akımların ne olduğundan bahsedelim.
*/
/*
Akışlar nedir?
Akışların ne olduğunu anlamak için önce normal senkron yöntemler olan 
anladığımız şeylerle başlayalım. Bunlar hiç de süslü değil, aslında, 
işte bir örnek:
*/
import 'dart:async';

final time = DateTime.now();
/*
Bu örnekte, eşzamanlı olan bir yöntemden tarih ve saati alıyoruz. Bu işlevi 
bir milisaniyeden daha kısa sürede tamamladığı için çıktısını beklememize 
gerek yok. Bekleme süresi inanılmaz derecede kısa olduğundan, programımızın 
bu durumda çıktıyı beklemesinde bir sakınca yoktur.

asyncŞimdi ve awaitanahtar kelimelerini kullanarak asenkron bir metoda bakalım. 
Bunu şimdiki zamanı alarak yapacağız ve sonra kullanarak 2 saniye sonraki 
zamanı şu şekilde alacağız:Future.delayed
*/
void mai1() async {
  print('Started at ${DateTime.now()}');
  final time = await Future.delayed(Duration(seconds: 2)).then(
    (value) => DateTime.now(),
  );
  print('Awaited time was at $time');
}

/// Started at 2021-10-28 17:24:28.005
/// Awaited time was at 2021-10-28 17:24:30.018
/*
Böylece, uygulamamızda, ilk zamanımızı ve gelecekte 2 saniyelik bir zaman 
aldığımızı görebiliyoruz. Gerçekte, awaitAPI'ler veya dosya indirmeleri 
gibi gelecekte geri dönen çeşitli veri kaynakları sağlayabiliriz.

async/ kalıbını kullanarak, awaitbu verileri alabilir ve tamamlandığında 
üzerinde çalışabiliriz.

Ancak, bu temelde, bir şeylerin değişip değişmediğini görmek için 
her 2 saniyede bir istekte bulunduğumuz güncellemeler için yoklama ile aynıdır. 
Yoklama, pil ömrü veya kullanıcı deneyimi için iyi değildir, çünkü bir şeylerin 
değişip değişmediğini kontrol etme görevini istemci cihaza veya 
uygulamaya yükler.

Bunun yerine, bu sorumluluğu sunucuya yüklemek, sunucunun bir şeyler 
değiştiğinde bize haber vermesini ve uygulamanın bu güncellemelere abone 
olmasını sağlamak daha iyidir.

İşte burada akışlar devreye giriyor. Bir 'e kolayca abone olabiliriz 
streamve yeni bir sonuç verdiğinde o verilerle istediğimiz gibi çalışabiliriz.

Aşağıdaki örnekte, her 2 saniyede bir akışa bir olay göndermek için a 
StreamController and öğesini kurduk . Hemen ardından, akış denetleyicisinin 
içindekine abone oluyoruz ve güncellendiğinde yazdırıyoruz:Timer.periodic stream
*/

void main2() async {
  final streamController = StreamController<DateTime>();
  Timer.periodic(Duration(seconds: 2), (timer) {
    streamController.add(DateTime.now());
  });

  streamController.stream.listen((event) {
    print(event);
  });
}
/// 2022-06-22 11:32:58.014266
/// 2022-06-22 11:33:00.015441
/// 2022-06-22 11:33:02.014495
/// 2022-06-22 11:33:04.010870
/// 2022-06-22 11:33:06.014783
/// 2022-06-22 11:33:08.014212
/// 2022-06-22 11:33:10.012831
/*
Akış aboneliğini temizleme
Şimdi, akışa aboneliğimiz var ve zamanla yayılıyor. Bu harika. Ancak bu 
uygulamada küçük bir hatamız var: Akış aboneliğimizi hiçbir zaman elden 
çıkarmadık veya temizlemedik.

Bu, kullanıcı uygulamamızın başka bir bölümüne gitse veya başka bir şey yapsa 
bile uygulamamızın bu akışı dinlemeye ve sonuçları işlemeye devam edeceği 
anlamına gelir.

Kullanıcıyla ilgili süreçleri çalıştıran kaynakları harcamamız bizim için sorun 
değil, ancak kullanıcı başka bir yere gittiğinde veya uygulamamızın farklı bir 
bölümünü kullandığında, aboneliklerimizi iptal etmeli ve yol boyunca 
kullandığımız bileşenleri temizlemeliyiz.

Neyse ki, aboneliğimizin bir referansını tutabilir ve artık kullanmadığımız 
zaman iptal edebiliriz. Bu durumda, belirli bir süre sonra aboneliğimizi iptal 
ediyoruz:
*/


void main() async {
   final streamController = StreamController<DateTime>();
    final unsubscribeAt = DateTime.now().add(Duration(seconds: 10));
    StreamSubscription<DateTime>? subscription;

    Timer.periodic(Duration(seconds: 2), (timer) {
      streamController.add(DateTime.now());
    });

    subscription = streamController.stream.listen((event) async {
      print(event);
      if (event.isAfter(unsubscribeAt)) {
        print("It's after ${unsubscribeAt}, cleaning up the stream");
        await subscription?.cancel();
      }
    });
}
/*
Yine aboneliğimiz var ama şimdi iptal ediyoruz. İptal ettiğimizde uygulama, 
aboneliğin yapılmasıyla ilgili kaynakları serbest bırakabilir ve böylece 
uygulamamızdaki bellek sızıntılarını önleyebilir.

Abonelikleri temizlemek Flutter ve Dart'ta akışları kullanmanın ayrılmaz bir 
parçasıdır ve bunları kullanmak istiyorsak sorumlu bir şekilde kullanmalıyız.
*/
