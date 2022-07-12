// https://flutterinanutshell.com/bloc-architectural-pattern-for-flutter/
/*
Flutter için BLoC Mimari Modeli

mimari desen nedir
Şu soruyu sorarak başlayalım:  Bir kalıp nedir?  Yazılım geliştirmede mimari 
bir model, sınıflar arasındaki bağlantıyı ve verilerin farklı rollerle nasıl 
etkileşime girmesi gerektiğini tanımlar. Özetle, bir desen oluşturmak, 
kaynaktan kullanıcıya veri akışını tanımlamak için bazı noktalar çizmek ve 
bunları çizgilerle birleştirmek gibidir.

Popüler  desenler  MVC  ( Model Görünüm Denetleyicisi ) ,  MVP   
( Model Görünümü  Sunumu  ) ,  MVVM  ( Model Görünümü  GörünümüModeli ) '  dir. 
Bütün bunlar, A noktasından B noktasına veri akışını ve etkileşimini tanımlar.

2018'de I/O'da Google ilk kez Flutter için oluşturdukları yeni bir model olan  
BLoC  modelinden bahsetti ve o zamandan beri Flutter geliştiricilerinin çoğu 
için altın standart oldu.

BLoC,  İş Mantığı Bileşeni anlamına gelir  ve amacı, mantığı sunumdan 
(görünümler) ayırarak durum yönetimini kolaylaştırmaktır.

NOT: Durum, herhangi bir zamanda kullanıcı arabirimini yeniden oluşturmak için 
gereken verilerdir. Uygulamanın durumu değiştiğinde, örneğin kullanıcı, 
kullanıcı arayüzünün yeniden çizilmesini tetikleyen bir düğmeye basar.
*/
/*
Neden bir geliştirme modeline ihtiyacımız var?
Kalıp kullanmak zorunlu değildir, kullanılmadan da uygulama yapılabilir 
ancak bu, projenin ileriki aşamalarında sorun çıkarabilir. Küçük bir proje, 
birkaç sayfalık bir uygulama geliştiriyorsanız, bunları kullanamazsınız; ancak 
daha büyük bir projeniz varsa veya daha doğrusu zamanla büyüyecek bir projeniz 
varsa, sorumluluklar ayrımı ve net bir veri akışı sayesinde bir model baş 
ağrılarını ortadan kaldırabilir.

Kendinizi, deseni olmayan veya çok kaotik bir tane kullanan büyük bir kod 
üzerinde çalışırken bulursanız, uygulamanın işleyişini mahvedebilirsiniz, 
çünkü en küçük kod parçasına dokunmak, başka bir işlevsellik parçasının 
patlamasına neden olabilir. örümcek ağı benzeri veri akışı.

Bu tür durumlardan kaçınmak için, gelişim modellerinin özünde yer alan 
sorumluluklar ayrımı getiriyoruz. Sorumlulukları sınıflar arasında ayırmak, 
yalnızca bir işi olan bölümler oluşturmanız anlamına gelir, örneğin:

  ui sınıfı  – kullanıcı arabirimi sınıfı

  iş mantığı sınıfı  - kullanıcı arabiriminden girdileri (olayları) alan ve 
  onu işleyen veya olayı ileten bir sınıf

  ağ sınıfı  – tek görevi api çağrılarını işlemek ve veriyi talep eden 
  kişiye iletmektir.

Özetle, BLoC modelinde her şeyi tek bir yerde toplamak yerine şöyle görünür:

  Kullanıcı yenileme düğmesine basar, Kullanıcı Arayüzü bir olayı başlatır

  BLoC olayı yakalar ve Depodan veri ister

  Depo verileri indirir ve BLoC'a döndürü
  r
  BLoC verileri (gerekirse) detaylandırır ve havuza ekler

  Kullanıcı Arayüzü akışı dinler ve geldiğinde yeni verileri görüntüler

BLoC, bir StreamController  (  içinde bir  Sink ve bir  Stream  ile) ve  
Business Logic'ten oluşur .  
*/

/// ```dart
/// final streamController = StreamController();         // 1
///
/// void refreshData() async {
/// 	final result = await repository.refreshData();   // 2
/// 	streamController.sink.add(result);               // 3
/// }
/// ```
/// BLoC içinde bir akış denetleyicisi oluşturun
/// Depodan veri getir
/// Verileri akışa ekleyin
/// Önemli:  Bir akış denetleyicisini başlatırken, yalnızca bir dinleyici
/// akışa abone olabilir ve verileri bekleyebilir. Birden fazla aboneye
/// ihtiyacınız varsa  bunun yerine yayın oluşturucusunu kullanın.
/// final streamController = StreamController.broadcast();
/// İş mantığı
/// İş mantığı, depodan geldikten sonra veriler üzerinde mantık yürüttüğünüz
/// yerdir. Diyelim ki verilerin bileşenlerini bir liste biçiminde ayırmamız
/// gerekiyor, yukarıdaki kod şöyle olur:
/// ```dart
/// final streamController = StreamController();         // 1
///
/// void refreshData() async {
/// 	final result = await repository.refreshData();   // 2
/// 	final dataList = result.split(',');              // 3
///
/// 	streamController.sink.add(dataList);             // 4
/// }
///
/// ```
/// Veriler nasıl dinlenir
/// Böylece veriler depodan gelir, BLoC'den geçer ve son olarak Akış yoluyla
/// widget'a ulaşır. Bunu yapmak için widget'ımızı  StreamBuilder ile sarmamız
/// gerekiyor :
/// ```dart
/// StreamBuilder(                                  // 1
/// 	stream: bloc.streamController.stream,       // 2
/// 	builder: (context, snapshot) {              // 3
/// 		if (snapshot.hasData) {                 // 4
/// 			return Text(snapshot.data);
/// 		} else {
/// 			return CircularProgressIndicator();
/// 		}
/// 	},
/// );
///
/// ```
/// Widget'ınızı StreamController ile sarın
/// Dinlenecek akışı belirtin
/// Kullanıcı arayüzünüzü oluşturucu işlevi içinde oluşturun
class Bloc {}

final bloc = Bloc();
