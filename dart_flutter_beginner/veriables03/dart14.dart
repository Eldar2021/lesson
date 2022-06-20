/*
Type Inference and Annotation
In the following lesson, you will be introduced to type inference and 
learn about Dart's ability to infer types.

Dart güçlü bir şekilde yazılmıştır. Güçlü yazılan diller, bir değişkenin 
değerinin her zaman değişkenin statik türüyle eşleşmesini sağlamak için ek 
önlemler alır ve kuralları ve kısıtlamaları vardır.

Statik olarak yazılan programlama dilleri, değişkenlerin kullanılmadan önce 
tanımlanması gereken dillerdir.

Dart'ta türler zorunlu olsa da ,tür çıkarımı nedeniyle tür açıklamaları 
isteğe bağlıdır .

İlk önce ne tür bir çıkarım olduğunu anlayalım.

Tür Çıkarımı nedir? #
Adından da anlaşılacağı gibi, tür çıkarımı, bir programlama dilinin, 
kullanıcı tarafından belirtilmediğinde türleri çıkarsama yeteneğidir.

Şimdiye kadar, aşağıdaki sözdizimini kullanarak bir değişken bildiriyorduk:

int a = 2;

sözdizimi #
Tür çıkarımı, veri türünden açıkça bahsetmeden bir değişken bildirmemize olanak 
tanır. Dart'ta varveri tipinin yerine anahtar kelimeyi ekliyoruz.

var varibleNmae = varbleValue;
*/

main() {
  var bookTitle = "Lord of the Rings: The Fellowship of the Ring";
  var bookAuthor = "J. R. R. Tolkien";
  var bookNoOfPages = 423;

  // Driving Code
  print(bookTitle);
  print(bookAuthor);
  print(bookNoOfPages);
}

/*
Dinamik Türler #
Bir değişkenin birçok türden nesneyi tutmasını istiyorsanız, dynamicanahtar 
kelimeyi kullanarak bir değişken bildirebilirsiniz.

main() {
  dynamic dynamicVariable = 'A string'; // type String
  print(dynamicVariable);

  dynamicVariable = 5; // type int
  print(dynamicVariable);

  dynamicVariable = true; // type bool
  print(dynamicVariable);
}

Yukarıdaki kod parçacığında, bir değişken dynamicVariablebildiriyoruz ve ona 
ilk olarak type değerini atadık String. Daha sonra ona type türünde bir 
değişken intve son olarak type türünde bir değer atamaya devam ederiz bool. 
Kod hatasız sorunsuz çalışır.
*/