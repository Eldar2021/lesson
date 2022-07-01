/*
Libraries

Baştaki alt çizgi karakteri ( _), bir üyenin kitaplığına özel olduğunu 
gösterir. Bu sadece bir gelenek değil, dilin kendisinde yerleşiktir.

TERCİH, beyanları özel yapmak.
Bir kitaplıkta (üst düzey veya bir sınıfta) genel bir bildirim, diğer 
kitaplıkların o üyeye erişebileceğinin ve erişmesi gerektiğinin bir işaretidir. 
Ayrıca, kitaplığınızın bunu desteklemesi ve gerçekleştiğinde düzgün davranması 
da bir taahhüttür.

Eğer niyetiniz bu değilse, biraz ekleyin _ve mutlu olun. Dar genel arayüzlerin 
bakımı sizin için daha kolay ve kullanıcıların öğrenmesi daha kolay. Güzel bir 
bonus olarak, analizör size kullanılmayan özel bildirimler hakkında bilgi 
verecektir, böylece ölü kodu silebilirsiniz. Üye herkese açıksa bunu yapamaz 
çünkü görüşü dışında herhangi bir kodun kullanıp kullanmadığını bilmiyor.
*/
/*
Aynı kütüphanede birden fazla sınıf ilan etmeyi DÜŞÜNÜN.
Java gibi bazı diller, dosyaların organizasyonunu sınıfların organizasyonuna 
bağlar; her dosya yalnızca tek bir üst düzey sınıfı tanımlayabilir. Dart'ın bu 
sınırlaması yoktur. Kütüphaneler, sınıflardan ayrı ayrı varlıklardır. Tek bir 
kitaplığın birden çok sınıf, üst düzey değişkenler ve bunların mantıksal olarak 
birbirine ait olması durumunda işlev içermesi gayet iyidir.

Birden çok sınıfı bir kitaplıkta bir araya getirmek, bazı yararlı kalıpları 
etkinleştirebilir. Dart'ta gizlilik, sınıf düzeyinde değil, kitaplık düzeyinde 
çalıştığından, bu, C++'daki gibi "arkadaş" sınıflarını tanımlamanın bir yoludur. 
Aynı kitaplıkta bildirilen her sınıf, birbirinin özel üyelerine erişebilir, 
ancak bu kitaplığın dışındaki kodlar erişemez.

Tabii ki, bu kılavuz, tüm sınıflarınızı büyük bir monolitik kitaplığa koymanız 
gerektiği anlamına gelmez , sadece tek bir kitaplığa birden fazla sınıf 
yerleştirmenize izin verilir.
*/
