/*
Runes and grapheme clusters

Runes ve grafik kümeleri
Dart'ta rünler , bir dizgenin Unicode kod noktalarını ortaya çıkarır. 
Unicode (genişletilmiş) grafik kümeleri olarak da bilinen, kullanıcı 
tarafından algılanan karakterleri görüntülemek veya değiştirmek için karakter 
paketini kullanabilirsiniz .

Unicode, dünyanın tüm yazı sistemlerinde kullanılan her harf, rakam ve sembol 
için benzersiz bir sayısal değer tanımlar. Dart dizesi UTF-16 kod birimlerinin 
bir dizisi olduğundan, bir dize içindeki Unicode kod noktalarını ifade etmek 
özel sözdizimi gerektirir. Bir Unicode kod noktasını ifade etmenin genel 
yolu \uXXXX, XXXX'in 4 basamaklı onaltılık bir değer olduğu 'dir. Örneğin, 
kalp karakteri (♥) \u2665. 4'ten fazla veya daha az onaltılık basamak belirtmek 
için değeri küme parantezleri içine yerleştirin. 
Örneğin, gülme emojisi (😆) \u{1f606}.

Tek tek Unicode karakterleri okumanız veya yazmanız gerekiyorsa characters, 
karakter paketi tarafından String üzerinde tanımlanan alıcıyı kullanın. 
Döndürülen Charactersnesne, bir dizi grafik kümesi olarak dizedir. 
API karakterlerinin kullanımına bir örnek:
*/
void main(List<String> args) {
  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
}
