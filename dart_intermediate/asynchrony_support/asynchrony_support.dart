/*
Asynchrony support

zaman uyumsuzluk desteği
FutureDart kitaplıkları, dönen veya Streamnesnelerle dolu işlevlerle doludur . 
Bu işlevler eşzamansızdır : muhtemelen zaman alıcı bir işlemi (G/Ç gibi) 
ayarladıktan sonra, bu işlemin tamamlanmasını beklemeden geri dönerler.

Dart libraries are full of functions that return Future or Stream objects. 
These functions are asynchronous: they return after setting up a possibly 
time-consuming operation (such as I/O), without waiting for that operation 
to complete.

The async and await keywords support asynchronous programming, letting you 
write asynchronous code that looks similar to synchronous code

ve anahtar asyncsözcükleri awaiteşzamansız programlamayı destekleyerek eşzamanlı 
koda benzeyen eşzamansız kod yazmanıza olanak tanır.

Handling Futures
When you need the result of a completed Future, you have two options:

Use async and await, as described here and in the asynchronous programming 
codelab.
Use the Future API, as described in the library tour.

Code that uses async and await is asynchronous, but it looks a lot like 
synchronous code. For example, here’s some code that uses await to wait for 
the result of an asynchronous function:
*/
/// To use await, code must be in an async function—a function marked as async:
Future<void> checkVersion() async {
  // ignore: unused_local_variable
  var version = await lookUpVersion();
  // Do something with version
}

Future<String> lookUpVersion() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Eldar';
}

void main(List<String> args) async {
  await checkVersion();
}
