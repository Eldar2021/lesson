/*
Data Enumeration in Dart
Dart'ta Veri Numaralandırma

Numaralandırılmış türler 
(ayrıca numaralandırma veya numaralandırma olarak da bilinir ) öncelikle 
adlandırılmış sabit değerleri tanımlamak için kullanılır. Enum anahtar sözcüğü, 
Dart'ta bir numaralandırma türü tanımlamak için kullanılır. Numaralandırmanın 
kullanım durumu, sonlu veri üyelerini aynı tip tanımı altında depolamaktır.

Sözdizimi:
enum değişken_adı{
  // Veri üyelerini gösterildiği gibi ekleyin
  üye1, üye2, üye3, ...., üyeN
}
*/
// dart program to print all the
// elements from the enum data class
 
// Creating enum with name Gfg
enum Gfg {
   
  // Inserting data
  Welcome, to, GeeksForGeeks
}
 
void main() {
   
  // Printing the value
  // present in the Gfg
  for (Gfg geek in Gfg.values) {
    print(geek);
  }

   var geek = Gfg.GeeksForGeeks;
   
  // Switch-case
  switch(geek) {
    case Gfg.Welcome: print("This is not the correct case.");
    break;
    case Gfg.to: print("This is not the correct case.");
    break;
    case Gfg.GeeksForGeeks: print("This is the correct case.");
    break;
  }
}
