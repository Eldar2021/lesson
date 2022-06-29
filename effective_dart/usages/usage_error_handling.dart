/*
Error handling

Dart, programınızda bir hata oluştuğunda istisnalar kullanır. Aşağıdaki en iyi 
uygulamalar, istisnaları yakalamak ve atmak için geçerlidir.

KAÇININ onyan tümceler olmadan yakalar.

Niteleyici içermeyen bir catch yan tümcesi , try bloğundaki kod tarafından 
atılan her şeyion yakalar . Pokémon istisna işleme , büyük olasılıkla 
istediğiniz gibi değildir. Kodunuz StackOverflowError veya OutOfMemoryError 
öğelerini doğru şekilde işliyor mu? Bu try bloğundaki bir yönteme yanlış 
argümanı yanlış bir şekilde iletirseniz, hata ayıklayıcınızın sizi hataya 
yönlendirmesini mi istersiniz yoksa bu yararlı ArgumentError'ın yutulmasını mı 
tercih edersiniz? Atılan AssertionError s'yi yakaladığınızdan, bu kodun 
içindeki herhangi bir ifadenin etkin bir şekilde kaybolmasını istiyor musunuz
? assert()

Cevap muhtemelen “hayır”dır, bu durumda yakaladığınız türleri filtrelemeniz 
gerekir. Çoğu durumda, sizi onfarkında olduğunuz ve doğru bir şekilde ele 
aldığınız çalışma zamanı hataları türleriyle sınırlayan bir yan tümceniz 
olmalıdır.

Nadir durumlarda, herhangi bir çalışma zamanı hatasını yakalamak 
isteyebilirsiniz. Bu genellikle, rastgele uygulama kodunu sorunlara neden 
olmaktan yalıtmaya çalışan çerçeve veya düşük seviyeli koddadır. Burada bile, 
tüm türleri yakalamaktansa İstisna'yı yakalamak genellikle daha iyidir. 
İstisna, tüm çalışma zamanı hataları için temel sınıftır ve koddaki programatik 
hataları gösteren hataları hariç tutar .
*/
/*
Cümlesiz yakalamalardan kaynaklanan hataları atmayın on.
Bir kod bölgesinden atılabilecek her şeyi gerçekten yakalamanız gerektiğini 
düşünüyorsanız, yakaladığınız şeyle bir şeyler yapın. Günlüğe kaydedin, 
kullanıcıya gösterin veya yeniden atın, ancak sessizce atmayın.

Error Yalnızca programatik hatalar için uygulanan nesneleri fırlatın.
Error sınıfı , programatik hatalar için temel sınıftır . Bu türden bir nesne 
veya ArgumentError gibi alt arayüzlerinden biri atıldığında, kodunuzda bir hata 
var demektir . API'niz bir arayana yanlış kullanıldığını bildirmek istediğinde 
bir Hata atmak bu sinyali net bir şekilde gönderir.

Tersine, istisna, kodda bir hatayı göstermeyen bir tür çalışma zamanı 
hatasıysa, o zaman bir Hata atmak yanıltıcıdır. Bunun yerine, temel İstisna 
sınıflarından birini veya başka bir türü atın.

Açıkça YAKALAMAYIN Errorveya onu uygulayan türleri.

Bu, yukarıdakilerden kaynaklanmaktadır. Hata, kodunuzdaki bir hatayı 
gösterdiğinden, tüm çağrı yığınını çözmeli, programı durdurmalı ve hatayı 
bulup düzeltebilmeniz için bir yığın izi yazdırmalıdır.

Bu türdeki hataları yakalamak, hatayı işleyen ve maskeleyen kesintileri ortadan 
kaldırır. Olgudan sonra bu istisna ile başa çıkmak için hata işleme kodu 
eklemek yerine, geri dönün ve ilk etapta atılmasına neden olan kodu düzeltin.
*/
/*
rethrow Yakalanan bir istisnayı yeniden oluşturmak için DO kullanın.

Bir istisnayı yeniden oluşturmaya karar verirseniz rethrow, aynı istisna 
nesnesini kullanarak atmak yerine ifadeyi kullanmayı tercih edin throw. 
rethrow istisnanın orijinal yığın izini korur. throw diğer yandan yığın izini 
son atılan konuma sıfırlar.
*/

void handle(Object e) {}

bool canHandle(Object e) => true;

void somethingRisky() {}

/// Bad!
void some() {
  try {
    somethingRisky();
  } catch (e) {
    if (!canHandle(e)) throw e;
    handle(e);
  }
}

/// Good!
void some1() {
  try {
    somethingRisky();
  } catch (e) {
    if (!canHandle(e)) rethrow;
    handle(e);
  }
}
