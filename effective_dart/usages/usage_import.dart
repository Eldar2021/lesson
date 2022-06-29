/*
Effective Dart: Usage
Bu yönergeleri her gün Dart kodunuzun gövdelerinde kullanabilirsiniz. 
Kitaplığınızın kullanıcıları , buradaki fikirleri içselleştirdiğinizi 
söyleyemeyebilir, ancak bunun koruyucuları kesinlikle olacaktır.

kütüphaneler
Bu yönergeler, programınızı birden çok dosyadan tutarlı ve sürdürülebilir bir 
şekilde oluşturmanıza yardımcı olur. Bu yönergeleri kısa tutmak için, kapsam 
importve exportyönergeler için "içe aktarma" kullanırlar. Yönergeler her ikisi 
için de eşit olarak geçerlidir.

part ofDirektiflerde dizeleri KULLANIN.
Birçok Dart geliştiricisi parttamamen kullanmaktan kaçınır. Her kitaplık tek 
bir dosya olduğunda, kodları hakkında akıl yürütmeyi daha kolay bulurlar. 
partBir kitaplığın bir bölümünü başka bir dosyaya bölmek için kullanmayı 
seçerseniz , Dart diğer dosyanın hangi kitaplığın parçası olduğunu belirtmesini 
ister. Eski nedenlerden dolayı Dart, bu yönergenin parçası olduğu kitaplığın 
adınıpart of kullanmasına izin verir. Bu, araçların ana kitaplık dosyasını 
fiziksel olarak bulmasını zorlaştırır ve parçanın gerçekte hangi kitaplığın 
parçası olduğunu belirsiz hale getirebilir.

Tercih edilen modern sözdizimi, tıpkı diğer yönergelerde kullandığınız gibi, 
doğrudan kitaplık dosyasına işaret eden bir URI dizesi kullanmaktır. Bazı 
kitaplığınız varsa, şunları my_library.dartiçerir:

library my_library;

part 'some/other/file.dart';

O zaman parça dosyası şöyle görünmelidir:

good*
  part of '../../my_library.dart';

Ve yok:

bad*
  part of my_library;
*/
/*
src Başka bir paketin dizini içindeki kitaplıkları içe aktarmayın .
Linter kuralı: application_imports

src Altındaki dizin , paketin kendi uygulamasına özel kitaplıkları içerecek lib 
şekilde belirtilmiştir . Paket bakımcılarının paketlerini sürümlendirme şekli 
bu kuralı dikkate alır. srcPakette önemli bir değişiklik olmadan , kodda 
kapsamlı değişiklikler yapmakta özgürdürler

Bu, başka bir paketin özel kitaplığını içe aktarırsanız, o paketin küçük, 
teorik olarak kırılma noktası olmayan bir sürümünün kodunuzu kırabileceği 
anlamına gelir.

Bir içe aktarma yolunun içine veya dışına erişmesine izin VERMEYİN lib.

İçe aktarma , paketin bilgisayarınızda nerede depolandığı konusunda 
endişelenmenize gerek kalmadan bir paketin dizini içindeki bir package: 
kitaplığa erişmenizi sağlar . Bunun çalışması için, diğer dosyalara göre diskte 
bir konumda olmasını libgerektiren içe aktarma işlemlerine sahip olamazsınız. 
libBaşka bir deyişle, içerideki bir dosyadaki göreli içe aktarma yolu, dizinin 
lib dışındaki bir dosyaya ulaşamaz ve erişemez ve dışarıdaki libbir kitaplık, 
dizine libulaşmak için göreli bir yol kullanamaz lib. Her ikisini de yapmak 
kafa karıştırıcı hatalara ve bozuk programlara yol açar.

Örneğin, dizin yapınızın şöyle göründüğünü söyleyin:

my_package
└─ lib
   └─ api.dart
   test
   └─ api_test.dart

bad*
  import 'package:my_package/api.dart';
  import '../lib/api.dart'; 

Dart, bunların tamamen alakasız iki kitaplığın ithalatı olduğunu düşünüyor. 
Dart ile kendinizi karıştırmamak için şu iki kuralı izleyin:

  İçe aktarma yollarında kullanmayın /lib/.
  ../Dizinden kaçmak için kullanmayın lib.

libBunun yerine, bir paketin dizinine (aynı paketin testdizininden veya başka 
herhangi bir üst düzey dizinden bile) erişmeniz gerektiğinde , bir package:içe 
aktarma kullanın.

good*
  import 'package:my_package/api.dart';

Bir paket asla kendi dizininden dışarılib çıkmamalı ve paketteki diğer 
yerlerden kitaplıkları almamalıdır.  
*/
/*
Göreceli içe aktarma yollarını TERCİH edin.

Bir önceki kural devreye girmediğinde, bunu takip edin. Bir içe aktarma 
'a ulaşmadığında , libgöreli içe aktarmaları kullanmayı tercih edin. Daha 
kısalar. Örneğin, dizin yapınızın şöyle göründüğünü söyleyin:

my_package
└─ lib
   ├─ src
   │  └─ stuff.dart
   │  └─ utils.dart
   └─ api.dart
   test
   │─ api_test.dart
   └─ test_utils.dart

Çeşitli kitaplıkların birbirini nasıl içe aktarması gerektiği aşağıda 
açıklanmıştır:

lib/api.dart:
good*
  import 'src/stuff.dart';
  import 'src/utils.dart';

lib/src/utils.dart
good*
  import '../api.dart';
  import 'stuff.dart';

test/api_test.dart:
good*
  import 'package:my_package/api.dart'; // Don't reach into 'lib'.
  import 'test_utils.dart'; // Relative within 'test' is fine.  
*/
