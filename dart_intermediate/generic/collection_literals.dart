/*
Koleksiyon değişmezlerini kullanma
Liste, küme ve harita değişmezleri parametrelenebilir. Parametreli değişmezler, 
açılış parantezinden önce eklemeniz (listeler ve kümeler için) veya 
(haritalar için) dışında, daha önce gördüğünüz değişmez değerler gibidir . 
Aşağıda, yazılan değişmez değerlerin kullanımına bir örnek verilmiştir:
<type><keyType, valueType>
*/
var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};

/*
yapıcılarla parametreli türleri kullanma
Bir kurucu kullanırken bir veya daha fazla tür belirtmek için, 
türleri <...>sınıf adından hemen sonra köşeli parantez ( ) içine koyun. Örneğin:
*/
var nameSet = Set<String>.from(names);

/// Aşağıdaki kod, tamsayı anahtarlarına ve Görünüm türünde değerlere
/// sahip bir eşleme oluşturur:

var views = Map<int, View>();

class View {}

/*
Jenerik koleksiyonlar ve içerdikleri türler
Dart jenerik türleri reified'dir , bu, tür bilgilerini çalışma zamanında 
taşıdıkları anlamına gelir. Örneğin, bir koleksiyonun türünü test edebilirsiniz:
*/
void main(List<String> args) {
  var names1 = <String>[];
  names1.addAll(['Seth', 'Kathy', 'Lars']);
  // ignore: unnecessary_type_check
  print(names1 is List<String>); // true
}
