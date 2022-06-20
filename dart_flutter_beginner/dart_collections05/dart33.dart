/*
Setlerle Çalışmak
Bu derste, bir kümenin bazı özellikleri ve yöntemleriyle tanışacaksınız.

Liste gibi, Küme de bir türdür ve bu nedenle bir nesnedir. Bu, kümelerin 
gerçekleştirebilecekleri belirli özelliklere ve belirli yöntemlere sahip 
olduğu anlamına gelir. Aşağıda bunlardan bazılarına bakalım.

Bir Sete Tek Bir Öğe Ekleme #
addYöntemi kullanarak zaten var olan bir kümeye tek bir öğe ekleyebiliriz . 
Tek koşul, eklediğiniz öğenin setin diğer öğeleriyle aynı türde olması
gerektiğidir.

Bir kümede çağrıldığında, addyöntemin kümeye eklemek istediğiniz öğe olan tek 
bir parametresi vardır. Parametrenin türü, yöntemi çağırdığınız kümeye bağlıdır.

Genel sözdizimi aşağıdaki gibidir:
*/
main() {
  var setOfFruit = <String>{};

  setOfFruit.add('apples');
  setOfFruit.add('bananas');
  setOfFruit.add('oranges');

  print(setOfFruit);
}

/*
Bir Kümeye Birden Fazla Öğe Ekleme #
addAllYöntemi kullanarak zaten var olan bir kümeye birden çok öğe 
ekleyebiliriz . Yine tek koşul, eklediğiniz öğelerin tümünün setin öğeleriyle 
aynı türde olması gerektiğidir.

Bir kümede çağrıldığında, addAllyöntemin ayrıca küme olan tek bir 
parametresi vardır. Set, zaten var olan bir sete eklemek istediğiniz öğeleri 
içermelidir. Parametrenin tipidir Set<dataType>, burada veri tipi, metodu 
çağırdığınız kümeye bağlıdır.

Sonuç olarak, addAlltemelde iki kümenin öğelerini tek bir kümede birleştirir.

Genel sözdizimi aşağıdaki gibidir
*/

main1() {
  var setOfFruits = {'apples', 'bananas', 'oranges'};

  var twoMoreFruits = {'watermelon', 'grapes'};
  setOfFruits.addAll(twoMoreFruits);

  print(setOfFruits);
}
/*
Bir Kümenin Uzunluğunu Bulma #
Listeler gibi, kümeler de size bir kümedeki öğelerin sayısını vermek 
length için nokta operatörü ( ) kullanılarak erişilebilen özelliklere sahiptir

Genel sözdizimi aşağıdaki gibidir.
*/
main2() {
  var setOfFruits = {'apples', 'bananas', 'oranges', 'watermelon', 'grapes'};

  print(setOfFruits.length);
}
/*
Bir Setten Öğeleri Çıkarma #
Bir kümeden bir öğeyi çıkarmak removeiçin belirtilen öğeyi kaldıran 
yöntemi kullanabiliriz.

Yöntemin remove, kaldırmak istediğiniz öğe olan tek bir parametresi vardır. 
Parametrenin türü, yöntemin çağrıldığı kümeye bağlıdır.

Genel sözdizimi aşağıdaki gibidir:

svg görüntüleyici
Bazı meyveleri çıkaralım setOfFruits.
*/
main3() {
  var setOfFruits = {'apples', 'bananas', 'oranges', 'watermelon', 'grapes'};

  // Remove 'bananas'
  setOfFruits.remove('bananas');

  print(setOfFruits);
}

/*
Bir Seti Kontrol Etme #
Sırasıyla bir kümedeki bir öğeyi mi yoksa birden çok öğeyi mi kontrol etmek 
istediğinize bağlı olarak containsyöntemi ve yöntemi kullanarak bir kümenin 
belirli öğeler içerip içermediğini kontrol edebilirsiniz .containsAll

için genel sözdizimi contains aşağıdaki gibidir:

için genel sözdizimi containsAll aşağıdaki gibidir:
*/
main4() {
  var setOfFruits = {'apples', 'oranges', 'watermelon', 'grapes'};

  //Check whether a single item is in the set
  print(setOfFruits.contains('grapes'));

  //Check whether multiple items are in the set
  print(setOfFruits.containsAll(['watermelon', 'bananas'])); //First Method

  var fruitsToCheck = {'watermelon', 'bananas'};
  print(setOfFruits.containsAll(fruitsToCheck)); // Second Method
}
/*
İki Takım Arası Kesişme #
İki küme ( set1 , set2 ) arasındaki kesişim hem set1 hem de set2'de bulunan 
öğeleri içeren bir kümedir .

Genel sözdizimi aşağıdaki gibidir:
*/
main5() {
  var setOfFruits = {'apples', 'oranges', 'watermelon', 'grapes'};
  var setOfMoreFruits = {'oranges', 'kiwi', 'bananas'};

  var intersectionSet = setOfFruits.intersection(setOfMoreFruits);
     
  print(intersectionSet);
}
/*
İki Takım Arası Birleştirme #
İki küme arasındaki birleşim ( set1 , set2 ), iki kümeden en az birinde bulunan 
öğeleri içeren bir kümedir. Bir öğe her iki sette de görünüyorsa, birleşimde 
yalnızca bir kez görünür.

Genel sözdizimi aşağıdaki gibidir:

Yukarıdaki örneği değiştirelim, böylece sonuç iki meyve grubunun birleşimi olsun.
*/

main6() {
  var setOfFruits = {'apples', 'oranges', 'watermelon', 'grapes'};
  var setOfMoreFruits = {'oranges', 'kiwi', 'bananas'};

  var intersectionSet = setOfFruits.union(setOfMoreFruits);
     
  print(intersectionSet);
}
