/*
switch and case

Giriş #
Switch ifadesi , şuna benzer bir koşullu ifadedir if-else. caseBir ifadedeki 
koşullara benzer, anahtar kelime tarafından belirtilen farklı durum yan 
tümceleri vardır if-else. switchbir ifade alır ve bu ifadeye eşdeğer olan case 
yan tümcesi yürütülür.

switchifadelerin yalnızca veya döndürebilmesi ve yalnızca bu şekilde 
tanımlanabilmesi if-elsegerçeğinden farklıdır . Case yan tümceleri ise boole 
değerleriyle (tamsayılar, dizeler veya derleme zamanı sabitleri) sınırlı 
değildir. Ancak, vaka yan tümcelerinin ifadeyle aynı türde olduğundan 
emin olun. if true false

Örnek #
Aşağıdaki örneğimizde, bir command. Komutun değerine bağlı olarak, 
bir ifade yazdırılacaktır.
*/
main() {
  var command = 'OPEN';
  
  switch(command) {
    case 'CLOSED': 
      print('closed');
      break;
    case 'PENDING': 
      print('pending');
      break;
    case 'APPROVED': 
      print('approved');
      break; 
    case 'DENIED': 
      print('denied');
      break;   
    case 'OPEN':
      print('open');
      break;
    default:
      print('command unknown');
  }
}

/* 
Yukarıdaki kod parçasını çalıştırdığınızda çıktı görüntülenir open. 
Bunun nedeni command, iletilen switchdeğerinin değerine sahip olmasıdır OPEN. 
Bu, koşullu kodun olduğu 5. durum tarafından ele alınır print('open').
*/