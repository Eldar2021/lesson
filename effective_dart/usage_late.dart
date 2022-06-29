/*
Usage Late
lateBaşlatılıp başlatılmadığını kontrol etmeniz gerekiyorsa, 
değişkenlerden KAÇININ.

late Dart, bir değişkenin başlatılıp başlatılmadığını veya atandığını söylemenin 
bir yolunu sunmaz . Erişirseniz, başlatıcıyı (varsa) hemen çalıştırır veya bir 
istisna atar. Bazen tembelce başlatılmış, lateuygun olabilecek bir durumunuz 
vardır, ancak başlatmanın henüz gerçekleşip gerçekleşmediğini de 
söyleyebilmeniz gerekir.

lateDurumu bir değişkende saklayarak ve değişkenin ayarlanıp ayarlanmadığını 
izleyen ayrı bir boole alanına sahip olarak başlatmayı algılayabilmenize rağmen, 
bu gereksizdir çünkü Dart dahili olarak değişkenin başlatılmış durumunu korur 
late. lateBunun yerine, değişkeni non- ve null yapılabilir yapmak genellikle 
daha açıktır . Ardından, kontrol ederek değişkenin başlatılıp başlatılmadığını 
görebilirsiniz null.

Elbette null, değişken için geçerli bir başlatılmış değerse, ayrı bir boole 
alanına sahip olmak muhtemelen mantıklıdır.

Tür yükseltmeyi etkinleştirmek için yerel bir değişkene null yapılabilir bir 
alan atamayı DÜŞÜNÜN.

Null yapılabilir bir değişkenin eşit olmadığının kontrol edilmesi, 
nulldeğişkeni nullable olmayan bir türe yükseltir. Bu, değişkendeki üyelere 
erişmenize ve onu, null olmayan bir tür bekleyen işlevlere iletmenize olanak 
tanır. Ne yazık ki, yükseltme yalnızca yerel değişkenler ve parametreler için 
uygundur, bu nedenle alanlar ve üst düzey değişkenler yükseltilmez.

Bu soruna geçici bir çözüm bulmak için bir model, alanın değerini yerel bir 
değişkene atamaktır. Bu değişken üzerindeki boş denetimler ilerler, böylece 
onu boş bırakılamaz olarak güvenle değerlendirebilirsiniz.
*/
class Response {
  get url => null;

  get errorCode => null;

  get reason => null;
}

/// Good!
class UploadExceptionGood {
  final Response? response;

  UploadExceptionGood([this.response]);

  @override
  String toString() {
    final response = this.response;
    if (response != null) {
      return 'Could not complete upload to ${response.url} '
          '(error code ${response.errorCode}): ${response.reason}.';
    }

    return 'Could not upload (no response).';
  }
}
// Yerel bir değişkene atamak !, alanın veya üst düzey değişkenin kullanıldığı 
// her yeri kullanmaktan daha temiz ve güvenli olabilir:

/// Bad!
class UploadException {
  final Response? response;

  UploadException([this.response]);

  @override
  String toString() {
    if (response != null) {
      return 'Could not complete upload to ${response!.url} '
          '(error code ${response!.errorCode}): ${response!.reason}.';
    }

    return 'Could not upload (no response).';
  }
}
// Yerel bir değişken kullanırken dikkatli olun. Alana geri yazmanız 
// gerekiyorsa, bunun yerine yerel değişkene geri yazmadığınızdan emin olun. 
// (Yerel değişkeni yapmak bu finaltür hataları önleyebilir.) Ayrıca, yerel 
// hala kapsam içindeyken alan değişebilirse, yerelin eski bir değeri olabilir. 
// ! Bazen sahada kullanmak en iyisidir .
