/*
Bir mixin mixintürü tanımlamak için KULLANIN.

Dart'ın başlangıçta diğer sınıflara karıştırılması amaçlanan bir sınıfı 
bildirmek için ayrı bir sözdizimi yoktu. Bunun yerine, belirli kısıtlamaları 
karşılayan herhangi bir sınıf (varsayılan olmayan kurucu yok, üst sınıf yok, 
vb.) bir karışım olarak kullanılabilir. Bu kafa karıştırıcıydı çünkü sınıfın 
yazarı bunun karıştırılmasını amaçlamamış olabilir.

Dart 2.1.0, mixinbir karışımı açıkça bildirmek için bir anahtar kelime ekledi. 
Sadece mixin olarak kullanılabilen, kullanılarak oluşturulan türler ve dil 
ayrıca mixin'inizin kısıtlamalar dahilinde kalmasını sağlar. Mixin olarak 
kullanmayı düşündüğünüz yeni bir tür tanımlarken bu sözdizimini kullanın.
*/
class Control {}

/// Good!
mixin ClickableMixin implements Control {
  bool _isDown = false;

  void click();

  void mouseDown() {
    _isDown = true;
  }

  void mouseUp() {
    if (_isDown) click();
    _isDown = false;
  }
}
// Karışımları tanımlamak için hala eski kodlarla karşılaşabilirsiniz class, 
// ancak yeni sözdizimi tercih edilir.

/*
Karışım olması amaçlanmayan bir türde karıştırmaktan KAÇININ.

Uyumluluk için Dart, kullanılarak tanımlanmayan sınıflarda karıştırmanıza izin 
verir mixin. Ancak, bu riskli. Sınıfın yazarı, sınıfın bir mixin olarak 
kullanılmasını istemiyorsa, sınıfı karıştırma kısıtlamalarını bozacak şekilde 
değiştirebilir. Örneğin, bir kurucu eklerlerse sınıfınız bozulur.

Sınıfın bir doc yorumu veya gibi bariz bir adı IterableMixinyoksa, kullanılarak 
bildirilmediği takdirde sınıfta karıştıramayacağınızı varsayalım mixin.
*/
