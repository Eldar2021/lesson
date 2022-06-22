/*
Callable classes

çağrılabilir sınıflar
Dart sınıfınızın bir örneğinin bir işlev gibi çağrılmasına izin vermek için 
call() yöntemi uygulayın.

Aşağıdaki örnekte,WannabeFunction sınıf, üç dize alan ve bunları birleştiren, 
her birini bir boşlukla ayırarak ve bir ünlem ekleyerek bir call() işlevi 
tanımlar. Kodu yürütmek için Çalıştır'a tıklayın .
*/
class WannabeFunction {
  String call(String a, String b, String c) => '$a $b $c!';
}

var wf = WannabeFunction();
var out = wf('Hi', 'there,', 'gang');

void main() => print(out);
