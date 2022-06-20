/*
Defining Constants
In this lesson, you will learn how to define variables whose values can never 
be changed.

Giriş #
Bazen bir değişken yaratır ve değeri asla değiştirmemek amacıyla ona çok özel 
bir değer atarız. Programın başarılı bir şekilde çalışabilmesi için değişkenin 
değerinin ömrü boyunca aynı kalması büyük önem taşımaktadır. Böyle bir değişken 
oluşturmak için ve anahtar kelimeleri finalkullanılmalıdır const. finalNeye ve 
gerçekte yaptığımıza girmeden önce , derleme zamanı ve çalışma zamanıconst 
arasındaki farkı öğrenmemiz gerekir .


Derleme Zamanı ve Çalışma Zamanı #
Derleme zamanı ve çalışma zamanı, bir programın ömründeki farklı aşamalara 
atıfta bulunan programlama terimleridir. Bir program oluşturmak için önce 
bir miktar kaynak kodu yazarsınız. Kaynak kodu, programın nasıl çalışacağını 
tanımlar.

Derleme ve Derleme Zamanı #
Bilgisayarlar farklı programlama dillerinde yazdığımız kodu anlamıyor. 
Sadece bir dil biliyorlar: makine dili, 1'ler ve 0'lar . Kaynak kodun 
çalıştırılabilir olması için makine kodunda derlenmesi gerekir. Bu işleme 
derleme denir .

Artık derlemenin ne olduğunu bildiğimize göre, bunu temel alalım ve bir örnek 
üzerinden derleme zamanını öğrenelim.

Programlarımızda bazı değişkenleri başlangıç ​​değerleri ile inttanımlıyoruz . 
doubleProgramı çalıştırdığımızda bu değişkenler her zaman aynı başlangıç ​​
değerine sahip olacaktır. Bu değerler derleme sırasında sabittir . Bu tür 
şeylerin derleme zamanında düzeltildiği söylenir .

Değişkenleri Asla Değiştirme #
Değerleri değiştirilemeyen değişkenler oluşturmak için Dart, ve anahtar 
sözcüklerini finalsağlar const. varBir veri türünü veya kullanarak bir 
değişken bildirmek yerine finaland kullanırız const.

Her ikisine de ayrı ayrı bakalım.

# kullanmafinal
Son değişken (anahtar kelime kullanılarak oluşturulan bir değişken final), 
ilk kullanıldığı zaman başlatılır ve yalnızca bir kez ayarlanabilir. Başka bir 
deyişle, son değer çalışma zamanında bilinecektir .

kullanmaconst
Derleme zamanındakiconst değeri bildiğinizde, sabit bir değişken 
(anahtar kelime kullanılarak oluşturulan bir değişken ) oluşturulmalıdır . 
Son bir değişken gibi, sabit bir değişken de yalnızca bir kez ayarlanabilir

constİkisi arasındaki fark, kullanımı ve finalgenellikle daha karmaşık 
programlarda geldiği için burada belirgin olmayabilir . Bilmeniz gereken tek 
şey, hem finalve hem de constdeğişkenler yalnızca bir kez ayarlanabilirken, 
son değişkenler çalışma zamanında veya derleme zamanında ayarlanabilirken, 
const değişkenleri yalnızca derleme zamanında ayarlanabilir.

finalBir değişkenin bildirildiği ancak finalanahtar kelimeyi ile değiştirildiği 
ilk kod parçacığını çalıştırmayı deneyin const.

Bir hata almalısınız.

Şimdiye kadar öğrendiklerinizi test etmek için bu bölümü bir testle kapatalım.
*/
