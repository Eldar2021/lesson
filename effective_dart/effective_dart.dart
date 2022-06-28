/*
Effective Dart

Geçtiğimiz birkaç yılda bir ton Dart kodu yazdık ve neyin işe yarayıp neyin 
yaramadığı hakkında çok şey öğrendik. Bunu sizinle paylaşıyoruz, böylece siz de 
tutarlı, sağlam ve hızlı kod yazabilirsiniz. İki kapsayıcı tema vardır:

Be consistent
  Tutarlı olun. Biçimlendirme ve kasa oluşturma gibi şeyler söz konusu olduğunda, 
  hangisinin daha iyi olduğu konusundaki argümanlar özneldir ve çözülmesi 
  imkansızdır. Bildiğimiz şey, tutarlı olmanın nesnel olarak yardımcı olduğudur.

  İki kod parçası farklı görünüyorsa, bunun nedeni , anlamlı bir şekilde farklı 
  olmalarıdır . Biraz kod göze çarptığında ve gözünüze çarptığında, bunu faydalı 
  bir nedenle yapmalıdır.

Be brief.
  Kısa ol. Dart tanıdık gelecek şekilde tasarlanmıştır, bu nedenle C, Java, 
  JavaScript ve diğer dillerle aynı ifadelerin ve ifadelerin çoğunu devralır. 
  Ancak Dart'ı yarattık çünkü bu dillerin sunduklarını geliştirmek için çok yer 
  var. Niyetinizi daha basit ve kolay bir şekilde ifade etmenize yardımcı olmak 
  için dize enterpolasyonundan formaliteleri başlatmaya kadar bir dizi özellik 
  ekledik.

  Bir şeyi söylemenin birden fazla yolu varsa, genellikle en kısa olanı 
  seçmelisiniz. Bu, golfü tüm programı tek bir satıra sığdırmak için kodlamanız 
  gerektiği anlamına gelmez. Amaç, yoğun değil , ekonomik koddur .
*/
/*
The guides / rehberler
Kolay sindirmek için yönergeleri birkaç ayrı sayfaya böldük:

  Style Guide
  Stil Kılavuzu – Bu, kodun düzenlenmesi ve düzenlenmesi için kuralları veya en 
  azından dart formatının sizin için işlemediğibölümleri tanımlarStil kılavuzu, 
  tanımlayıcıların nasıl biçimlendirildiğini de belirtir: camelCase,
  using_underscores, vb.

  Documentation Guide
  Dokümantasyon Kılavuzu – Bu, yorumların içine girenlerle ilgili bilmeniz 
  gereken her şeyi size anlatır. Hem belge yorumları hem de olağan, olağan 
  kod yorumları.

  Usage Guide 
  Kullanım Kılavuzu – Bu, davranışı uygulamak için dil özelliklerinden en iyi 
  şekilde nasıl yararlanacağınızı öğretir. Bir ifadede veya ifadedeyse, burada 
  ele alınır.

  Design Guide 
  Tasarım Kılavuzu – Bu en yumuşak kılavuzdur, ancak kapsamı en geniş olanıdır. 
  Kitaplıklar için tutarlı, kullanılabilir API'ler tasarlama hakkında 
  öğrendiklerimizi kapsar. Bir tür imzası veya bildirimindeyse, bu onun 
  üzerinden geçer.
*/
/*
How to read the guides / Kılavuzlar nasıl okunur

Her kılavuz birkaç bölüme ayrılmıştır. Bölümler bir yönerge listesi içerir. 
Her kılavuz şu kelimelerden biriyle başlar:

  DO
  Yap yönergeleri, her zaman takip edilmesi gereken uygulamaları tanımlar. 
  Onlardan uzaklaşmak için neredeyse hiçbir zaman geçerli bir sebep olmayacak

  DON’T
  YAPMAYIN yönergeleri tam tersidir: neredeyse hiçbir zaman iyi bir fikir 
  olmayan şeyler. Umarım, diğer dillerin sahip olduğu kadar çok sahip değiliz 
  çünkü daha az tarihsel bagajımız var.

  PREFER
  TERCİH yönergeleri, izlemeniz gereken uygulamalardır . Ancak, aksini yapmanın 
  mantıklı olduğu durumlar olabilir. Bunu yaparken kılavuzu görmezden gelmenin 
  tüm sonuçlarını anladığınızdan emin olun.

  AVOID
  KAÇININ yönergeleri, “tercih etmek” için iki yönlüdür: yapmamanız gereken, 
  ancak nadiren yapmak için iyi nedenlerin olabileceği şeyler.

  CONSIDER
  DÜŞÜNÜN yönergeler, koşullara, emsallere ve kendi tercihinize bağlı olarak, 
  takip etmek isteyebileceğiniz veya istemeyebileceğiniz uygulamalardır.

Bazı yönergeler , kuralın geçerli olmadığı bir istisnayı açıklar . İstisnalar 
listelendiğinde kapsamlı olmayabilir - yine de kararınızı başka davalarda 
kullanmanız gerekebilir.

Bağcıklarınızı doğru bağlamazsanız polis kapınızı kıracak gibi görünüyor. 
İşler o kadar da kötü değil. Buradaki yönergelerin çoğu sağduyulu ve hepimiz 
makul insanlarız. Amaç, her zaman olduğu gibi, güzel, okunabilir ve bakımı 
yapılabilir koddur.
*/
/*
Glossary
Yönergeleri kısa tutmak için farklı Dart yapılarına atıfta bulunmak için birkaç 
kısa terim kullanıyoruz.

  library member
  Kitaplık üyesi , üst düzey bir alan, alıcı, ayarlayıcı veya işlevdir. Temel 
  olarak, bir tür olmayan en üst düzeydeki herhangi bir şey.

  class member
  Bir sınıf üyesi , bir sınıf içinde bildirilen bir yapıcı, alan, alıcı, 
  ayarlayıcı, işlev veya operatördür. Sınıf üyeleri örnek veya statik, soyut 
  veya somut olabilir.

  member
  Bir üye ya bir kütüphane üyesi ya da bir sınıf üyesidir.

  variable
  Bir değişken , genel olarak kullanıldığında, üst düzey değişkenlere, 
  parametrelere ve yerel değişkenlere atıfta bulunur. Statik veya örnek 
  alanları içermez.

  type
  Tür , herhangi bir adlandırılmış tür bildirimidir: bir sınıf, typedef 
  veya enum.

  property
  Bir özellik , üst düzey bir değişkendir, alıcı (bir sınıf içinde veya en üst 
  düzeyde, örnek veya statik), ayarlayıcı (aynı) veya alan (örnek veya statik). 
  Kabaca herhangi bir "alan benzeri" adlı yapı.
*/
