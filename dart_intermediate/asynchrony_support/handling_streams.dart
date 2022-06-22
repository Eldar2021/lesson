/*
Bir Akıştan değerler almanız gerektiğinde iki seçeneğiniz vardır:
asyncve bir asenkron for döngüsü ( ) kullanın await for.
Kitaplık turunda açıklandığı gibi Akış API'sini kullanın .

Not: Kullanmadan önce await for, kodun daha anlaşılır olduğundan ve akışın 
tüm sonuçlarını gerçekten beklemek istediğinizden emin olun. Örneğin, 
UI çerçeveleri sonsuz olay akışları gönderdiğinden, genellikle UI olay 
dinleyicileri için kullanmamalısınız .await for
*/
// Asenkron bir for döngüsü aşağıdaki forma sahiptir:

void main() async {
  // ...
  var requestServer;
  await for (final request in requestServer) {
    handleRequest(request);
  }
  // ...
}

void handleRequest(request) {}

/*
Akış nesneleri, veri dizilerini temsil eden Dart API'leri boyunca görünür. 
Örneğin, düğme tıklamaları gibi HTML olayları akışlar kullanılarak iletilir. 
Bir dosyayı akış olarak da okuyabilirsiniz.

Döngü için asenkron kullanma
await forBazen Akış API'sini kullanmak yerine eşzamansız bir for döngüsü ( ) 
kullanabilirsiniz.

Aşağıdaki işlevi göz önünde bulundurun. Bir dosya listesine abone olmak için 
Stream'in listen()yöntemini kullanır ve her dosya veya dizini arayan bir işlev 
değişmezini iletir.
*/
