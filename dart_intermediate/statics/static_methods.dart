import 'dart:math';
/*
Static methods

Statik yöntemler (sınıf yöntemleri) bir örnek üzerinde çalışmaz ve 
bu nedenle this. Bununla birlikte, statik değişkenlere erişimleri vardır. 
Aşağıdaki örnekte gösterildiği gibi, statik yöntemleri doğrudan bir sınıf 
üzerinde çağırırsınız:

Statik yöntemleri derleme zamanı sabitleri olarak kullanabilirsiniz. Örneğin, 
bir sabit yapıcıya parametre olarak statik bir yöntemi iletebilirsiniz.

Not: Yaygın veya yaygın olarak kullanılan yardımcı programlar ve işlevler için 
statik yöntemler yerine üst düzey işlevleri kullanmayı düşünün.
*/
class Point {
  double x, y;
  Point(this.x, this.y);

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}
