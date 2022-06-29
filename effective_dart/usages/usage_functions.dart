/*
Functions
Dart'ta fonksiyonlar bile nesnelerdir. İşte işlevleri içeren bazı en iyi 
uygulamalar.

Bir işlevi bir ada bağlamak için bir işlev bildirimi KULLANIN.

Modern diller, yerel iç içe işlevlerin ve kapanışların ne kadar yararlı 
olduğunu fark etti. Bir fonksiyonun başka birinin içinde tanımlanmış olması 
yaygındır. Çoğu durumda, bu işlev hemen bir geri arama olarak kullanılır ve bir 
ada ihtiyaç duymaz. Bir fonksiyon ifadesi bunun için harikadır.

Ancak, buna bir ad vermeniz gerekiyorsa, bir değişkene lambda bağlamak yerine 
bir işlev bildirimi ifadesi kullanın.
*/
/// Good!
void main() {
  // ignore: unused_element
  void localFunction() {
    1 + 1;
  }
}

/// Bad!
void main1() {
  // ignore: unused_local_variable
  var localFunction = () {
    1 + 1;
  };
}

/*
Yırtma işlemi yapacaksa lambda YAPMAYIN.

Bir işleve, yönteme veya adlandırılmış oluşturucuya başvurduğunuzda ancak 
parantezleri atladığınızda, Dart bir ayırma oluşturur; bu , işlevle aynı 
parametreleri alan ve onu çağırdığınızda temel işlevi çağıran bir kapatmadır. 
Tek ihtiyacınız olan, kapatmanın kabul ettiği parametrelerle aynı parametrelere 
sahip adlandırılmış bir işlevi çağıran bir kapatmaysa, çağrıyı bir lambda'ya 
elle sarmayın.
*/
var charCodes = [68, 97, 114, 116];
var buffer = StringBuffer();

/// Good!
void main2() {
  // Function:
  charCodes.forEach(print);

  // Method:
  charCodes.forEach(buffer.write);

  // Named constructor:
  // ignore: unused_local_variable
  var strings = charCodes.map(String.fromCharCode);

// Unnamed constructor:
  // ignore: unused_local_variable
  var buffers = charCodes.map(StringBuffer.new);
}

/// Bad!
void main3() {
  // Function:
  charCodes.forEach((code) {
    print(code);
  });

  // Method:
  charCodes.forEach((code) {
    buffer.write(code);
  });

  // Named constructor:
  // ignore: unused_local_variable
  var strings = charCodes.map((code) => String.fromCharCode(code));

  // Unnamed constructor:
  // ignore: unused_local_variable
  var buffers = charCodes.map((code) => StringBuffer(code));
}
