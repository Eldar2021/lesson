/*
Dart Before You Flutter
Bu derste, Dart'ın Flutter için tercih edilen dil olmasını sağlayan bazı 
özelliklerini gözden geçireceğiz.

Flutter, ifade özgürlüğüne izin veren ve mobil uygulamalar için UI'ler 
oluşturmayı bir keyif haline getiren bir stil sunarak geliştirme topluluğunun 
dikkatini çekmeyi başardı. Dart platformunu ana operasyon tabanı olarak 
kullanırken, reaktif programlama ve widget kompozisyonu gibi modern geliştirme 
deneyimlerine aşina olan belirli kavramları içerir.

Flutter ekibi bir düzineden fazla dili değerlendirdi ve Dart'ı, kullanıcı 
arayüzleri oluşturma biçimleriyle eşleştiği için seçti. Dart'ın neler sunduğunu 
ve neden Flutter tarafından seçildiğini görelim.

Optimized for UI#

Eşzamansız işlemler, başka bir işlemin bitmesini beklerken programınızın 
işi tamamlamasına izin verir. İşte bazı yaygın eşzamansız işlemler:

  Bir ağ üzerinden veri alma
  Veritabanına yazma
  Bir dosyadan veri okuma

  Çoğu bilgisayar, mobil platformlarda bile çok çekirdekli CPU'lara sahiptir. 
  Geliştiriciler, tüm bu çekirdeklerden yararlanmak için geleneksel olarak aynı 
  anda çalışan paylaşılan bellek iş parçacıklarını kullanır. Ancak, paylaşılan 
  durum eşzamanlılığı hataya açıktır ve karmaşık kodlara yol açabilir. 
  İş parçacıkları yerine, tüm Dart kodu izolatların içinde çalışır. 
  Her izolatın kendi bellek yığını vardır, bu da hiçbir izolatın durumuna 
  başka bir izolattan erişilememesini sağlar.

  Koleksiyonları genişletmeye yönelik özelliklere sahip kullanıcı arayüzleri 
  oluşturmak ve her platform için kullanıcı arayüzünü özelleştirmek için 
  optimize edilmiş bir programlama dili.

Productive Development#
  Flutter, hızlı ve kolay bir şekilde denemeler yapmanıza, kullanıcı 
  arayüzleri oluşturmanıza, özellikler eklemenize ve hataları düzeltmenize 
  yardımcı olan bir çalışırken yeniden yükleme özelliğine sahiptir. Çalışırken 
  yeniden yükleme, güncellenmiş kaynak kodu dosyalarını çalışan Dart Sanal 
  Makinesi'ne (VM) enjekte ederek çalışır. VM, alanları ve işlevlerin yeni 
  sürümleriyle sınıfları güncelledikten sonra, Flutter çerçevesi, pencere öğesi 
  ağacını otomatik olarak yeniden oluşturarak, değişikliklerinizin etkilerini 
  hızlı bir şekilde görüntülemenize olanak tanır.

  Flutter, tek bir kod satırı çalıştırmadan önce sorunları bulmanızı sağlayan 
  statik analiz sağlar. Hataları önlemek ve kodun stil yönergelerine uygun 
  olmasını sağlamak için kullanılan güçlü bir araçtır.

Fast on all Platforms#
  Dart, Flutter'ın neredeyse tamamının Dart'ta yazılmasına izin veren hızlı, 
  öngörülebilir, yerel kodu derleyen bir AOT (Zamanın Önünde) derleyicisine 
  sahiptir. Bu yalnızca Flutter'ı hızlandırmakla kalmaz, aynı zamanda neredeyse 
  her şeyin (tüm widget'lar dahil) özelleştirilebilmesini sağlar.    
*/