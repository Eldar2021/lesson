/*
https://www.educative.io/answers/what-are-generators-in-dart

What are generators in Dart?
generator = üreteç

In Dart, a generator is a unique function that allows the user to produce a 
value sequence easily. Generators return values on demand when we try to 
iterate over them. Dart provides two types of generator functions that can be 
used to generate a sequence of values:

Synchronous generator: Returns an iterable object.
Asynchronous generator: Returns a stream object.

Dart'ta bir üreteç , kullanıcının kolayca bir değer dizisi üretmesini 
sağlayan benzersiz bir işlevdir. Jeneratörler, üzerlerinde yinelemeye 
çalıştığımızda talep üzerine değerleri döndürür. Dart, bir dizi değer 
oluşturmak için kullanılabilecek iki tür oluşturucu işlevi sağlar:

Senkron üreteçiterable : Bir nesne döndürür .
Asenkron üreteçstream : Bir nesne döndürür .
*/
/*
senkron jeneratör
Eşzamanlı bir üreteç iterable, sırayla erişilebilen bir nesne 
(yani, bir değerler veya öğeler topluluğu) döndürür. Senkron üreteç işlevini 
oluşturmak için (s), işlev gövdesini olarak bildirin ve değerleri oluşturmak
sync * için anahtar sözcüğü kullanın. yield

Aşağıdaki örnek, bir senkron jeneratörün nasıl uygulanacağını gösterir:
*/
Iterable evenNo(int num) sync* {
  int x = num;
  while (x >= 0) {
	
	// Check for even number
	  if (x % 2 == 0) yield x;
	
	// Decrease variable x
	x--;
  }
}

// Main Function
void main(){
  print("Using Synchronous Generator");
	
  print("Even Numbers between 20:");
	
  // Print even numbers
  evenNo(20).forEach(print);
}

/*
asenkron jeneratör
Asenkron üreteç tarafından bir streamnesne döndürülür. streambir dizi olayı 
alma yöntemidir. Her olay, öğe olarak da bilinen bir veri olayı veya bir 
şeylerin yanlış gittiğini gösteren bir hata olayıdır .stream

Eşzamansız bir üreteç işlevi oluşturmak (s)için işlev gövdesini şu şekilde 
bildirin ve değerleri oluşturmak async*için anahtar sözcüğü kullanın.yield

Aşağıdaki örnek, bir asenkron oluşturucunun nasıl uygulanacağını gösterir:
*/
// async* function(s) return an stream
Stream asyncNo(int num) async* {
  int x = 10;
	
  while (x >= num) yield x--;

}

// Main Function
void main1(){
  print("using Asynchronous Generator:");
	
  asyncNo(0).forEach(print);
}