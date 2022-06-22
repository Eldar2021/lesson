/*
Typedefs

Typedef'ler
Anahtar kelimeyle bildirildiğinden genellikle typedef olarak adlandırılan 
bir tür takma adı typedef, bir türe atıfta bulunmanın kısa bir yoludur. 
Adlı bir tür takma adı bildirme ve kullanma örneği IntList:
*/
typedef IntList = List<int>;

IntList il = [1, 2, 3];

/// Bir tür diğer adı, tür parametrelerine sahip olabilir:

typedef ListMapper<X> = Map<X, List<X>>;

Map<String, List<String>> m1 = {}; // Verbose.

ListMapper<String> m2 = {}; // Same thing but shorter and clearer.

/*
Sürüm notu: 2.13'ten önce, typedef'ler işlev türleriyle sınırlıydı. 
Yeni typedef'leri kullanmak, en az 2.13'lük bir dil sürümü gerektirir.

Çoğu durumda işlevler için typedef'ler yerine satır içi işlev türlerini 
kullanmanızı öneririz . Ancak, işlev typedef'leri yine de yararlı olabilir:
*/
typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  // ignore: unnecessary_type_check
  assert(sort is Compare<int>); // True!
}
