/*

Veri tipleri
Bu derste Dart'taki farklı veri türlerini öğreneceğiz.

Veri Türleri Nelerdir? #
Bir öğenin veya değişkenin veri türü, o değişkenin ne tür verilere sahip 
olabileceğini bize söyleyen bir niteliktir. Bu, bir önceki derste kutularımızda 
hangi tür eşyaların saklanabileceğini belirttiğimize benzer .

Veri türleri her yerde bulunabilir; paylaştıkları benzer özelliklere göre 
sınıflandırılan sayılar, alfabeler veya karakterler.

Dart'ın Yerleşik Veri Türleri #
Dart dili aşağıdaki türler için özel desteğe sahiptir:

Numbers
Strings
Booleans
Lists
Sets
Maps
Runes
Symbols


Bu bölümün odak noktası sayılar, diziler ve booleanlar olacaktır. Listeler, 
kümeler ve haritalar başka bir bölümün konularıdır. Runes ve semboller bu 
kursun kapsamı dışındadır.

Her bir veri türüne ayrıntılı olarak geçmeden önce, aşina olmanız gereken 
birkaç şey var.

Values and References#
Veri türleri genel olarak iki kategoriye ayrılabilir:

Referans türü
Değer türü

Bir değer türü tarafından sağlanan bilgi, değerin kendisidir. Bir referans 
türü için, sağladığı bilgi bir nesneye referanstır , yani bir nesnenin 
depolandığı yerin hafıza adresi . Bunu daha açık hale getirmek için, buna 
fiziksel nesneler kullanarak bakalım.

Elinizde bir kağıt parçası olduğunu hayal edin. Kağıdın adınız gibi bazı 
bilgileri tutmasını istiyorsunuz. Adınızı kağıda yazabilirsiniz; bu nedenle, 
kağıdın değeri sağladığı bilgilerle aynıdır. Bu, değer türüne bir örnektir. 
Birisi adınızı bilmek isterse, tek yapmaları gereken gazeteyi okumaktır.

Şimdi hayal edin, kağıdın evinizi tutmasını istiyorsunuz. Bu fiziksel olarak 
mümkün değil, bu yüzden evinizin adresini yazarsınız, bu nedenle kağıdın değeri 
gerekli bilgilere referanstır. Bu, bir referans türü örneğidir . Birisi evinize 
gitmek isterse, önce kağıttaki adresi okumalı ve ardından evinizin tarifini 
almalıdır.

Aynı şekilde, bir referans türü değerin bellek adres konumunu tutarken, değer 
türleri değeri kendileri tutar.

a = "eldi"
g= "eldi"
b = "el"
b= b+"di"
# c= b+"di"

print(id(a))
print(id(g))
print(id(b))

Veri Tipleri Nesnelerdir #
Çoğu dilde, ilkel veri türleri değer türleridir, ancak Dart'ta tüm veri türleri 
nesnelerdir. Bu, ilkel veri türlerinin bile referans türleri olduğu anlamına 
gelir. Bu nedenle, Dart'ta değişkenlerin özellikle referansları sakladığını ve 
nesnelere atıfta bulunduğunu söyleyebiliriz.


Varsayılan Değer #
Başlatılmamış değişkenlerin başlangıç ​​değeri null. Sayısal türlere sahip 
değişkenler bile, başlangıçta nullsayıların - Dart'taki diğer her şey 
gibi - nesneler olması nedeniyledir. nullbasitçe, değişkenin bir nesneye 
gönderme yapmadığı anlamına gelir; hiçbir şeye atıfta bulunmuyor.

Aşağıdaki kod parçasında bir değişkeni notInitializedbaşlatmadan oluşturuyoruz. 
değerini yazdırmaya çalıştığımızda çıktı olarak notInitializedalırız null.
*/
main() {
    int? notInitialized;
    print(notInitialized);
}

/*
Literals#
değişmezler

Kurs boyunca literal kelimesini kullanacağız , bu yüzden literal'in gerçekte 
ne olduğuna daha yakından bakalım.

Bir hazır bilgi, herhangi bir şeyi en olağan ve temel anlamıyla almak olarak 
tanımlanır. Bunu bilgisayar programlamayla eşleştirerek, sabit değerler, 
kaynak kodunda olduğu gibi doğrudan görünen sabit değerlerdir. Örneğin, 
“Merhaba Dünya”, 5 ve 'A' tamamen değişmezdir.
*/
