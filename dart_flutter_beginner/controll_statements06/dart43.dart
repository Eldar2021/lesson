/*
break and continue
ara ve devam et
Bu derste break ve Continue ifadelerini kullanarak döngüler üzerinde 
nasıl daha fazla kontrol sahibi olacağımızı öğreneceğiz

breakAçıklama # _
breakbir döngüyü zamanından önce durdurmak için kullanılır. Dart bir ifade 
bulduğunda break, yinelemelerin tamamlanıp tamamlanmadığına bakılmaksızın 
döngüden çıkar.

Çoğunlukla koşullu bir ifadeyle kullanılır. Koşullara bağlı olarak, döngünün 
ya çıkması ya da çıkmaması gerekir.

For-looplar ile baktığımız örneğe benzer bir örneğe bakalım , burada bir 
tamsayı listemiz var ve listeden sadece çift tamsayıları yazdırmak istiyoruz. 
Ancak bu örnekte, yalnızca bir çift tamsayının ilk oluşumunun ne olduğunu 
bilmek istiyoruz.
*/
main() {
  var intList = [7,3,9,6,2,5,4];

  for(var element in intList){
    if(element % 2 == 0){
      print(element);
      break;
    }
  }
}
/*
forBu, döngülerle ilgili derste incelediğimiz örneğe çok benzer . Bu örnekte, 
listedeki her çift tamsayıyı yazdırmak istedik. Ancak bu örnekte breakkoşullu 
ifademize bir ifade ekledik. İlk çift tamsayı bulunduğunda, ififadenin koşulu 
olur ve bu da 6. ve 7.true satırın yürütülmesine neden olur . 7. satırda 
döngünün kırılmasını söylüyoruz, bu nedenle 2 ve 4 değil , yalnızca 6 sayısı 
yazdırılır .
*/

/*
continueAçıklama # _
continuehala yürütülecek kod satırları olup olmadığına bakılmaksızın, 
çalışan yinelemeyi atlamak ve bir sonrakine geçmek için kullanılır.

5 yıllık iş tecrübesine sahip şirketiniz için yeni bir çalışanı işe almaktan 
sorumlu olduğunuzu düşünün. Aday listesini gözden geçiriyorsunuz. 5 yıldan az 
deneyime sahip adaylar atlanırken, 5 yıldan fazla deneyime sahip adaylar 
mülakata çağrılır.

Adaylarımızın deneyimlerini bir liste halinde saklayacağız. İlk adayın deneyimi
dizin 0'da olacak , ikinci adayın deneyimi dizin 1'de olacak ve bu böyle 
devam edecek.

Hangi adayın mülakata çağrılması gerektiğini bize söyleyebilecek bir Dart kodu 
yazalım.
*/
main1() {
  var experience = [5,1,9,7,2,4];

  for(var index = 0; index < experience.length; index++){
    var candidateExperience = experience[index];
    if(candidateExperience < 5){
      continue;
    }
    print("Call candidate $index $candidateExperience for an interiew.");
  }
}
/*
Bir yinelemede değeri 5'tencandidateExperience küçükse , yukarıdaki kod 
parçacığının 7. satırı yürütülür ve bu, geçerli yinelemeyi atlar ve döngünün 
en üstüne geri döner. Bu nedenle, print ifadesi bu yinelemeler için asla 
yürütülmez.
*/
