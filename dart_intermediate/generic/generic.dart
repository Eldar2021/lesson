/*
Generics
jenerik
Temel dizi türü için API belgelerine bakarsanız, Listtürün aslında List<E>. 
<…> notasyonu, List'i genel (veya parametreleştirilmiş ) bir tür olarak 
işaretler - biçimsel tür parametrelerine sahip bir tür. Kural olarak, çoğu tür 
değişkeninin E, T, S, K ve V gibi tek harfli adları vardır.

E=element
T=type
S=state
K=key
V=value

Neden jenerik kullanın?
Jenerikler genellikle tür güvenliği için gereklidir, ancak kodunuzun 
çalışmasına izin vermekten daha fazla faydaları vardır:

Genel türlerin doğru şekilde belirtilmesi, daha iyi oluşturulmuş kodla sonuçlanır.
Kod tekrarını azaltmak için jenerikleri kullanabilirsiniz.

Bir listenin yalnızca dizeleri içermesini istiyorsanız, onu olarak 
bildirebilirsiniz List<String>(bunu “dize listesi” olarak okuyun). Bu şekilde, 
siz, programcı arkadaşlarınız ve araçlarınız, listeye bir dizge dışı atamanın 
muhtemelen bir hata olduğunu algılayabilirsiniz. İşte bir örnek:
*/
void main(List<String> args) {
  var names = <String>[];
  names.addAll(['Seth', 'Kathy', 'Lars']);
  // names.add(42); // Error
}

/*
Jenerik kullanmanın bir başka nedeni de kod tekrarını azaltmaktır. Jenerikler, 
statik analizden yararlanmaya devam ederken tek bir arabirimi ve birçok tür 
arasında uygulamayı paylaşmanıza izin verir. Örneğin, bir nesneyi önbelleğe 
almak için bir arayüz oluşturduğunuzu varsayalım
*/
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

// Bu arabirimin dizeye özel bir sürümünü istediğinizi keşfedersiniz,
// böylece başka bir arabirim oluşturursunuz:
abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

/*
Daha sonra, bu arayüzün sayıya özel bir versiyonunu istediğinize karar 
veriyorsunuz… Fikri anlıyorsunuz.

Genel türler, sizi tüm bu arayüzleri oluşturma zahmetinden kurtarabilir. 
Bunun yerine, bir tür parametresi alan tek bir arabirim oluşturabilirsiniz:
*/
abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

/// Bu kodda T, yedek tiptir. Bir geliştiricinin daha sonra tanımlayacağı bir 
/// tür olarak düşünebileceğiniz bir yer tutucudur.
