import 'dart:math';
/*
Exceptions
istisnalar

Dart kodunuz istisnaları atabilir ve yakalayabilir. İstisnalar, beklenmeyen 
bir şeyin olduğunu gösteren hatalardır. İstisna yakalanmazsa, istisnayı 
oluşturan izolat askıya alınır ve genellikle izolat ve programı sonlandırılır.

Java'nın aksine, Dart'ın tüm istisnaları denetlenmeyen istisnalardır. Yöntemler, 
hangi istisnaları atabileceklerini bildirmez ve herhangi bir istisna 
yakalamanız gerekmez.

Dart, önceden tanımlanmış çok sayıda alt türün yanı sıra türler Exceptionsağlar. 
ErrorElbette, kendi istisnalarınızı tanımlayabilirsiniz. Ancak Dart programları, 
yalnızca İstisna ve Hata nesneleri değil, boş olmayan herhangi bir nesneyi bir 
istisna olarak atabilir.

Throw
İşte bir istisna atma veya yükseltme örneği:

throw FormatException ( 'En az 1 bölüm bekleniyor' ); 
*/
void DistanceTo(Point other) => throw Exception();
