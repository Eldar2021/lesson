import 'dart:io';
/*
Null
Değişkenleri açıkça başlatmayın null.

Bir değişken null olmayan bir türe sahipse, kesinlikle başlatılmadan önce 
kullanmaya çalışırsanız Dart bir derleme hatası bildirir. Değişken boşsa, 
nullsizin için örtük olarak başlatılır. Dart'ta "başlatılmamış bellek" kavramı 
yoktur ve null"güvenli" olması için bir değişkeni açıkça başlatmaya 
gerek yoktur.
*/

class Item {
  var price;
}

/// Good!
Item? bestDealGood(List<Item> cart) {
  Item? bestItem;

  for (final item in cart) {
    if (bestItem == null || item.price < bestItem.price) {
      bestItem = item;
    }
  }

  return bestItem;
}

/// Bad!
Item? bestDealBad(List<Item> cart) {
  Item? bestItem = null;

  for (final item in cart) {
    if (bestItem == null || item.price < bestItem.price) {
      bestItem = item;
    }
  }

  return bestItem;
}

/*
Açık bir varsayılan değer KULLANMAYIN null.
Null yapılabilir bir parametreyi isteğe bağlı yaparsanız ancak ona varsayılan 
bir değer vermezseniz, dil örtük nullolarak varsayılan olarak kullanır, bu 
nedenle onu yazmaya gerek yoktur.
*/

/// Good!
void errorGood([String? message]) {
  stderr.write(message ?? '\n');
}

/// Bad!
void errorBad([String? message = null]) {
  stderr.write(message ?? '\n');
}

/*
Boole değerine ??dönüştürmek için kullanmayı TERCİH EDİN .null

Bu kural, bir ifade , veya olarak değerlendirebildiğinde uygulanır trueve false 
sonucu null, null olmayan bir boole değeri bekleyen bir şeye iletmeniz gerekir. 
Yaygın bir durum, koşul olarak boş bir yöntem çağrısının sonucunu kullanmaktır. 
"dönüştürebilir" veya nullkullanarak yapabilirsiniz, ancak şunu kullanmanızı 
öneririz :true false==??

good*
  // If you want null to be false:
  if (optionalThing?.isEnabled ?? false) {
    print('Have enabled thing.');
  }

  // If you want null to be true:
  if (optionalThing?.isEnabled ?? true) {
    print('Have enabled thing or nothing.');
  }

bad*
  // If you want null to be false:
  if (optionalThing?.isEnabled == true) {
    print('Have enabled thing.');
  }

  // If you want null to be true:
  if (optionalThing?.isEnabled != false) {
    print('Have enabled thing or nothing.');
  }

Her iki işlem de aynı sonucu verir ve doğru olanı yapar, ancak ??üç ana 
nedenden dolayı tercih edilir: 

  Operatör, ??kodun bununla bir ilgisi olduğunu bildirir null.

  == trueEşitlik operatörünün gereksiz olduğu ve kaldırılabileceği yaygın bir 
  hata gibi görünüyor . Bu, soldaki boole ifadesi üretmediğinde doğrudur null, 
  ancak üretebildiğinde değil.

  ve ifadesi ?? falseolduğunda ?? truehangi değerin kullanılacağını açıkça 
  gösterir null. ile , bunun a'nın false'a dönüştürüldüğü == trueanlamına 
  geldiğini anlamak için boole mantığıyla düşünmeniz gerekir .null

İstisna: Bir koşul içindeki bir değişken üzerinde boş farkındalı bir operatör 
kullanmak, değişkeni null olmayan bir türe yükseltmez. Değişkenin ifadenin 
gövdesi içinde yükseltilmesini istiyorsanız, arkasından gelen yerine açık bir 
kontrol ifkullanmak daha iyi olabilir :!= null?.??

good*
  int measureMessage(String? message) {
    if (message != null && message.isNotEmpty) {
      // message is promoted to String.
      return message.length;
    }

    return 0;
  }

bad*
  int measureMessage(String? message) {
    if (message?.isNotEmpty ?? false) {
      // message is not promoted to String.
      return message!.length;
    }

    return 0;
  }  
*/
