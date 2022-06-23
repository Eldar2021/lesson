// https://ptyagicodecamp.github.io/dart-generators.html
/*
Dart Generators
Dart generator işlevleri, istek üzerine tembel bir şekilde değer dizisi 
oluşturmak için kullanılır. Bu tür değer dizisi, senkron veya asenkron olarak 
üretilebilir. Her iki senaryoyu da desteklemek için kullanılabilen iki tür 
yerleşik oluşturucu işlevi vardır:

Senkron Oluşturucu: Senkron üreteç işlevi, Yinelenebilir bir nesne döndürür. 
Bu, önce değerlerin üretildiği ve ardından işlev tarafından istek üzerine 
tembel bir şekilde döndürüldüğü anlamına gelir.

Yinelenebilir: Sırayla erişilebilen bir değerler topluluğu veya "öğeler".

terable: A collection of values, or "elements", that can be accessed 
sequentially.

Eşzamansız Oluşturucu: Eşzamansız oluşturucu işlevi, bir Akış nesnesi döndürür. 
Değer dizisi, kullanılabilir olduklarında talep üzerine oluşturulur.

Akış: Eşzamansız veri olaylarının kaynağı.

Jeneratör fonksiyonlarını bir örnek yardımıyla anlayalım. Jeneratör 
fonksiyonlarını kullanarak, örneğin 5'ten 0'a kadar belirli bir sayıdan 
başlayarak sayılar üreteceğiz. Bu sayı dizisini oluşturmak için her iki yolu 
da (asenkron ve senkron üreteçler) gözlemleyeceğiz.
*/
