/*
Strings
Dart'ta dizeler oluştururken akılda tutulması gereken bazı en iyi uygulamalar.

Dize değişmezlerini birleştirmek için bitişik dizeleri KULLANIN.

+İki dize değişmeziniz varsa (değerler değil, gerçek alıntılanan değişmez biçim) 
bunları birleştirmek için kullanmanıza gerek yoktur . Tıpkı C ve C++'da olduğu 
gibi, bunları yan yana yerleştirmek bunu yapar. Bu, tek bir satıra sığmayan tek 
bir uzun dize oluşturmanın iyi bir yoludur.
*/
/// Good!
final String strGoog = 'ERROR: Parts of the spaceship are on fire. Other '
    'parts are overrun by martians. Unclear which are which.';

/// Bad!
final String strBad = 'ERROR: Parts of the spaceship are on fire. Other ' +
    'parts are overrun by martians. Unclear which are which.';

/*
Dizeleri ve değerleri oluşturmak için enterpolasyon kullanmayı TERCİH edin.
Başka dillerden geliyorsanız, + değişmez değerlerden ve diğer değerlerden bir 
dize oluşturmak için uzun zincirler kullanmaya alışkınsınız. Bu Dart'ta işe 
yarar, ancak enterpolasyonu kullanmak neredeyse her zaman daha temiz ve daha 
kısadır:
*/

/// Good!
String sayGood(String name, int year, int birth) {
  return 'Hello, $name! You are ${year - birth} years old.';
}

/// BAd!
String sayBad(String name, int year, int birth) {
  return 'Hello, ' + name + '! You are ' + (year - birth).toString() + ' y...';
}

// Bu kılavuzun, birden çok hazır bilgi ve değeri birleştirmek için geçerli
// olduğunu unutmayın. .toString()Yalnızca tek bir nesneyi bir dizgeye
// dönüştürürken kullanmak uygundur.

/*
Gerekmediğinde enterpolasyonda küme parantezleri kullanmaktan KAÇININ.
Hemen ardından daha fazla alfasayısal metin gelmeyen basit bir tanımlayıcıyı 
enterpolasyon yapıyorsanız, {}atlanmalıdır.
*/

/// Good!
String tallGood(String name, int decade) {
  return 'Hi, $name! I love your $decade s costume.';
}

/// Bad!
String tallBad(String name, int decade) {
  return 'Hi, ${name}! I love your ${decade}s costume.';
}
