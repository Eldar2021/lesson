/*
Assignment Operators
Atama Operatörleri
In the following lesson, you will be introduced to assignment operators.

We'll cover the following

Compound Assignment Operators

Examples
+=
&=
~/=

Atama operatörleri, bir işlenene değer atayan işlemleri gerçekleştirmek için 
kullanılır. Şimdiye kadar tartıştığımız tüm operatörlerin ve henüz 
tartışmadığımız operatörlerin değiştirilmiş versiyonlarıdır.

=Değer atamak için operatörün nasıl kullanılabileceğini zaten gördük ; 
Bu kursun başından beri kullanıyoruz.

=

-=

/=

%=

>>=

^=

+=

*=

~/=

<<=

&=

sözdizimi #
İşte onların genel sözdizimi:

svg görüntüleyici
Olan şudur ki, operatör işlenen1 ve işlenen2 üzerinde bir işlem gerçekleştiriyor 
ve ardından elde edilen değeri işlenen1'e atıyor .

Aşağıdakine eşdeğerdir:

svg görüntüleyici
Bir desen fark etmiş olabilirsiniz. Atama operatörleri, işlemin sonucu 
sol/birinci işlenende saklandığından işlenenlerinin değişken olmasını gerektirir.

Örneğimizde, sol işleneni 10 ve sağ işleneni 7A olarak alacağız ve hem atama 
operatörünü hem de bileşik atama operatörlerini kullanacağız .B
*/

main() {
  var A = 10;
  var B = 7;

  /// +=
  print('----------- ----------- += --------- -------------- -----');
  print("Before using a compound assignment operator:");
  print(A);

  A += B;

  print("After using a compound assignment operator:");
  print(A);

  /// &=
  print('----------- ----------- &= --------- -------------- -----');
  
  print("Before using a compound assignment operator:");
  print(A);

  A &= B;

  print("After using a compound assignment operator:");
  print(A);

  /// ~/=
  print('----------- ----------- ~/= --------- -------------- -----');
  print("Before using a compound assignment operator:");
  print(A);

  A ~/= B;

  print("After using a compound assignment operator:");
  print(A);
}