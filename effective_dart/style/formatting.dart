/*
Formatting
biçimlendirme
Birçok dilde olduğu gibi Dart da boşlukları yok sayar. Ancak, insanlar yapmaz. 
Tutarlı bir boşluk stiline sahip olmak, insan okuyucuların kodu derleyicinin 
gördüğü gibi görmesini sağlamaya yardımcı olur.

kullanarak kodunuzu biçimlendirin dart format.
Biçimlendirme sıkıcı bir iştir ve özellikle yeniden düzenleme sırasında zaman 
alıcıdır. Neyse ki, bunun için endişelenmenize gerek yok. Bunu sizin için yapan, 
adında gelişmiş bir otomatik kod biçimlendirici dart formatsağlıyoruz. 
Uyguladığı kurallarla ilgili bazı belgelerimiz var, ancak Dart için resmi boşluk 
işleme kuralları ne dart formatüretirse üretsin .

Kalan biçimlendirme yönergeleri, dart formatsizin için düzeltemeyeceğiniz 
birkaç şey içindir.

Daha biçimlendirici dostu hale getirmek için kodunuzu değiştirmeyi DÜŞÜNÜN.
Biçimlendirici, attığınız kod ne olursa olsun elinden gelenin en iyisini yapar, 
ancak mucizeler yaratamaz. Kodunuzda özellikle uzun tanımlayıcılar, 
derinlemesine iç içe ifadeler, farklı türde operatörlerin bir karışımı vb. 
varsa, biçimlendirilmiş çıktının okunması yine de zor olabilir.

Bu olduğunda, kodunuzu yeniden düzenleyin veya basitleştirin. Yerel bir değişken 
adını kısaltmayı veya bir ifadeyi yeni bir yerel değişkene yükseltmeyi düşünün. 
Diğer bir deyişle, kodu elle biçimlendiriyor ve daha okunaklı hale getirmeye 
çalışıyorsanız yapacağınız değişikliklerin aynısını yapın. dart formatGüzel 
kodlar üretmek için bazen yinelemeli olarak birlikte çalıştığınız bir ortaklık 
olarak düşünün .
*/
/*
80 karakterden uzun satırlardan KAÇININ.

Okunabilirlik çalışmaları, bir sonraki satırın başına geçerken gözünüzün daha 
uzağa gitmesi gerektiğinden uzun metin satırlarını okumanın daha zor olduğunu 
göstermektedir. Bu nedenle gazeteler ve dergiler birden çok metin sütunu 
kullanır.

Kendinizi gerçekten 80 karakterden uzun satırlar isterken buluyorsanız, 
deneyimlerimize göre kodunuz muhtemelen çok ayrıntılıdır ve biraz daha kompakt 
olabilir. Esas suçlu genellikle VeryLongCamelCaseClassNames. Kendinize şu 
soruyu sorun: "Bu türdeki her sözcük bana kritik bir şey mi söylüyor yoksa bir 
ad çakışmasını mı önlüyor?" Değilse, atlamayı düşünün.

Bunun dart formatsizin için %99'unu yaptığını, ancak son %1'in siz olduğunuzu 
unutmayın. Uzun dize değişmezlerini 80 sütuna sığacak şekilde bölmez, bu 
nedenle bunu manuel olarak yapmanız gerekir.

İstisna: Bir yorumda veya dizede bir URI veya dosya yolu oluştuğunda 
(genellikle bir içe veya dışa aktarma işleminde), satırın 80 karakterin üzerine 
çıkmasına neden olsa bile bütün kalabilir. Bu, bir yol için kaynak dosyaları 
aramayı kolaylaştırır.

İstisna: Çok satırlı dizeler 80 karakterden uzun satırlar içerebilir, çünkü 
yeni satırlar dize içinde önemlidir ve satırları daha kısa olanlara bölmek 
programı değiştirebilir.

Tüm akış kontrol ifadeleri için küme parantezleri kullanın.
Bunu yapmak, sarkan başka sorunu önler.

  good*
    if (isWeekDay) {
      print('Bike to work!');
    } else {
      print('Go dancing or read a book!');
    }

İstisna: Yan tümce içermeyen bir ifdeyiminiz varsa elseve tüm ifdeyim bir 
satıra sığıyorsa, isterseniz kaşlı ayraçları atlayabilirsiniz:

  good*
    if (arg == null) return defaultValue;  

Gövde bir sonraki satıra sarılırsa, parantez kullanın:

  good*
    if (overflowChars != other.overflowChars) {
      return overflowChars < other.overflowChars;
    }

  bad*
    if (overflowChars != other.overflowChars)
      return overflowChars < other.overflowChars;  
*/
