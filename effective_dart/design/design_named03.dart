/*
Birincil amacı bir değer döndürmekse, bir işlev veya yöntem için bir isim veya 
zorunlu olmayan fiil cümlesini TERCİH edin.

Diğer çağrılabilir üyelerin birkaç yan etkisi vardır, ancak arayana yararlı bir 
sonuç verir. Üyenin bunu yapmak için hiçbir parametreye ihtiyacı yoksa, 
genellikle bir alıcı olmalıdır. Ancak bazen mantıksal bir “özellik” bazı 
parametrelere ihtiyaç duyar. Örneğin, elementAt()bir koleksiyondan bir veri 
parçası döndürür, ancak hangi veri parçasının döndürüleceğini bilmek için bir 
parametreye ihtiyacı vardır.

Bu, üyenin sözdizimsel olarak bir yöntem olduğu, ancak kavramsal olarak bir 
özellik olduğu ve üyenin ne döndürdüğünü açıklayan bir ifade kullanılarak bu 
şekilde adlandırılması gerektiği anlamına gelir.

good*
  var element = list.elementAt(3);
  var first = list.firstWhere(test);
  var char = string.codeUnitAt(4);

Bu kılavuz, öncekinden kasıtlı olarak daha yumuşaktır. Bazen bir yöntemin 
hiçbir yan etkisi yoktur, ancak yine de list.take() veya gibi bir fiil öbeği 
ile adlandırmak daha kolaydır string.split().  
*/
/*
Yaptığı işe dikkat çekmek istiyorsanız, bir işlev veya yöntem için zorunlu bir 
fiil cümlesi DÜŞÜNÜN.

Bir üye herhangi bir yan etkisi olmayan bir sonuç ürettiğinde, genellikle bir 
alıcı veya döndürdüğü sonucu açıklayan bir isim tümcesi adı olan bir yöntem 
olmalıdır. Ancak bazen bu sonucu elde etmek için gereken çalışma önemlidir. 
Çalışma zamanı hatalarına eğilimli olabilir veya ağ veya dosya G/Ç gibi ağır 
kaynakları kullanabilir. Bu gibi durumlarda, arayanın üyenin yaptığı iş 
hakkında düşünmesini istiyorsanız, üyeye o işi açıklayan bir fiil tümcesi 
adı verin.

good*
  var table = database.downloadData();
  var packageVersions = packageGraph.solveConstraints();

Yine de, bu kılavuzun önceki ikisinden daha yumuşak olduğunu unutmayın. Bir 
işlemin gerçekleştirdiği iş, genellikle arayanla ilgili olmayan bir uygulama 
ayrıntısıdır ve performans ve sağlamlık sınırları zamanla değişir. Çoğu zaman, 
üyelerinizi nasıl yaptıklarına göre değil, arayan için ne yaptıklarına 
göre adlandırın.
*/
/*
İle bir yöntem adı başlatmaktan KAÇININ get.
Çoğu durumda, yöntem getadından kaldırılmış bir alıcı olmalıdır. Örneğin, adlı 
bir yöntem yerine, adlı getBreakfastOrder() bir alıcı tanımlayın breakfastOrder.

Üyenin argüman aldığı veya bir alıcı için uygun olmadığı için bir yöntem olması 
gerekse bile, yine de kaçınmalısınız get. Önceki yönergelerin belirttiği gibi:

Basitçe bırakın getve arayanın çoğunlukla yöntemin döndürdüğü değeri umursadığı 
gibi bir isim tümcesi adı kullanın .breakfastOrder()

Arayan kişi yapılan işle ilgileniyorsa bir fiil tümcesi adı kullanın , ancak 
işi get, create, download, fetch, calculate, vb.'den daha kesin olarak 
tanımlayan bir fiil seçin .requestaggregate
*/
/*
to() Nesnenin durumunu yeni bir nesneye kopyalıyorsa bir yöntemi adlandırmayı 
TERCİH EDİN .

Dönüştürme yöntemi, alıcının hemen hemen tüm durumunun bir kopyasını içeren 
ancak genellikle farklı bir biçim veya temsilde yeni bir nesne döndüren 
yöntemdir. Çekirdek kitaplıkların, bu yöntemlerin toardından sonuç türüyle 
başlayarak adlandırıldığı bir kuralı vardır.

Bir dönüştürme yöntemi tanımlarsanız, bu kuralı takip etmeniz yararlı olacaktır.

good*
  list.toSet();
  stackTrace.toString();
  dateTime.toLocal();
*/
/*
as() Orijinal nesne tarafından desteklenen farklı bir temsil döndürüyorsa bir 
yöntemi adlandırmayı TERCİH edin.

Dönüştürme yöntemleri “anlık görüntüler”dir. Ortaya çıkan nesne, orijinal 
nesnenin durumunun kendi kopyasına sahiptir. Görünümleri döndüren başka 
dönüştürme benzeri yöntemler de vardır; bunlar yeni bir nesne sağlar, ancak bu 
nesne orijinaline geri döner. Orijinal nesnede daha sonra yapılan değişiklikler 
görünüme yansıtılır.

Takip etmeniz gereken temel kitaplık kuralı as().

good*
  var map = table.asMap();
  var list = bytes.asFloat32List();
  var future = subscription.asFuture();
*/
/*
Fonksiyonun veya yöntemin adındaki parametreleri açıklayan KAÇININ.
Kullanıcı argümanı çağrı sitesinde görecektir, bu nedenle genellikle 
okunabilirliğe adından da bahsetmek yardımcı olmaz.

good*
  list.add(element);
  map.remove(key);

bad*
  list.addElement(element)
  map.removeKey(key)

Bununla birlikte, farklı türler alan benzer şekilde adlandırılmış diğer 
yöntemlerden belirsizliğini gidermek için bir parametreden bahsetmek faydalı 
olabilir:

good*
  map.containsKey(key);
  map.containsValue(value);
*/
