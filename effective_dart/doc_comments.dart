/*
Doküman yorumları
Doküman yorumları özellikle kullanışlıdır çünkü dart doconları ayrıştırır ve 
onlardan güzel doküman sayfaları oluşturur . ///Belge yorumu, bir bildirimden 
önce görünen ve arayan özel sözdizimini kullanan herhangi bir yorumdur 
dart doc.

Üyeleri ve türleri belgelemek için ///belge yorumlarını KULLANIN.

Normal bir yorum yerine bir doküman yorumu kullanmak, dart doconu bulmayı ve 
onun için dokümantasyon oluşturmayı sağlar.

good*
  /// The number of characters in this chunk when unsplit.
  int get length => ...

bad*
  // The number of characters in this chunk when unsplit.
  int get length => ...

Tarihsel nedenlerle, dart docbelge yorumlarının iki sözdizimini destekler: 
/// (“C# stili”) ve /** ... */(“JavaDoc stili”). ///Daha kompakt olduğu için 
/// tercih ediyoruz . /**ve */çok satırlı bir doküman yorumuna içeriksiz iki 
/// satır ekleyin. Bir doküman yorumu, liste öğelerini işaretlemek için 
/// /// kullanılan madde işaretli bir liste içerdiğinde olduğu gibi, bazı 
/// durumlarda sözdiziminin okunması da daha kolaydır .* 

Hala JavaDoc stilini kullanan bir kodla karşılaşırsanız, onu temizlemeyi 
düşünün.   
*/
/*
Genel API'ler için belge yorumları yazmayı TERCİH EDİN.
Her bir kitaplığı, üst düzey değişkeni, türü ve üyeyi tek tek belgelemeniz 
gerekmez, ancak çoğunu belgelemelisiniz.

Sınıfın program organizasyonunun tek birimi olduğu Java gibi dillerin aksine, 
Dart'ta bir kitaplık, kullanıcıların doğrudan birlikte çalıştığı, içe aktardığı 
ve üzerinde düşündüğü bir varlıktır. Bu, libraryyönergeyi, okuyucuya içinde 
sağlanan ana kavramlar ve işlevleri tanıtan belgeler için harika bir yer yapar. 
Aşağıdakileri dahil etmeyi düşünün:

  Kitaplığın ne için olduğuna dair tek cümlelik bir özet.
  Kütüphane genelinde kullanılan terminolojinin açıklamaları.
  API'yi kullanan birkaç eksiksiz kod örneği.
  En önemli veya en sık kullanılan sınıflara ve işlevlere bağlantılar.
  Kitaplığın ilgili olduğu etki alanındaki dış referanslara bağlantılar.

library Dosyanın başlangıcındaki yönergenin hemen üstüne bir belge yorumu 
yerleştirerek bir kitaplığı belgeleyebilirsiniz . Kitaplığın bir library 
yönergesi yoksa, yalnızca belge yorumunu kapatmak için bir yönerge 
ekleyebilirsiniz.

Özel API'ler için belge yorumları yazmayı DÜŞÜNÜN.
Doküman yorumları yalnızca kitaplığınızın genel API'sinin harici tüketicileri 
için değildir. Ayrıca kütüphanenin diğer bölümlerinden çağrılan özel üyeleri 
anlamak için de yardımcı olabilirler.

Doküman yorumlarına tek cümlelik bir özet ile BAŞLAYIN.
Doküman yorumunuza nokta ile biten kısa, kullanıcı merkezli bir açıklama ile 
başlayın. Bir cümle parçası genellikle yeterlidir. Okuyucunun kendilerini 
yönlendirmesi ve okumaya devam edip etmeyeceğine veya sorunlarının çözümünü 
başka bir yerde araması gerektiğine karar vermesi için yeterli bağlam sağlayın.

good*
  /// Deletes the file at [path] from the file system.
  void delete(String path) {
    ...
  }

bad*
  /// Depending on the state of the file system and the user's permissions,
  /// certain operations may or may not be possible. If there is no file at
  /// [path] or it can't be accessed, this function throws either [IOError]
  /// or [PermissionError], respectively. Otherwise, this deletes the file.
  void delete(String path) {
    ...
  }

Bir doküman yorumunun ilk cümlesini kendi paragrafına ayırın.
Kendi paragrafına bölmek için ilk cümleden sonra boş bir satır ekleyin. Birden 
fazla açıklama cümlesi faydalıysa, gerisini sonraki paragraflara koyun.

Bu, belgeleri özetleyen sıkı bir ilk cümle yazmanıza yardımcı olur. dart doc 
Ayrıca, sınıf ve üye listeleri gibi yerlerde ilk paragrafı kısa bir özet olarak 
kullanmak gibi araçlar.

good*
  /// Deletes the file at [path].
  ///
  /// Throws an [IOError] if the file could not be found. Throws a
  /// [PermissionError] if the file is present but could not be deleted.
  void delete(String path) {
    ...
  }

bad*
  /// Deletes the file at [path]. Throws an [IOError] if the file could not
  /// be found. Throws a [PermissionError] if the file is present but could
  /// not be deleted.
  void delete(String path) {
    ...
  } 

Çevredeki bağlamla fazlalıktan KAÇININ.
Bir sınıfın doküman yorumunun okuyucusu, sınıfın adını, hangi arayüzleri 
uyguladığını vs. açıkça görebilir. Bir üye için dokümanları okurken, imza tam 
oradadır ve çevreleyen sınıf açıktır. Bunların hiçbirinin doküman yorumunda 
belirtilmesi gerekmez. Bunun yerine, okuyucunun bilmediği şeyleri açıklamaya 
odaklanın.

good*
  class RadioButtonWidget extends Widget {
    /// Sets the tooltip to [lines], which should have been word wrapped using
    /// the current font.
    void tooltip(List<String> lines) {
      ...
    }
  }

bad*
  class RadioButtonWidget extends Widget {
    /// Sets the tooltip for this radio button widget to the list of strings in
    /// [lines].
    void tooltip(List<String> lines) {
      ...
    }
  }

Bildirinin kendisinden çıkarılamayan söyleyecek ilginç bir şeyiniz yoksa, doc 
yorumunu atlayın. Okuyucunun zaten bildiği bir şeyi söyleyerek zamanını boşa 
harcamaktan hiçbir şey söylememek daha iyidir.    
*/
/*
Üçüncü şahıs fiillerle başlatma işlevi veya yöntem açıklamalarını TERCİH edin.

good*
  /// Returns `true` if every element satisfies the [predicate].
  bool all(bool predicate(T element)) => ...

  /// Starts the stopwatch if not already running.
  void start() {
    ...
  }

İsim cümleleri ile başlangıç ​​değişkeni, alıcı veya ayarlayıcı yorumlarını 
TERCİH edin.
Doküman yorumu, özelliğin ne olduğunu vurgulamalıdır . Bu, hesaplama veya başka 
işler yapabilen alıcılar için bile geçerlidir. Arayanın umursadığı , işin 
kendisi değil, o işin sonucudur .

/// The current day of the week, where `0` is Sunday.
int weekday;

/// The number of checked buttons on the page.
int get checkedCount => ...

Bir özelliğin hem alıcısı hem de ayarlayıcısı varsa, bunlardan yalnızca biri 
için bir belge yorumu oluşturun. dart docalıcı ve ayarlayıcıya tek bir alan 
gibi davranır ve hem alıcı hem de ayarlayıcı belge yorumlarına sahipse dart doc, 
ayarlayıcının belge yorumunu atar.
*/
/*
Başlangıç ​​kitaplığını TERCİH EDİN veya isim öbekleri içeren yorumlar yazın.
Sınıflar için belge yorumları genellikle programınızdaki en önemli belgelerdir. 
Türün değişmezlerini tanımlarlar, kullandığı terminolojiyi kurarlar ve sınıf 
üyeleri için diğer doküman yorumlarına bağlam sağlarlar. Burada biraz ekstra 
çaba, diğer tüm üyelerin belgelenmesini kolaylaştırabilir.

good*
  /// A chunk of non-breaking output text terminated by a hard or soft newline.
  ///
  /// ...
  class Chunk { ... }


Doküman yorumlarına kod örnekleri eklemeyi DİKKATE ALIN.

good*
  /// Returns the lesser of two numbers.
  ///
  /// ```dart
  /// min(5, 3) == 3
  /// ```
  num min(num a, num b) => ...

İnsanlar örneklerden genelleme yapmakta harikadır, bu nedenle tek bir kod 
örneği bile bir API'yi öğrenmeyi kolaylaştırır.

Kapsam içi tanımlayıcılara atıfta bulunmak için belge yorumlarında köşeli 
parantez kullanın.
*/
/*
Değişken, yöntem gibi şeyleri veya köşeli parantez içinde adları yazarsanız, 
dart docadı arar ve ilgili API belgelerine bağlantılar. Parantezler isteğe 
bağlıdır, ancak bir yöntemden veya oluşturucudan söz ettiğinizde bunu daha net 
hale getirebilir.

good*
  /// Throws a [StateError] if ...
  /// similar to [anotherMethod()], but ...

Belirli bir sınıfın bir üyesine bağlanmak için, sınıf adını ve üye adını nokta 
ile ayırarak kullanın:


Belirli bir sınıfın bir üyesine bağlanmak için, sınıf adını ve üye adını nokta 
ile ayırarak kullanın:

good*
  /// Similar to [Duration.inDays], but handles fractional days.


Nokta sözdizimi, adlandırılmış oluşturuculara atıfta bulunmak için de 
kullanılabilir. Adsız kurucu .newiçin sınıf adından sonra şunu kullanın:

good*
  /// To create a point, call [Point.new] or use [Point.polar] to ...
*/
/*
Parametreleri, dönüş değerlerini ve istisnaları açıklamak için düzyazı kullanın.

Diğer diller, bir yöntemin parametrelerinin ve getirilerinin ne olduğunu 
açıklamak için ayrıntılı etiketler ve bölümler kullanır.

bad*
  /// Defines a flag with the given name and abbreviation.
  ///
  /// @param name The name of the flag.
  /// @param abbr The abbreviation for the flag.
  /// @returns The new flag.
  /// @throws ArgumentError If there is already an option with
  ///     the given name or abbreviation.
  Flag addFlag(String name, String abbr) => ...

Dart'taki kural, bunu yöntemin açıklamasına entegre etmek ve köşeli parantezler 
kullanarak parametreleri vurgulamaktır.

good*
  /// Defines a flag.
  ///
  /// Throws an [ArgumentError] if there is already an option named [name] or
  /// there is already an option using abbreviation [abbr]. Returns the new 
  /// flag.
  Flag addFlag(String name, String abbr) => ...

doc yorumlarını meta veri açıklamalarından önce koyun.

good*
  /// A button that can be flipped on and off.
  @Component(selector: 'toggle')
  class ToggleComponent {}

bad*
  @Component(selector: 'toggle')
  /// A button that can be flipped on and off.
  class ToggleComponent {}

Belge yorumlarınızda çoğu markdown formatını kullanmanıza izin verilir ve 
markdown paketinidart doc kullanarak buna göre işleyeceksiniz .  
*/
