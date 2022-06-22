/*
Declaring async functions
An async function is a function whose body is marked with the async modifier.

Bir asyncişlev, gövdesi asyncdeğiştiriciyle işaretlenmiş bir işlevdir.

Anahtar sözcüğü bir işleve eklemek, asyncbir Gelecek döndürmesini sağlar. 
Örneğin, bir Dize döndüren bu eşzamanlı işlevi düşünün:
*/
String lookUpVersion() => '1.0.0';

/// Bunu bir asyncişlev olarak değiştirirseniz - örneğin, gelecekteki bir 
/// uygulama zaman alıcı olacağı için - döndürülen değer bir Gelecek'tir:
Future<String> lookUpVersionAsync() async => '1.0.0';

/*
İşlev gövdesinin Future API'yi kullanması gerekmediğini unutmayın. 
Dart, gerekirse Future nesnesini oluşturur. İşleviniz yararlı bir değer 
döndürmezse, dönüş türünü yapın Future<void>.

asyncFutures, ve 'nin kullanımına ilişkin etkileşimli bir giriş için await, 
asenkron programlama kod laboratuvarına bakın .
*/
