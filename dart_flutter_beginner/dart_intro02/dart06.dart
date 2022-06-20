/*
Basit Bir Etkileşimli Program
Bu ders, Dart'ta bir uygulamaya girdi iletmek için komut satırını 
kullanmayı tartışacaktır.
*/
import 'dart:io';

main() {
  print("Hello ");
  print(stdin.readLineSync());
}
/*
Kodu Anlamak #
Yukarıdaki kod biraz korkutucu görünebilir. Ama merak etmeyin, her seferinde 
bir satır üzerinden geçelim.

Yukarıdaki kodun 1. satırındadart:io kütüphaneyi içe aktarıyoruz .

Bilgisayar programlamada kitaplık, kendi kodunuzda başvurabileceğiniz benzer 
bir kod koleksiyonudur. Bir kitaplığı içe aktardığınızda, o kitaplıktaki tüm 
kodlara erişebilirsiniz.

Her kütüphanenin belirli bir amacı vardır. Kitaplık , dart:ioweb dışı 
uygulamalar için G/Ç (Giriş/Çıkış) desteği sağlar. dart:ioYazdığımız program 
kullanıcıdan girdi gerektirdiği için import ettik.

Dart # Girdi Alma
Dart, programın gerektirdiği girdi türüne bağlı olarak bir kullanıcıdan 
harici girdi almak için kullanılabilecek birden çok yöntem sağlar. 
Bu ders için readLineSync()girdiden bir satır okuyan metodu (fonksiyonu) 
kullanacağız.

Kullanacağımız tam ifade stdin.readLineSync(). stdin , standart girdi anlamına 
gelir ve derleyicinin, programın özellikle kullanıcıdan bir tür girdi 
gerektirdiğini bilmesini sağlar. readLineSync()yukarıda tartıştığımız yerleşik 
bir yöntemdir.

4. satır Hello'yu görüntülüyor ve ardından ekleme ( +) operatörünü 
(kursta daha sonra tartışacağımız bir konu) kullanarak kullanıcı tarafından 
wecsağlanan girdiyle birleştiriyor (birleştiriyor ).

Yukarıda yazılan kodun hemen hemen hepsi bu kadar.
*/