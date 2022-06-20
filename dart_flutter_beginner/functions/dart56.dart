/*
Scope
Dürbün
Bu derste, sözcüksel kapsam belirlemeyi öğreneceksiniz.

Lexical Scope#
Sözlüksel Kapsam #
Sözlüksel kapsam , bir değişkenin yalnızca tanımlandığı kod bloğu içinden 
çağrılabilmesi için işlevsellik aralığıdır.

Dart, sözcüksel olarak kapsamlı bir dildir; bu, değişkenlerin kapsamının statik 
olarak, yalnızca kodun düzeniyle belirlendiği anlamına gelir.

Her küme parantez ( {}) kümesi, bildirildiği kapsamdan miras alırken kendi yeni 
kapsamını alır. Sözcüksel kapsam belirleme ile, alt kapsamlar aynı adı taşıyan 
en son bildirilen değişkene erişir.

Bir önceki derstenestedFunction , kapsamın dışında ne zaman olduğunu hatırlıyor
main()musunuz? Bunun nedeni kapsamında ilan edilmiş olmasıydı outerFunction.

Bir değişkenin kapsamda olup olmadığını görmek için küme parantezlerini dışa 
doğru takip edebilirsiniz.

Visibility#
Bir kod bloğunda neyin görünüp neyin görünmediğine gelince, iki kural vardır.

Kural 1: Bir kod bloğu içinde bir şey tanımladığınızda, bu sadece o kod 
bloğunun içinden görülebilir.

Kural #2: Bir kod bloğunun içindeki tanımlar, kod bloğunun dışındaki aynı 
adların gölge tanımları.

Örneğin, bir fonksiyonun dışında bir değişken tanımlıyorsam, aynı isimde bir 
değişkeni fonksiyon içinde de tanımlayabilirim, dış değişkeni etkilemeden.
Dış değişken, iç değişken tarafından gölgelenecektir. 
Aşağıda bir örneğe bakalım.
*/
int square(int x){
  return x * x;
}

main() {
  var amIVisible = 0;

  void result() {
    var amIVisible = square(3);
    print("Variable Inside Block: $amIVisible");
  }

  result();
  print("Variable Outside Block: $amIVisible");
}

int mainMax(int a, int b, int c) {
  // Write your code here
  if(a>b){
    if(a>c){
      return a;
    }else{
      return c;
    }
  }else if(b>c){
    return b;
  }else{
    return c;
  }
// Remove this line after writing your code  
}

int mainMax1(int a, int b, int c) {
  int max(int x, int y) {
    if(x > y){
      return x;
    } else{
      return y;
    }  
  }
  return max(a,max(b,c));
}

main1() {
  var result = mainMax(1,9,5);
  print(result);
}