/*
Opsiyonel Parametreler
Fonksiyonlara argüman geçişini bir seçenek olarak bırakmak istediğinizde, 
isteğe bağlı parametreleri kullanabilirsiniz. Bu derste, isteğe bağlı 
parametrelerle fonksiyonların nasıl bildirileceğini öğreneceğiz.
*/

main() {
  printer(75, s1: 'hello', s2: "Eldiyar");
}

printer(num n, {String? s1, required String s2}) {
  print(n);
  print(s1);
  print(s2);
}

/*
Konumsal Parametreler #
Bir dizi işlevin parametresini köşeli parantez ( []) içine almak, bunları 
isteğe bağlı parametreler olarak işaretler.

Sözdizimi aşağıdaki gibidir.

Bir işlevi çağırırken, tıpkı gerekli bir parametrede olduğu gibi, isteğe 
bağlı bir konumsal parametreyi iletiriz.

Aşağıdaki örnekte, bir zorunlu parametremiz ve iki isteğe bağlı 
parametremiz var.
*/

String mysteryMessage(String who, [String? what, String? where]){
  var message = '$who';
  if(what != null && where == null){
    message = '$message said $what';
  } else if (where != null){
    message = '$message said $what at $where';
  }
  return message;
}

main1() {
  var result = mysteryMessage('Billy', 'howdy');
  print(result);
}
/*
Konumsal ve adlandırılmış parametreler arasındaki temel farklardan birinin, 
konumsal parametreleri bildirildikleri sırayla kullanmanız gerektiği gerçeğinde 
yattığını belirtmek önemlidir. Yukarıdaki örnekte, kullanmadan 
where kullanamayız what. Ancak, adlandırılmış parametrelerde durum 
böyle değildir.
*/