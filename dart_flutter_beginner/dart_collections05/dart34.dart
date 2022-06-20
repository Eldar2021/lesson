/*
Haritalar, Anahtarlar, Değerler
Aşağıdaki derste Dart'ta nasıl harita oluşturulacağını öğreneceksiniz.

Harita , sırasız bir anahtar/değer çiftleri koleksiyonudur . Anahtarları ve 
değerleri ilişkilendirir. Her değerin bir anahtarı vardır. Bu, her anahtarın 
benzersiz olması gerektiği anlamına gelir , ancak aynı değer birden çok kez 
kullanılabilir. Aynı değere sahip iki öğe, ayrı anahtarları aracılığıyla yine 
de benzersiz olacaktır.

Benzersiz bir tanımlayıcı ile nesnelere erişmeniz gerektiğinde bir harita 
kullanın.

Harita Oluşturma #
Harita oluşturmanın birden çok yolu vardır. Aşağıda daha yaygın olanlara 
bakalım.

Listeler ve kümeler gibi haritalar da değişmez değerler kullanılarak 
oluşturulabilir. Harita değişmezleri, şimdiye kadar gördüklerimizden biraz 
daha karmaşıktır.

Genel sözdizimi aşağıdaki gibidir:

İlk sözdizimi, liste değişmezleri ve küme değişmezleri için sözdizimiyle 
hemen hemen aynıdır. İlginç olan, köşeli parantezin açılmasından ( {) sonra 
gerçekleşir. Her bir anahtar/değer çifti birbiri üzerine yazılır. Her çift için 
anahtar ve değer iki nokta üst üste ( :) ile ayrılır. Son anahtar/değer 
çiftinden sonra bir sonraki satıra geçiyoruz ve kapanış küme parantezini ( }) 
yerleştiriyoruz.

,İsterseniz , son anahtar/değer çiftinden sonra bir virgül ( ) ekleyebilirsiniz.
Bu ne bir hata verir ne de işlevselliği etkiler.
*/
main() {
  var capitals = {
    'United States': 'Washington D.C.',
    'England': 'London',
    'China': 'Beijing',
    'Germany': 'Berlin',
    'Nigeria': 'Abuja',
    'Egypt': 'Cairo',
    'New Zealand': 'Wellington'
  };

  // Driver Code
  print(capitals);
}
/*
Yukarıda oluşturulan harita 7 anahtar/değer çiftine sahiptir ve yazdırıldığında 
tam olarak bildirildiği gibi görüntülenir; {}her bir anahtar/değer çifti 
virgülle ( ,) ve her anahtar ve değer iki nokta üst üste ( ) ile ayrılmış 
şekilde küme parantezleri ( ) arasında :.

Dart, capitalsbir türe sahip çıkarım yapar Map<String,String>(a Map, 
hem anahtarların hem de değerlerin türünde olduğu String).

Bir Yapıcı Kullanma #
Harita yapıcısını kullanarak da bir harita oluşturabilirsiniz . Temel sözdizimi 
List yapıcısına benzer. Hadi bir bakalım.
*/
main1() {
  var emptyMap = Map();

  // Driver Code
  print(emptyMap);
}
/*
Tür # Belirtilmesi
Haritalar parametreli türlerdir. Bu, anahtarların ve değerlerin ne tür olması 
gerektiğini belirleyebileceğiniz anlamına gelir.

Genel sözdizimi aşağıdaki gibidir:

svg görüntüleyici
Anahtarların veri tipi, değerlerden farklı olabilir.

Aşağıdaki örneğimizde, anahtar türünde intve değer türündedir String.
*/
main2() {
  var numbers = Map<int, String>();

  print(numbers);
}
