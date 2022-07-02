/*
Concurrency in Dart

Dart, async-await, izolatlar ve ve gibi sınıflarla eşzamanlı programlamayı 
Future destekler Stream. FutureBu sayfa async-await, ve öğelerine genel bir 
bakış sunar Stream, ancak çoğunlukla izolatlarla ilgilidir.

Bir uygulama içinde, tüm Dart kodu bir yalıtkan olarak çalışır. Her Dart 
izolatının tek bir yürütme dizisi vardır ve diğer izolatlarla değiştirilebilen 
nesneler paylaşmaz. İzolatlar birbirleriyle iletişim kurmak için mesaj geçişini 
kullanır. Dart'ın izole modeli, işletim sisteminin sağladığı işlemler ve iş 
parçacıkları gibi temel temel öğelerle oluşturulmuş olsa da, Dart VM'nin bu 
temel öğeleri kullanması, bu sayfada ele alınmayan bir uygulama ayrıntısıdır.

Birçok Dart uygulaması yalnızca bir izolat ( ana izolat ) kullanır, ancak 
birden çok işlemci çekirdeğinde paralel kod yürütülmesini sağlayan ek izolatlar 
oluşturabilirsiniz.

Eşzamansız türleri ve sözdizimi
Future, ve async-await ile zaten aşina iseniz , izolatlar bölümüne Stream 
atlayabilirsiniz .
*/
/*
Gelecek ve Akış türleri

Dart dili ve kütüphaneleri gelecekte sağlanacak değerleri temsil etmek için 
Future ve nesneleri kullanır. StreamÖrneğin, sonunda bir intdeğer sağlama sözü 
olarak yazılır Future<int>. Bir dizi intdeğer sağlama sözü türüne sahiptir 
Stream<int>.

Başka bir örnek olarak, dosyaları okumak için dart:io yöntemlerini düşünün. 
Senkronize File yöntem readAsStringSync() , bir dosyayı senkronize olarak okur, 
dosya tamamen okunana veya bir hata oluşana kadar bloke eder. Yöntem daha sonra 
türde bir nesne döndürür String veya bir istisna atar. Eşzamansız eşdeğeri, 
readAsString()hemen türünde bir nesne döndürür Future<String>. Gelecekte bir 
noktada, Future<String>ya bir dize değeriyle ya da bir hatayla tamamlanır.

Asenkron kod neden önemlidir?
Çoğu uygulamanın aynı anda birden fazla şey yapması gerektiğinden, bir yöntemin 
eşzamanlı mı yoksa eşzamansız mı olduğu önemlidir.

Asenkron hesaplamalar genellikle mevcut Dart kodunun dışında hesaplamalar 
gerçekleştirmenin sonucudur; buna, hemen tamamlanmayan ve sonucu bekleyen Dart 
kodunuzu engellemek istemediğiniz hesaplamalar dahildir. Örneğin, bir uygulama 
bir HTTP isteği başlatabilir, ancak HTTP isteği tamamlanmadan önce görüntüsünü 
güncellemesi veya kullanıcı girişine yanıt vermesi gerekir. Eşzamansız kod, 
uygulamaların yanıt vermeye devam etmesine yardımcı olur.

Bu senaryolar, engellenmeyen G/Ç, bir HTTP isteği gerçekleştirme veya bir 
tarayıcıyla iletişim kurma gibi işletim sistemi çağrılarını içerir. Diğer 
senaryolar, aşağıda açıklandığı gibi başka bir Dart izolatında gerçekleştirilen 
hesaplamaları beklemeyi veya sadece bir zamanlayıcının tetiklenmesini beklemeyi 
içerir. Bu işlemlerin tümü ya farklı bir iş parçacığında çalışır ya da işletim 
sistemi veya Dart çalışma zamanı tarafından işlenir, bu da Dart kodunun 
hesaplamayla aynı anda çalışmasına olanak tanır.
*/
/*
zaman uyumsuz bekleyen sözdizimi
and anahtar sözcükleri, eşzamansız işlevleri tanımlamanın ve sonuçlarını 
kullanmanın bildirimsel bir yolunu sağlar async.await

Dosya G/Ç'sini beklerken bloke eden bazı eşzamanlı kodlara bir örnek:
*/
