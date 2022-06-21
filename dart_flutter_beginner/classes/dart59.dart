/*
Bir Sınıfın Nesneleri
Bu derste, bir sınıfın ilk nesnesini oluşturacak ve sınıf üyelerini nasıl 
kullanacağınızı öğreneceksiniz.

Bir Sınıfın Örneklenmesi #
newBir sınıf tanımlandıktan sonra, anahtar kelimeyi ve ardından parantez 
( ) ile devam eden bir sınıf tanımlayıcısını kullanarak sınıf planından 
nesneler oluşturabilirsiniz ().

Genellikle sadece onları yaratmak için nesneler yaratmayız, daha ziyade 
onlarla bir şekilde çalışmak isteriz. Bu nedenle nesneyi bir değişkene 
atadık. Sınıfımızı somutlaştıralım Person.

Kolaylık sağlamak için, sınıfı oluşturma kodu da aşağıda verilmiştir.
*/
import 'dart58.dart';

void main() {
  // Creating an object of the Person class
  final eldar = Person(name: 'Eldar', gender: 'male', age: 22);
  eldar.talking();
}
