/// https://codewithandrea.com/articles/flutter-project-structure/
/*
Flutter Project Structure: Feature-first or Layer-first?

Flutter Proje Yapısı: Öncelikli Özellik mi, Önce Katman mı?

Büyük Flutter uygulamaları oluştururken karar vermemiz gereken ilk şeylerden 
biri projemizi nasıl yapılandıracağımızdır .

Bu, tüm ekibin net bir kuralı izlemesini ve tutarlı bir şekilde 
özellikler eklemesini sağlar .

Bu nedenle, bu makalede projemizi yapılandırmak için iki yaygın 
yaklaşımı keşfedeceğiz: özellik-önce ve katman-önce .

Bunları gerçek dünyadaki uygulamalarda uygulamaya çalışırken bunların 
ödünleşimlerini öğrenecek ve yaygın tuzakları belirleyeceğiz. Ve yol boyunca 
maliyetli hatalardan kaçınarak projenizi nasıl yapılandırabileceğiniz konusunda 
adım adım net bir kılavuzla tamamlayacağız.

Uygulama Mimarisi ile İlgili Proje Yapısı
Pratikte, ancak hangi uygulama mimarisini kullanacağımıza karar verdikten 
sonra bir proje yapısı seçebiliriz.

Bunun nedeni, uygulama mimarisinin bizi net sınırlarla ayrı katmanlar 
tanımlamaya zorlamasıdır . Ve bu katmanlar projemizde bir yerde klasörler 
olarak görünecek.

Bu mimari , her biri uygulamamızın ihtiyaç duyduğu bileşenleri içeren dört 
farklı katmandan oluşur :

sunum : widget'lar, durumlar ve denetleyiciler
uygulama : hizmetler
alan : modeller
data : depolar, veri kaynakları ve DTO'lar (veri aktarım nesneleri)

Tabii ki, sadece tek sayfalık bir uygulama yapıyorsak, tüm dosyaları tek bir 
klasöre koyabilir ve buna bir gün diyebiliriz. 😎

Ancak daha fazla sayfa eklemeye başladığımızda ve ilgilenmemiz gereken çeşitli 
veri modelleri olduğunda, tüm dosyalarımızı tutarlı bir şekilde 
nasıl düzenleyebiliriz ?

Pratikte, genellikle önce özellik ya da ilk katman yaklaşımı kullanılır.

Öyleyse bu iki sözleşmeyi daha ayrıntılı olarak inceleyelim ve bunların 
ödünleşimlerini öğrenelim.

Önce katman (katmanların içindeki özellikler)
İşleri basit tutmak için uygulamada yalnızca iki özelliğimiz 
olduğunu varsayalım.

İlk katman yaklaşımını benimsersek , proje yapımız şöyle görünebilir:

‣ lib
  ‣ src
    ‣ presentation
      ‣ feature1
      ‣ feature2
    ‣ application
      ‣ feature1
      ‣ feature2
    ‣ domain
      ‣ feature1
      ‣ feature2
    ‣ data
      ‣ feature1
      ‣ feature2

Açıkça söylemek gerekirse, Dart dosyalarımızı doğrudan her katmanın içine 
koymadığımız, bunun yerine bunların içinde klasörler oluşturduğumuz için bu 
bir "katmanların içindeki özellikler" yaklaşımıdır.

Bu yaklaşımla, ilgili tüm Dart dosyalarını her bir özellik klasörünün içine 
ekleyebilir ve bunların doğru katmana (içerdeki widget'lar ve denetleyiciler 
presentation, içindeki modeller domainvb.) ait olduğundan emin olabiliriz.

Ve eklemek istiyorsak , her katmanın içinefeature3 bir feature3klasör 
eklememiz ve işlemi tekrarlamamız gerekiyor:

‣ lib
  ‣ src
    ‣ presentation
      ‣ feature1
      ‣ feature2
      ‣ feature3 <--
    ‣ application
      ‣ feature1
      ‣ feature2
      ‣ feature3 <--
    ‣ domain
      ‣ feature1
      ‣ feature2
      ‣ feature3 <--
    ‣ data
      ‣ feature1
      ‣ feature2
      ‣ feature3 <--

Birinci Katman: Dezavantajlar
Bu yaklaşımın pratikte kullanımı kolaydır, ancak uygulama büyüdükçe çok iyi 
ölçeklenmez.

Herhangi bir özellik için, farklı katmanlara ait dosyalar birbirinden çok 
uzaktadır. Ve bu, bireysel özellikler üzerinde çalışmayı zorlaştırıyor çünkü 
projenin farklı bölümlerine atlamaya devam etmemiz gerekiyor.

Ve bir özelliği silmek istediğimize karar verirsek, belirli dosyaları unutmak 
çok kolaydır, çünkü hepsi katmana göre düzenlenmiştir.

Bu nedenlerden dolayı, orta/büyük uygulamalar oluştururken özellik öncelikli 
yaklaşım genellikle daha iyi bir seçimdir.

Öncelikli özellik (özellikler içindeki katmanlar)
Öncelikli yaklaşım, uygulamamıza eklediğimiz her yeni özellik için yeni bir 
klasör oluşturmamızı gerektirir. Ve bu klasörün içine, katmanları kendilerini 
alt klasörler olarak ekleyebiliriz.

‣ lib
  ‣ src
    ‣ features
      ‣ feature1
        ‣ presentation
        ‣ application
        ‣ domain
        ‣ data
      ‣ feature2
        ‣ presentation
        ‣ application
        ‣ domain
        ‣ data
Bu yaklaşımı daha mantıklı buluyorum çünkü belirli bir özelliğe ait tüm 
dosyaları katmanlara göre gruplandırılmış olarak kolayca görebiliyoruz.

İlk katman yaklaşımıyla karşılaştırıldığında, bazı avantajlar vardır:

ne zaman yeni bir özellik eklemek istersek veya var olanı değiştirmek istersek, 
sadece bir klasöre odaklanabiliriz.
bir özelliği silmek istersek, kaldırılacak yalnızca bir klasör vardır 
(ilgili testsklasörü sayarsak iki tane)
Bu nedenle, ilk özellikli yaklaşımın eller aşağı kazandığı görülüyor! 🙌

Ancak, gerçek dünyada işler o kadar kolay değil.

Peki ya paylaşılan kod?
Tabii ki, gerçek uygulamalar oluştururken, kodunuzun istediğiniz gibi belirli 
klasörlere her zaman tam olarak sığmadığını göreceksiniz.

İki veya daha fazla ayrı özelliğin bazı widget'ları veya model sınıflarını 
paylaşması gerekiyorsa ne olur?

sharedBu common... adlı klasörlere sahip olmak kolaydır utils.

Ancak bu klasörlerin kendileri nasıl organize edilmelidir? Ve her türlü dosya 
için bir çöplük haline gelmelerini nasıl önlersiniz?

Uygulamanızın 20 özelliği varsa ve yalnızca ikisi tarafından paylaşılması 
gereken bazı kodlar varsa, gerçekten bir üst düzey sharedklasöre mi ait olmalı?

Ya 5 özellik arasında paylaşılırsa? yoksa 10 mu?

Bu senaryoda, doğru ya da yanlış cevap yoktur ve duruma göre en iyi kararınızı 
kullanmanız gerekir.

Bunun dışında, kaçınmamız gereken çok yaygın bir hata var.

Özellik, kullanıcı arayüzü ile ilgili değil!

Kullanıcı arayüzüne odaklandığımızda, bir özelliği uygulamada tek bir sayfa 
veya ekran olarak düşünmemiz muhtemeldir .

Yaklaşan Flutter kursum için e-Ticaret uygulamasını oluştururken bu hatayı 
kendim yaptım .

Ve sonunda şuna benzeyen bir proje yapısı elde ettim:

‣ lib
  ‣ src
    ‣ features
      ‣ account
      ‣ admin
      ‣ checkout
      ‣ leave_review_page
      ‣ orders_list
      ‣ product_page
      ‣ products_list
      ‣ shopping_cart
      ‣ sign_in

Yukarıdaki tüm özellikler, e-Ticaret uygulamasındaki gerçek ekranları 
temsil ediyordu.

Ancak, sunum , uygulama , etki alanı ve veri katmanlarını bunların içine 
yerleştirmeye gelince, bazı modeller ve depolar birden fazla sayfa tarafından 
paylaşıldığından ( product_pageve gibi) sorun yaşadım product_list.

Sonuç olarak, hizmetler , modeller ve depolar için üst düzey 
klasörler oluşturdum :

Başka bir deyişle, tüm sunum katmanımı temsil eden klasöre özellik öncelikli 
bir yaklaşım uygulamıştım. Ama kalan katmanlar için featureskendimi ilk katman 
yaklaşımıyla köşeye sıkıştırdım ve bu, proje yapımı istenmeyen bir 
şekilde etkiledi.

Kullanıcı arayüzüne bakarak özellik öncelikli bir yaklaşım uygulamaya 
çalışmayın. Bu sizi daha sonra ısıracak "dengesiz" bir proje yapısıyla 
sonuçlanacaktır.

What is a "feature"?
"Özellik" nedir?
Bu yüzden bir adım geri gittim ve kendime sordum: "özellik nedir"?
Ve bunun kullanıcının ne gördüğü değil, kullanıcının ne yaptığıyla ilgili 
olduğunu fark ettim :

    kimlik doğrulamak

    alışveriş sepetini yönet

    ödeme

    tüm geçmiş siparişleri görüntüle

    inceleme bırak

Başka bir deyişle, özellik, kullanıcının belirli bir görevi tamamlamasına 
yardımcı olan işlevsel bir gereksinimdir.

Etki alanı odaklı tasarımdan bazı ipuçları alarak , proje yapısını etki alanı 
katmanı etrafında düzenlemeye karar verdim .

Bunu anladığımda her şey yerine oturdu. Ve yedi işlevsel alanla bitirdim:

‣ lib
  ‣ src
    ‣ features
      ‣ address
        ‣ application
        ‣ data
        ‣ domain
        ‣ presentation
      ‣ authentication
        ...
      ‣ cart
        ...
      ‣ checkout
        ...
      ‣ orders
        ...
      ‣ products
        ‣ application
        ‣ data
        ‣ domain
        ‣ presentation
          ‣ admin
          ‣ product_screen
          ‣ products_list
      ‣ reviews
        ...

Bu yaklaşımla, belirli bir özellik içindeki kodun farklı bir özellikten gelen 
koda bağlı olmasının hala mümkün olduğunu unutmayın . Örneğin:

  ürün sayfası incelemelerin bir listesini gösterir

  siparişler sayfası bazı ürün bilgilerini gösterir

  ödeme akışı, kullanıcının önce kimliğini doğrulamasını gerektirir

Ancak , tüm özellikler arasında paylaşılan çok daha az dosya ile sonuçlanıyoruz 
ve tüm yapı çok daha dengeli .


Özellik önce, doğru şekilde nasıl yapılır

Özetle, özellik öncelikli yaklaşım, projemizi uygulamamızın işlevsel 
gereksinimleri etrafında yapılandırmamıza olanak tanır .

İşte bunu kendi uygulamalarınızda doğru şekilde nasıl kullanacağınız:

    etki alanı katmanından başlayın ve bunları işlemek için model 
    sınıflarını ve iş mantığını belirleyin

    birbirine ait olan her model (veya model grubu) 
    için bir klasör oluşturun

    bu klasör içinde, presentation, application, domain, 
    dataalt klasörlerini gerektiği gibi oluşturun

    her alt klasörün içine ihtiyacınız olan tüm dosyaları ekleyin

Flutter uygulamaları oluştururken, UI kodu ile iş mantığı arasında 5:1 
(veya daha fazla) bir orana sahip olmak çok yaygındır. Klasörünüzde çok 
sayıda dosya varsa presentation, bunları daha küçük "alt özellikleri" temsil
eden alt klasörler halinde gruplamaktan korkmayın.

Başvuru için, son proje yapım şu şekilde sonuçlandı:

‣ lib
  ‣ src
    ‣ common_widgets
    ‣ constants
    ‣ exceptions
    ‣ features
      ‣ address
      ‣ authentication
      ‣ cart
      ‣ checkout
      ‣ orders
      ‣ products
      ‣ reviews
    ‣ localization
    ‣ routing
    ‣ utils

common_widgets, constants, exceptions, localization, routingve gibi klasörlerin 
içine bile bakmadan , hepsinin özellikler arasında gerçekten paylaşılan veya 
iyi bir nedenle (yerelleştirme ve yönlendirme gibi) merkezileştirilmesiutils 
gereken kodlar içerdiğini tahmin edebiliriz .

Çözüm
Doğru yapıldığında, özellik öncelikli olmak, katman öncelikli olana göre 
birçok avantaja sahiptir .

Bununla 10K LOC'lik orta ölçekli bir e-ticaret uygulaması oluşturduktan sonra, 
bunun daha büyük kod tabanları için iyi çalışması gereken ölçeklenebilir bir 
yaklaşım olduğundan eminim.

And if you want to learn more about app architecture and the role of each 
individual layer, check the other articles in this series:

https://codewithandrea.com/articles/flutter-repository-pattern/
https://codewithandrea.com/articles/flutter-app-architecture-domain-model/
https://codewithandrea.com/articles/flutter-app-architecture-application-layer/
https://codewithandrea.com/articles/flutter-presentation-layer/
*/
