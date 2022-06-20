/*
Haritalarla Çalışmak
Bu derste, bir haritanın bazı özellikleri ve yöntemleriyle tanışacaksınız.

Tıpkı listeler ve kümeler gibi, haritalar da ilişkili özelliklere ve yöntemlere 
sahip nesnelerdir. Aşağıda bunlardan bazılarına bir göz atalım.

Anahtar/Değer Çiftleri Ekleme #
Önceden bildirilmiş bir haritaya yeni bir anahtar/değer çifti eklemek için 
aşağıdaki sözdizimini kullanın:

numbersBir önceki derste açıkladığımız haritaya bazı anahtar/değer çiftleri 
ekleyelim .
*/

main() {
  var numbers = Map<int, String>();

  numbers[1] = 'one';
  numbers[2] = 'two';
  numbers[3] = 'three';

  print(numbers);
}

/*
Yukarıdaki kod parçacığında, öğesine 3 anahtar/değer çifti ekledik numbers.

Bir Haritadaki Çift Sayısını Bulma #
Listeler ve kümeler için tartıştığımız gibi , bir haritadaki anahtar/değer 
çiftlerinin sayısını bulmak için kullanılabilecek Mapbir 
özelliğe sahiptir.length

Genel sözdizimi aşağıdaki gibidir:
*/
main1() {
  var numbers = {1: 'one', 2: 'two', 3: 'three'};

  print(numbers.length);
}

/*
Bir Değere Erişim #
Bir anahtar sağlayarak, karşılık gelen değerine köşeli parantezler ( []) kullanarak erişebilirsiniz.

Genel sözdizimi aşağıdaki gibidir:
*/
main2() {
  var capitals = {
    'United States': 'Washington D.C.',
    'England': 'London',
    'China': 'Beijing',
    'Germany': 'Berlin',
    'Nigeria': 'Abuja',
    'Egypt': 'Cairo',
    'New Zealand': 'Wellington'
  };

  print(capitals['Germany']);
}

/*
Yukarıdaki kod parçacığında, anahtarla ilişkili değeri almak istiyoruz 
Germany. Değeri yazdırdığımızda Berlin, doğru değer olan görüntülenir.

Anahtar yoksa, nullkarşılığında alırsınız.
*/
main3() {
  var capitals = {    
    'United States' : 'Washington D.C.',
    'England' : 'London',
    'China' : 'Beijing',
    'Germany' : 'Berlin',
    'Nigeria' : 'Abuja',
    'Egypt' : 'Cairo',
    'New Zealand' : 'Wellington'
  };
              
  print(capitals['India']);  
}

/*
Bir Anahtarın Kontrol Edilmesi #
containsKeyYöntemi kullanarak bir haritanın bir anahtar içerip içermediğini 
kontrol edebilirsiniz .

Genel sözdizimi aşağıdaki gibidir:

svg görüntüleyici
Anahtar varsa, yöntem dönecek true, aksi takdirde dönecektir false.

Tüm Anahtarları ve Değerleri Alma #
Mapbelirli bir haritanın tüm anahtarlarına ve değerlerine erişmek için 
kullanılabilecek keysözellik ve özelliğe sahiptir .values

Genel sözdizimi aşağıdaki gibidir:
*/
main4() {
  var capitals = {
    'United States' : 'Washington D.C.',
    'England' : 'London',
    'China' : 'Beijing',
    'Germany' : 'Berlin',
    'Nigeria' : 'Abuja',
    'Egypt' : 'Cairo',
    'New Zealand' : 'Wellington'
   };

  // Retrieving all the keys 
  var allKeys = capitals.keys;    
  print("Keys: $allKeys");

  // Retrieving all the values
  var allValues = capitals.values;
  print("Values: $allValues");  
}

/*
Anahtar/Değer Çiftini Kaldırma #
Yöntem remove, bir haritadan bir anahtar/değer çiftini kaldırmak için 
kullanılabilir. Yönteme ilettiğiniz argüman, bir haritadan kaldırmak 
istediğiniz anahtar/değer çiftinin anahtarı olacaktır.

Genel sözdizimi aşağıdaki gibidir:

Şundan bir anahtar/değer çiftini kaldıralım capitals.
*/
main5() {
  var capitals = {    
    'United States' : 'Washington D.C.',
    'England' : 'London',
    'China' : 'Beijing',
    'Germany' : 'Berlin',
    'Nigeria' : 'Abuja',
    'Egypt' : 'Cairo',
    'New Zealand' : 'Wellington'
  };   
  
  // Removing a key-value pair
  capitals.remove('China'); 
              
  print(capitals);  
}
