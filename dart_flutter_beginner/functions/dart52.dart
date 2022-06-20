/*
Higher-Order Functions
Üst Düzey Fonksiyonlar
Bu derste, üst düzey işlevlerle tanışacak ve sözdizimlerini öğreneceksiniz.

Giriş #
Dart gerçek bir nesne yönelimli dildir, bu nedenle işlevler bile nesnelerdir 
ve bir türü vardır Function. Fonksiyonlara birinci sınıf değerler gibi 
davranılır . Bunun anlamı, diğer herhangi bir değer gibi, bir fonksiyon da 
değişkenlere atanabilir, başka bir fonksiyona parametre olarak geçirilebilir 
ve sonuç olarak da döndürülebilir.

Diğer işlevleri parametre olarak alan veya işlevleri sonuç olarak döndüren 
işlevlere üst düzey işlevler denir .

Başka Functionbir tür olduğu gibi , numor gibi List, tür parametrelerine sahip 
işlevler oluşturabiliriz Function. Bu, oluşturulan işlevi çağırırken, ona 
başka bir işlevi argüman olarak iletmeniz gerektiği anlamına gelir.

Örnekle Öğrenme #
Argüman olarak forAllbir liste ve başka bir fonksiyon alan adında bir 
fonksiyon oluşturalım . sağlanan listedeki her öğede ' işlevini gerçekleştirir . 
sağlanan listenin değiştirilmiş öğeleriyle yeni bir 
liste döndürür.fforAllfforAll
*/
List<int> forAll(Function f, List<int> intList){
  var newList = <int>[];
  for(var i = 0; i < intList.length; i ++){
    newList.add(f(intList[i]));
  }
  return newList;
}

// Recursive factorial function
int factorial(int x) {
  if (x == 1) {
    return 1;
  } else {
    return x*factorial(x-1);
  }
}

main() {
  var tester = [1,2,3];
  var result = forAll(factorial, tester);
  print(tester);
  print(result);
}
