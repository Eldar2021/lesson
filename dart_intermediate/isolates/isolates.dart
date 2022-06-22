// https://dart.dev/guides/language/concurrency
/*
Isolates
Most computers, even on mobile platforms, have multi-core CPUs. 
To take advantage of all those cores, developers traditionally use 
shared-memory threads running concurrently. However, shared-state concurrency 
is error prone and can lead to complicated code.

Instead of threads, all Dart code runs inside of isolates. Each Dart isolate 
has a single thread of execution and shares no mutable objects with 
other isolates.

For more information, see the following:

Çoğu bilgisayarda, mobil platformlarda bile çok çekirdekli CPU'lar bulunur. 
Geliştiriciler, tüm bu çekirdeklerden yararlanmak için geleneksel olarak aynı 
anda çalışan paylaşılan bellek iş parçacıklarını kullanır. Ancak, paylaşılan 
durum eşzamanlılığı hataya açıktır ve karmaşık kodlara yol açabilir.

İş parçacıkları yerine, tüm Dart kodu izolatların içinde çalışır . Her Dart 
izolatının tek bir yürütme dizisi vardır ve diğer izolatlarla değiştirilebilen 
nesneler paylaşmaz.

Daha fazla bilgi için aşağıdakilere bakın:

Concurrency in Dart
dart:isolate API reference, including Isolate.spawn() and TransferableTypedData
Background parsing cookbook on the Flutter site
Isolate sample app
*/
/*
Çoğu bilgisayarda, mobil platformlarda bile çok çekirdekli CPU'lar bulunur. 
Geliştiriciler, tüm bu çekirdeklerden yararlanmak için geleneksel olarak 
aynı anda çalışan paylaşılan bellek iş parçacıklarını kullanır. Ancak, 
paylaşılan durum eşzamanlılığı hataya açıktır ve karmaşık kodlara yol açabilir.

İş parçacıkları yerine, tüm Dart kodu izolatların içinde çalışır . Her Dart 
izolatının tek bir yürütme dizisi vardır ve diğer izolatlarla değiştirilebilen 
nesneler paylaşmaz.

Daha fazla bilgi için aşağıdakilere bakın:

ana izole
Genellikle izolatlar hakkında düşünmenize gerek yoktur. Tipik bir Dart 
uygulaması, aşağıdaki şekilde gösterildiği gibi, tüm kodunu uygulamanın ana 
izolasyonunda yürütür:

Tek izolasyonlu programlar bile, bir sonraki kod satırına geçmeden önce 
asenkron işlemlerin tamamlanmasını beklemek için async-await kullanarak 
sorunsuzca çalışabilir. İyi niyetli bir uygulama hızlı bir şekilde başlar ve 
olay döngüsüne mümkün olan en kısa sürede ulaşır. Uygulama daha sonra, 
gerektiğinde eşzamansız işlemleri kullanarak kuyruğa alınan her olaya anında 
yanıt verir.

İzole yaşam döngüsü
main()Aşağıdaki şekilde gösterildiği gibi, her izolat, işlev gibi bir Dart kodu 
çalıştırarak başlar . Bu Dart kodu, örneğin kullanıcı girdisine veya dosya 
G/Ç'sine yanıt vermek için bazı olay dinleyicilerini kaydedebilir. 
İzolatın ilk işlevi döndüğünde, olayları işlemesi gerekiyorsa izolat etrafta 
kalır. Olayları ele aldıktan sonra, izolat çıkar.

Olay işleme
Bir istemci uygulamasında, ana izolatın olay kuyruğu, yeniden boyama 
isteklerini ve dokunma ve diğer UI olaylarının bildirimlerini içerebilir. 
Örneğin, aşağıdaki şekil bir yeniden boyama olayını, ardından bir dokunma 
olayını ve ardından iki yeniden boyama olayını göstermektedir. Olay döngüsü, 
sıradaki olayları ilk giren ilk çıkar sırasına göre alır.

main()Olay işleme, çıkışlardan sonra ana izolatta gerçekleşir . Aşağıdaki 
şekilde, main()çıkışlardan sonra, ana izolat ilk yeniden boyama olayını işler. 
Bundan sonra, ana izolat, tap olayını ve ardından bir yeniden boyama 
olayını işler.

Eşzamanlı bir işlem çok fazla işlem süresi alırsa uygulama yanıt vermeyebilir. 
Aşağıdaki şekilde, kademe işleme kodu çok uzun sürüyor, bu nedenle sonraki 
olaylar çok geç işleniyor. Uygulama donmuş gibi görünebilir ve gerçekleştirdiği 
herhangi bir animasyon sarsıntılı olabilir.

İstemci uygulamalarında, çok uzun eşzamanlı bir işlemin sonucu genellikle 
düzensiz (pürüzsüz olmayan) UI animasyonudur . Daha da kötüsü, kullanıcı 
arayüzü tamamen yanıt vermeyebilir.

Arka plan çalışanları
Uygulamanızın kullanıcı arayüzü , örneğin büyük bir JSON dosyasının 
ayrıştırılması gibi zaman alan bir hesaplama nedeniyle yanıt vermiyorsa, bu 
hesaplamayı genellikle arka planda çalışan olarak adlandırılan bir çalışan 
izolatına boşaltmayı düşünün. Aşağıdaki şekilde gösterilen yaygın bir durum, 
bir hesaplama gerçekleştiren ve ardından çıkan basit bir işçi izolatı 
oluşturmaktır. Çalışan izolasyonu, çalışan ayrıldığında sonucunu bir mesajla 
döndürür.

Her izole mesajı, o nesneden geçişli olarak erişilebilen her şeyi içeren bir 
nesneyi iletebilir. Tüm nesne türleri gönderilebilir değildir ve geçişli olarak 
erişilebilen herhangi bir nesne gönderilemiyorsa gönderme başarısız olur. 
Örneğin, List<Object>yalnızca listedeki nesnelerden hiçbiri gönderilemiyorsa 
türde bir nesne gönderebilirsiniz. Nesnelerden biri, örneğin a ise, 
Socketsoketler gönderilemediğinden gönderme başarısız olur.

İletilerde gönderebileceğiniz nesne türleri hakkında bilgi için, send() 
yöntemin API başvuru belgelerine bakın .

Bir çalışan izolatı, G/Ç (örneğin dosyaları okuma ve yazma), zamanlayıcıları 
ayarlama ve daha fazlasını gerçekleştirebilir. Kendi hafızasına sahiptir ve 
ana izolat ile herhangi bir durumu paylaşmaz. Çalışan izolatı, diğer izolatları 
etkilemeden engelleyebilir.
*/
/*
İşlev , arka plan çalışanı için izolatı_parseInBackground() oluşturan 
(oluşturan ve başlatan) kodu içerir ve ardından sonucu döndürür:

İzolatı oluşturmadan önce kod ReceivePort, çalışan izolatın ana izolata mesaj 
göndermesini sağlayan bir .

Isolate.spawn()Sonraki, arka plan çalışanı için izolasyonu oluşturan ve 
başlatan çağrıdır . İlk bağımsız değişken Isolate.spawn(), çalışanın yalıttığı 
işlevdir: _readAndParseJson. İkinci argüman, SendPort işçi izolatının ana 
izolata mesaj göndermek için kullanabileceğidir. Kod birSendPort ; _ 
sendPortözelliğini kullanır ReceivePort.

İzolat oluşturulduğunda, ana izolat sonucu bekler. ReceivePortSınıf uyguladığı 
için Stream, firstözellik, çalışanın yalıttığı tek mesajı almanın kolay 
bir yoludur.

İlgili ifade, izolattan çıkan jsonDatave iletilen kişiye gönderen son ifadedir 
SendPort. İleti geçişi SendPort.sendnormalde veri kopyalamayı içerir ve bu 
nedenle yavaş olabilir. Ancak, kullanarak verileri gönderdiğinizde 
Isolate.exit(), mesajı çıkan izolatta tutan bellek kopyalanmaz, bunun yerine 
alıcı izolata aktarılır. Gönderici yine de nesnelerin aktarılmasına izin 
verildiğinden emin olmak için bir doğrulama geçişi gerçekleştirecektir.
*/
