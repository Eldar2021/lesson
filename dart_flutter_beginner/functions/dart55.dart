/*
Nested Functions
İç İçe İşlevler
Bu derste, iç içe işlevlerle tanışacaksınız.

Basitçe söylemek gerekirse, iç içe işlevler , başka bir işlev içinde 
tanımlanan işlevlerdir. İçinde işlevler oluşturduğumuzda , kendi başına bir 
işlev main()olduğu için iç içe işlevlerden yararlanıyoruz .main()

Aşağıda basit bir örneğe bakalım.
*/

void outerFunction() {
  print("Outer Function");
  void nestedFunction() {
    print("Nested Function");
  }

  nestedFunction();
}

main() {
  outerFunction();
}
