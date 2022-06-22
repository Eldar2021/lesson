/*
Comments
Dart supports: 
  single-line comments, 
  multi-line comments,
  documentation comments.

Single-line comments
A single-line comment begins with //. Everything between // and the end of line 
is ignored by the Dart compiler.  

Tek satırlık yorumlar
Tek satırlık bir yorum ile başlar //. //Satır sonu ve arasındaki her şey Dart 
derleyicisi tarafından yok sayılır.
*/
void main() {
  // refactor into an AbstractLlamaGreetingFactory?
  print('Welcome to my Llama farm!');
}

/*
Multi-line comments
A multi-line comment begins with /* and ends with */. Everything between 
/* and */ is ignored by the Dart compiler (unless the comment is a 
documentation comment; see the next section). Multi-line comments can nest.

Çok satırlı yorumlar
Çok satırlı bir yorum ile başlar /*ve ile biter */. Arasındaki her şey 
/*Dart */derleyicisi tarafından yoksayılır (yorum bir belge yorumu değilse; 
sonraki bölüme bakın). Çok satırlı yorumlar iç içe geçebilir.
*/
void main1() {
  /*
   * This is a lot of work. Consider raising chickens.

  Llama larry = Llama();
  larry.feed();
  larry.exercise();
  larry.clean();
   */
}

/*
Documentation comments
Documentation comments are multi-line or single-line comments that begin with 
[///] or [/**.] Using /// on consecutive lines has the same effect as a 
/// multi-line doc comment.

Inside a documentation comment, the analyzer ignores all text unless it is 
enclosed in brackets. Using brackets, you can refer to classes, methods, fields, 
top-level variables, functions, and parameters. The names in brackets are 
resolved in the lexical scope of the documented program element.

Here is an example of documentation comments with references to other classes 
and arguments:
*/

Dokümantasyon yorumları
Belge yorumları, veya ile başlayan çok satırlı veya tek satırlı 
///yorumlardır /**. Ardışık satırlarda kullanmak ///, çok satırlı bir doküman 
///yorumu ile aynı etkiye sahiptir.

Bir belge yorumu içinde, çözümleyici, parantez içine alınmadığı sürece tüm 
metni yok sayar. Köşeli parantezleri kullanarak sınıflara, yöntemlere, 
alanlara, üst düzey değişkenlere, işlevlere ve parametrelere başvurabilirsiniz. 
Parantez içindeki adlar, belgelenmiş program öğesinin sözcüksel 
kapsamında çözümlenir.

Aşağıda, diğer sınıflara ve argümanlara atıfta bulunulan bir belge yorumu 
örneği verilmiştir:
*/
*/
/// A domesticated South American camelid (Lama glama).
///
/// Andean cultures have used llamas as meat and pack
/// animals since pre-Hispanic times.
///
/// Just like any other animal, llamas need to eat,
/// so don't forget to [feed] them some [Food].
class Llama {
  String? name;

  /// Feeds your llama [food].
  ///
  /// The typical llama eats one bale of hay per week.
  void feed(Food food) {
    // ...
  }

  /// Exercises your llama with an [activity] for
  /// [timeLimit] minutes.
  void exercise(Activity activity, int timeLimit) {
    // ...
  }
}

class Activity {}

class Food {}
