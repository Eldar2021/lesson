/*
https://dart.dev/guides/language/language-tour#extension-methods
Bir sınıfa özellikler ekleme: mixins

Karışımlar, bir sınıfın kodunu birden çok sınıf hiyerarşisinde yeniden 
kullanmanın bir yoludur.

Bir mixin kullanmak için, anahtarwith kelimeyi ve ardından bir veya daha fazla 
mixin adını kullanın. Aşağıdaki örnek, karışımları 
kullanan iki sınıfı göstermektedir:

Bir mixin uygulamak için, Object'i genişleten ve hiçbir kurucu bildirmeyen bir 
sınıf oluşturun. Karışımınızın normal bir sınıf olarak kullanılabilir olmasını 
istemiyorsanız, mixinyerine anahtar kelimeyi kullanın class. Örneğin:
*/
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

class Musician {
  // ...
}
mixin MusicalPerformer on Musician {
  // ...
}
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}
/*
Bazen bir mixin kullanabilen türleri kısıtlamak isteyebilirsiniz. Örneğin, 
karıştırma işlemi, karışımın tanımlamadığı bir yöntemi çağırabilmeye 
bağlı olabilir. onAşağıdaki örnekte gösterildiği gibi , gerekli üst sınıfı 
belirtmek için anahtar kelimeyi kullanarak bir karışımın kullanımını 
kısıtlayabilirsiniz :
*/
