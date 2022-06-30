/*
Effective Dart: Design
Kitaplıklar için tutarlı, kullanılabilir API'ler yazmaya yönelik bazı 
yönergeler aşağıda verilmiştir.
*/
/*
İsimler
Adlandırma, okunabilir, sürdürülebilir kod yazmanın önemli bir parçasıdır. 
Aşağıdaki en iyi uygulamalar, bu hedefe ulaşmanıza yardımcı olabilir.

Terimleri tutarlı bir şekilde KULLANIN.
Kodunuz boyunca aynı şey için aynı adı kullanın. API'nizin dışında, 
kullanıcıların bilmesinin muhtemel olduğu bir emsal zaten varsa, o emsali takip 
edin.

good*
  pageCount           // A field.
  updatePageCount()   // Consistent with pageCount.
  toSomething()       // Consistent with Iterable's toList().
  asSomething()       // Consistent with List's asMap().
  Point               // A familiar concept.

bad*
  renumberPages()       // Confusingly different from pageCount.
  convertToSomething()  // Inconsistent with toX() precedent.
  wrappedAsSomething()  // Inconsistent with asX() precedent.
  Cartesian             // Unfamiliar to most users.

Amaç, kullanıcının zaten bildiği şeylerden yararlanmaktır. Bu, sorun alanının 
kendisi, çekirdek kitaplıkların kuralları ve kendi API'nizin diğer bölümleri 
hakkındaki bilgilerini içerir. Bunların üzerine inşa ederek, üretken olmadan 
önce edinmeleri gereken yeni bilgi miktarını azaltırsınız.    
*/
/*
Kısaltmalardan KAÇININ.
Kısaltma, kısaltılmamış terimden daha yaygın değilse, kısaltma yapmayın. 
Kısaltma yaparsanız, doğru bir şekilde büyük harf yapın

good*
  pageCount
  buildRectangles
  IOStream
  HttpRequest

bad*
  numPages    // "Num" is an abbreviation of "number (of)".
  buildRects
  InputOutputStream
  HypertextTransferProtocolRequest  
*/
/*
En açıklayıcı ismi en sona koymayı TERCİH EDİN.
Son söz, şeyin ne olduğunu en açıklayıcı olmalıdır. Bir şeyi daha fazla 
açıklamak için sıfatlar gibi başka kelimelerle önek koyabilirsiniz.

good*
  pageCount               // A count (of pages).
  ConversionSink          // A sink for doing conversions.
  ChunkedConversionSink   // A ConversionSink that's chunked.
  CssFontFaceRule         // A rule for font faces in CSS.

bad*
  numPages                  // Not a collection of pages.
  CanvasRenderingContext2D  // Not a "2D".
  RuleFontFaceCss           // Not a CSS.  
*/
/*
Kodu bir cümle gibi okumayı düşünün.
Adlandırma konusunda şüpheye düştüğünüzde, API'nizi kullanan bir kod yazın ve 
onu bir cümle gibi okumaya çalışın.

good*
  // "If errors is empty..."
  if (errors.isEmpty) ...

  // "Hey, subscription, cancel!"
  subscription.cancel();

  // "Get the monsters where the monster has claws."
  monsters.where((monster) => monster.hasClaws);

bad*
  // Telling errors to empty itself, or asking if it is?
  if (errors.empty) ...

  // Toggle what? To what?
  subscription.toggle();

  // Filter the monsters with claws *out* or include *only* those?
  monsters.filter((monster) => monster.hasClaws); 

API'nizi denemek ve kodda kullanıldığında nasıl "okuduğunu" görmek yararlıdır, 
ancak çok ileri gidebilirsiniz. Adlarınızı dilbilgisi açısından doğru bir cümle 
gibi kelimenin tam anlamıyla okumaya zorlamak için makaleler ve konuşmanın 
diğer bölümlerini eklemek yararlı değildir.

bad*
  if (theCollectionOfErrors.isEmpty) ...

  monsters.producesANewSequenceWhereEach((monster) => monster.hasClaws);
*/
/*
Boole olmayan bir özellik veya değişken için bir isim öbeği TERCİH edin.

Okuyucu , mülkün ne olduğuna odaklanır . Kullanıcı bir özelliğin nasıl 
belirlendiğiyle daha fazla ilgileniyorsa, muhtemelen fiil öbeği adına sahip bir 
yöntem olmalıdır.

good*
  list.length
  context.lineWidth
  quest.rampagingSwampBeast

bad*
  list.deleteItems  
*/
