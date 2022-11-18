// https://gist.github.com/staltz/868e7e9bc2a7b8c1f754#reactive-programming-is-programming-with-asynchronous-data-streams
// https://www.bayramucuncu.com/reaktif-programlama-reactive-programming/
// https://github.com/flutterturkey/flutter-rehberi
/*
"Реактивдүү программалоо деген эмне?"
Интернетте көптөгөн жаман түшүндүрмөлөр жана аныктамалар бар. Wikipedia адаттагыдай өтө жалпы жана теориялык. 
Stackoverflow'тун канондук жообу жаңы келгендер үчүн ылайыктуу эмес. Реактивдүү Манифест сиздин долбоордун 
менеджериңизге же компанияңыздагы бизнесмендерге көрсөткөн нерседей угулат. Майкрософттун Rx терминологиясы 
"Rx = Observables + LINQ + Schedulers" ушунчалык оор жана Microsoftтук болгондуктан, көпчүлүгүбүз чаташып 
калабыз. "Реактивдүү" жана "өзгөрүүнү жайылтуу" сыяктуу терминдер сиздин кадимки MV* жана сүйүктүү 
тилиңизден өзгөчө эч кандай айырманы билдирбейт. Албетте, менин алкактык көз караштарым моделдерге жооп 
берет. Албетте, өзгөртүү жайылтылат. Андай болбосо,

Ошентип, келгиле, шылуундарды кыскарталы.

Реактивдүү программалоо – бул асинхрондук маалымат агымдары менен программалоо.
Мындайча айтканда, бул жаңы нерсе эмес. Окуя автобустары же сиздин типтүү чыкылдатуу окуяларыңыз чындыгында 
асинхрондук окуялар агымы болуп саналат, анда сиз байкап, кээ бир терс таасирлерди жасай аласыз. Реактивдүү бул 
стероиддер боюнча идея. Сиз жөн гана чыкылдатуу жана ачуучу окуялардан эмес, бардык нерселер боюнча маалымат 
агымдарын түзө аласыз. Агымдар арзан жана бардык жерде жеткиликтүү, бардыгы агым болушу мүмкүн: өзгөрмөлөр, 
колдонуучунун киргизүүлөрү, касиеттери, кэштери, маалымат структуралары, ж.б. Мисалы, сиздин Twitter каналыңыз 
чыкылдатуу окуялары сыяктуу эле маалымат агымы болорун элестетиңиз. Сиз ошол агымды угуп, ошого жараша жооп бере 
аласыз.

Анын үстүнө, сизге ошол агымдардын каалаганын бириктирүү, түзүү жана чыпкалоо үчүн укмуштуудай функциялар кутусу 
берилет. "Функционалдуу" сыйкыр дал ушул жерден башталат. Агымды башкасына киргизүү катары колдонсо болот. 
Ал тургай, бир нече агым башка агымга киргизүү катары колдонулушу мүмкүн. Сиз эки агымды бириктире аласыз. 
Сиз агымды чыпкалап , сизди кызыктырган окуялар гана камтылган башкасын алуу үчүн чыпкалай аласыз. Бир агымдан 
башка жаңысына берилиштердин маанилерин картага түшүрө аласыз.
*/
/*
Reaktif Programlama Nedir?
Reaktif programlama, asenkron veri akışlarıyla işlemler yapmayı 
ilke edinen bir programlama paradigmasıdır.


Asenkron Prensip
Reaktif programlamada her şey asenkron olarak, yani eş zamanlı olmadan çalışır. Yani bir işlem adımının 
yürütülebilmesi için başka işlemlerin sonucu beklenmek zorunda değildir. Çalışma zamanında, asenkron bir 
işlem yürüten kod satırı çalıştırıldıktan sonra, işlemin bitmesi beklenmeden diğer satırdaki işlemler 
yürütülebilir. Multithread işlemler yürütebilen sistemlerde asenkron yürütülecek olan işlemler, farklı 
thread’ler tarafından da yapılabilir.


Neden Asenkron çalışmalara ihtiyaç duyulur?
Programlamada asenkron çalışma ihtiyacı, uygulamaları daha duyarlı hale getirmek amacıyla kullanılır. 
Asenkron işlemler genellikle uzun zaman alan işlemlerdir. Bu nedenle ana uygulama bir görevi yürütürken, 
kilitlenme ve donma diye tabir edilen yavaşlamaları kullanıcıya yansıtmadan, sorunsuz bir kullanıcı 
deneyimi sunmayı sağlar. Asenkron işlemler dış kaynaktan bir veriyi almak olabileceği gibi yerelde 
uzun hesaplama gerektiren işlemler de olabilir.


Reaktif Programlamanın Püf Noktaları
Reaktif programlamada üç temel yapı taşından bahsedebiliriz.

1- Veri akışları (Data Streams)
Reaktif programlamada veri akışları, işin omurgasını oluşturmaktadır. Veriler bir kaynak tarafından 
oluşturulup başka bir kaynak tarafından tüketilir. Bütün olaylar, mesajlar, hatalar akışlar tarafından 
yayılma (emitting) yoluyla bildirilir.

2- Observable Pattern
Reaktif programlamada veri akışları gözlenebilir olarak tasarladığından dolayı, akıştan bir bildirim 
yapıldığında buna tepki verilebilmektedir. Gözlemlenebilir olan veri akışı nesneleri Observable olarak 
adlandırılırken, akışta gerçekleşen olaylara tepki veren nesneler Observer olarak adlandırılır.
Observable: Reaktif bir sistemde gözlenebilir olan şey veri akışıdır.
Observer: Observable tarafından yayınlanan veri akışlarını yakalar ve kullanır. Observer nesneleri bunu 
yapabilmek için Observable nesnesine abone (subscribe) olur.
Gözlemlenebilir bir veri akışını herhangi bir işlemden elde etmek mümkündür. Örneğin HTTP talepleri, 
form tıklama olayları, bildirimler, değişkenlerde meydana gelen değişiklikler, sensörlerden alınan değerler. 
Kısacası bir durum değişimi bildiren herhangi bir şey olabilir.

3- Fonksiyonel Programlama (Functional Programming)
Veri akışlarını yönetebilmek için uygulanan yöntem fonksiyonların kullanılmasıdır. Bir veri akışından 
elde edilen verilerin belli bir dönüşümden geçirilerek kullanılması için bir veya birden fazla fonksiyona 
ihtiyaç duyulabilir.


ReactiveX (Reactive eXtensions)
Reaktif programlama için kullanılan en popüler API ReaxtiveX ya da kısa adıyla Rx’dir. 
(“X” harfi Extensions için kullanılan bir kısaltmadır). Bu eklenti, reaktif programlama ilkelerinin bir 
uygulamasıdır. ReactiveX resmi sitesinde ReaxtiveX’in bir API’den ziyade, diğer programlama dillerine de 
ilham veren bir devrim, bir fikir ve programlamada bir akım olduğu belirtilmektedir.

ReaxtiveX kütüphanelerini kullanarak, aşağıdaki programlama dillerine reaktif özellikler katılabilmektedir.
Java: RxJava
JavaScript: RxJS
C#: Rx.NET
C#(Unity): UniRx
Scala: RxScala
Clojure: RxClojure
C++: RxCpp
Lua: RxLua
Ruby: Rx.rb
Python: RxPY
Go: RxGo
Groovy: RxGroovy
JRuby: RxJRuby
Kotlin: RxKotlin
Swift: RxSwift
PHP: RxPHP
Elixir: reaxive
Dart: RxDart
*/
