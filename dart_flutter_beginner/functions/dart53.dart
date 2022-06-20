/*
forEachYöntem # _
forEachDart, işlevimize benzer işlevselliğe sahip yerleşik bir yönteme 
sahiptir forAll. forEachtek bir tür parametresine sahiptir Functionve bir 
koleksiyon türünde çağrılır. Aktarılan işlevin işlevselliği , çağrılan 
forEachher öğeye uygulanır . forEachAncak, ilettiğiniz işlevin bir dönüş 
değeri olmamalıdır, yani olmalıdır void.

Aşağıdaki kod parçacığında, yerleşik printyöntemi forEachbir tamsayı 
listesine aktarıyor ve onu çağırıyoruz.
*/
main() {
  var tester = [1,2,3];
  tester.forEach(print);
}
/*
Uzaklaştır #
Fonksiyonları birinci sınıf değerler olarak ele alarak çok daha kısa kodlar 
yazabilir ve kolay ölçeklenebilirlik sağlayabiliriz.

Bir listedeki her öğeyi tek tek faktör işlevine geçirmeniz gerektiğini 
hayal edin. Listedeki değerler değiştiğinde, kodunuzu kapsamlı bir şekilde 
değiştirmeniz gerekecektir. Ancak, forAllfonksiyonumuzla, değiştirilmesi 
gereken tek şeyin listenin adı olduğu bir kod satırı yazmamız yeterlidir.
*/