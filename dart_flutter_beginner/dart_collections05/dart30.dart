/*
Listelerle Çalışmak
Bu derste, bir listenin bazı özellikleri ve yöntemleriyle tanışacaksınız.

Tartışıldığı gibi, Liste, gerçekleştirebileceği belirli özelliklere ve belirli 
yöntemlere sahip bir nesne türüdür. Aşağıda bunlardan bazılarına bakalım.

indeksleme #
Listeler sıfır tabanlı indeksleme kullanır. Bu, bir listenin ilk öğesinin 0. 
dizinde yer aldığı anlamına gelir.

Her öğenin kendi konumu olduğundan, her yineleme kendi konumunda benzersiz 
olduğundan, bir liste tek bir öğenin kopyalarını içerebilir. Örneğin, aşağıda 
gösterildiği gibi beş özdeş elemana sahip bir listemiz olabilir.

Bir Elemana Erişim #
Belirli bir dizindeki bir öğeye erişmek için köşeli 
parantezler ( []) kullanabiliriz.

Genel sözdizimi aşağıdaki gibidir:
*/
main() {
  var listOfVegetables = ['potato', 'carrot', 'cucumber'];

  print(listOfVegetables[1]);
}

/*
Bir Listenin Uzunluğunu Bulma #
Bir listenin uzunluğu, basitçe o listedeki öğelerin sayısıdır. Bir listenin 
uzunluğunu bulmak için lengthözelliğe erişebiliriz. Herhangi bir özelliğe 
erişmek için nokta operatörünü ( .) kullanırız.

Temel sözdizimi aşağıdaki gibidir:
*/
main1() {
  var listOfVegetables = ['potato', 'carrot', 'cucumber'];

  print(listOfVegetables.length);
}

/*
Tek Bir Öğe Ekleme #
addYöntemi kullanarak zaten var olan bir listenin sonuna tek bir öğe 
ekleyebiliriz . Tek koşul, eklediğiniz öğenin listedeki öğelerle aynı türden 
olması gerektiğidir.

Yöntemin add, listeye eklemek istediğiniz öğe olan tek bir parametresi vardır. 
Parametrenin türü, yöntemi çağırdığınız listeye bağlıdır.

Genel sözdizimi aşağıdaki gibidir:
*/
main2() {
  var listOfVegetables = ['potato', 'carrot', 'cucumber'];

  listOfVegetables.add('cabbage');

  print(listOfVegetables);
}

/*
Birden Fazla Öğe Ekleme #
addAllYöntemi kullanarak zaten var olan bir listeye birden çok öğe 
ekleyebiliriz . Yine tek koşul, eklediğiniz öğelerin tümünün listenin 
öğeleriyle aynı türden olması gerektiğidir.

Yöntem addAllayrıca bir liste olan tek bir parametreye sahiptir. Liste, 
zaten var olan bir listeye eklemek istediğiniz öğeleri içermelidir. 
Parametrenin tipidir; List<dataType>burada veri tipi, metodu çağırdığınız 
listeye bağlıdır.

Sonuç olarak, addAlltemelde iki listenin öğelerini tek bir listede birleştirir.

Genel sözdizimi aşağıdaki gibidir:
*/
main3() {
  var listOfVegetables = ['potato', 'carrot', 'cucumber', 'cabbage'];

  listOfVegetables.addAll(['broccoli', 'zucchini']);

  print(listOfVegetables);

  var vegetablesToAdd = ['okra', 'capsicum'];

  listOfVegetables.addAll(vegetablesToAdd);

  print(listOfVegetables);
}

/*
Tek Bir Öğeyi Kaldırma #
Zaten var olan bir listeden tek bir öğeyi kaldırmak için removeAt, 
belirtilen dizindeki öğeyi kaldıran yöntemi kullanabiliriz.

Yöntemin removeAt, kaldırmak istediğiniz öğenin dizini olan tek bir 
parametresi vardır. Parametrenin türü int.

Genel sözdizimi aşağıdaki gibidir:
*/
main4() {
  var listOfVegetables = [
    'potato',
    'carrot',
    'cucumber',
    'cabbage',
    'broccoli',
    'zucchini',
  ];

  listOfVegetables.removeAt(0);
  print(listOfVegetables);

  listOfVegetables.removeAt(2);
  print(listOfVegetables);
}
/*
Hangi öğeyi kaldırmak istediğinizi biliyorsanız ancak dizinini bilmiyorsanız, 
indexOfbir öğenin dizinini bulmak için önceki derste tartıştığımız yöntemi 
kullanabilirsiniz.

'Havuç' dizinini bulalım ve listOfVegetables.
*/
main5() {
  var listOfVegetables = ['carrot', 'cucumber', 'zucchini'];

  var carrotIndex = listOfVegetables.indexOf('carrot');
  listOfVegetables.removeAt(carrotIndex);

  print(listOfVegetables);
}

/*
Tüm Öğeleri Kaldırma #
Bir listeden tüm elemanları çıkarmak için clearparametre almayan metodu 
çağırabiliriz.

Tüm elemanları kaldıralım listOfVegetables.
*/
main6() {
  var listOfVegetables = ['cucumber', 'zucchini'];

  listOfVegetables.clear();

  print(listOfVegetables);
}

/*
map()Yöntem # _
Türün , koleksiyonla karıştırılmaması için Listbilinen bir yöntemi
 vardır .map()Map

map()bir listenin tüm öğelerini bir ifadeye veya ifadeye eşler. Örneğin, bir 
tamsayı listemiz olabilir ve listedeki her tamsayının karesini hesaplamak 
istiyoruz. map()Böyle bir sorunu çözmek için kullanılabilir.

Aşağıdaki sözdizimine bakalım.

Yineleyici herhangi bir ada sahip olabilir. Temel olarak listedeki her bir 
öğenin değerini tek tek alan bir değişkendir. Yineleyici, listedeki ilk öğeye 
eşit olarak başlar ve ardından bu öğeyi ifadeye uygular. Daha sonra listedeki 
ikinci maddeye atanacak ve o maddeyi deyime uygulayacaktır. Bu işlem listede 
başka eleman kalmayana kadar devam edecektir.

Aşağıdaki örnekte, sebze listemiz var ve her bir öğe için “Sebzeyi seviyorum” 
yazdırmak istiyoruz.

Dart'taki kod aşağıdaki gibidir:
*/
main7() {
  var listOfVegetables = ['carrot', 'cucumber', 'zucchini'];
  var mappedVegetables = listOfVegetables.map((vegetable) => 'I love $vegetable');
  print(mappedVegetables);
}

/*
Köşeli parantezler içermediğinden çıktının bir liste olmadığını fark etmiş 
olabilirsiniz. Sonucu map()bir listeye dönüştürmek için toList()yöntemi 
kullanabiliriz.

Çıktı bir liste olacak şekilde yukarıdaki kodu değiştirelim.
*/
main8() {
  var listOfVegetables = ['carrot', 'cucumber', 'zucchini'];
  var mappedVegetables = listOfVegetables.map((vegetable) => 'I love $vegetable').toList();
  print(mappedVegetables);
}
/*
Yukarıdaki kodu çalıştırdığınızda çıktı olarak bir liste göreceksiniz. 
Bu, 3. satırdakitoList() yöntem kullanılarak yapıldı .
*/
