/*
Getter and Setters
Alıcı ve Ayarlayıcılar

Giriş #
Alıcılar ve ayarlayıcılar , bir nesnenin özelliklerine okuma ve yazma erişimi 
sağlayan özel yöntemlerdir. Nokta operatörünü ( ) kullanarak örnek 
değişkenlerin değerlerini nasıl alıp ayarlayabildiğimizi hatırlayın .. 
Her bir örnek değişkeni, şimdiye kadar kullandığımız örtük bir alıcı ve 
ayarlayıcıya sahiptir. Bu derste, getter ve setter yöntemlerini keşfedeceğiz.

Getters#
Alıcılar #
Alıcılar, bir nesnenin özelliklerinin değerlerini almak için kullanılan ve 
getanahtar sözcük kullanılarak tanımlanan işlevlerdir.

Sözdizimi aşağıdaki gibidir:
*/
class Person {
  String name;
  String gender = 'male';
  int age;

  Person(
    this.name,
    this.gender,
    this.age,
  );

  // Getter function getting the value of name
  String get personName => name;

  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

void main() {
  var firstPerson = Person("Sarah", "Female", 25);
  print(firstPerson.personName);
}

/*
Setters#
Ayarlayıcılar #
Ayarlayıcılar, bir nesnenin özelliklerinin değerlerini yazmak için kullanılan 
ve setanahtar sözcük kullanılarak tanımlanan işlevlerdir.

Sözdizimi aşağıdaki gibidir:
*/
class Person1 {
  String name;
  String gender;
  int age;

  Person1({
    required this.name,
    required this.gender,
    required this.age,
  });

  String get personName => name;

  // Setter function for setting the value of age
  void set personAge(int val) {
    if (val < 0) {
      print("Age cannot be negative");
    } else {
      this.age = val;
    }
  }

  walking() => print('$name is walking');
  talking() => print('$name is talking');
}

class Figure {
  num left, top, width, height;

  Figure(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top - height;
  set bottom(num value) => top = value + height;
}

main1() {
  var fig = Figure(3, 4, 20, 15);
  print(fig.left);
  print(fig.right);
  fig.right = 12;
  print(fig.left);
}
/*
15. satırda değeri left3'tür . _ Ancak 17. satırdaki setter fonksiyonunu 
çağırdığımızda değeri -8right olarak değiştirilir . Hangi satır 18'de 
görüntüleniyor .left
*/
