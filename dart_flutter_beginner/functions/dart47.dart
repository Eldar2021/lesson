/*
Fonksiyon Çağırma
Bu dersimizde fonksiyon çağırma konusunu ele alacağız.

Basit Bir İşlev Çağrısı #
Bir işlevi kullanmak istediğinizde, çağrılarak çağrılması gerekir . Kullanıcı 
tanımlı bir işlevi, yerleşik bir işlevi çağırdığınız gibi çağırırsınız; 
adını ve ardından girişini arayarak (). Bir önceki derste tanımladığımız 
newPrint fonksiyon ve fonksiyonu çağıralım .sum

Dönüş değeri olan herhangi bir fonksiyonun dönüş değerini bir değişkende 
saklayacağız result.
*/
// Print the statement "Function Called"
void newPrint() {
  print("Function Called");
}

// Return the sum of two numbers
num sum(num x, num y) {
  return x + y;
}

main() {
  // Calling newPrint
  newPrint();

  //Calling sum
  var result = sum(5, 3);
  print(result);
}

/*
Yukarıdaki kod parçacığının 13. satırındanewPrint , karşılığında print olan 
işlevi çağırıyoruz Function Called.

16. satırda , onları toplayacak ve toplamlarını döndürecek olan işleve 
5 ve 3'ü geçiyoruz . Bu toplam daha sonra değerini 17. satıra yazdırdığımız 
sumd eğişkende saklanacaktır .result
*/
/*
Fonksiyonlar İçerisinde Fonksiyonları Çağırma #
Bazen, zaten var olan bir işlevin işlevselliğinin yeni bir işlevde gerekli 
olduğu bir durumla karşılaşırız. Kodu yeniden yazmak yerine, yazdığımız 
yenisinin gövdesindeki eski işlevi basitçe çağırabiliriz. Bu bir örnekle 
açıklığa kavuşturulacaktır.

Bize verilen bir sayının karesini veren bir fonksiyon yazalım.
*/
num square(num x) {
  return x * x;
}

main1() {
  // Driver Code
  var result = square(5);
  print(result);
}

/*
Şimdi iki sayının karelerinin toplamını alan bir fonksiyon yazmak istiyoruz. 
squareBunu yukarıda tanımladığımız fonksiyonu kullanarak yapmayı deneyelim .
*/
num squareSum(num x, num y) {
  return square(x) + square(y);
}

// Function to find the square of a number
num square1(num x) {
  return x * x;
}

// Function to find the sum of the squares of two numbers
num squareSum1(num x, num y) {
  return square(x) + square(y);
}

main4() {
  var result = squareSum(2, 5);
  print(result);
}
