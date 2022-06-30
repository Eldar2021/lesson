/*
Bir boole özelliği veya değişkeni için zorunlu olmayan bir fiil tümcesini 
TERCİH edin.

Boole adları genellikle kontrol akışında koşullar olarak kullanılır, bu nedenle 
orada iyi okunan bir ad istersiniz. Karşılaştırmak:

if (window.closeable) ...  // Adjective.
if (window.canClose) ...   // Verb.

İyi isimler birkaç fiil türünden biriyle başlama eğilimindedir:

  bir "olmak" biçimi: isEnabled, wasShown, willFire. Bunlar, şimdiye kadar en 
  yaygın olanlarıdır.

  yardımcı fiil : hasElements, canClose, shouldConsume, mustSave.

  aktif fiil: ignoresInput, wroteFile. Bunlar nadirdir çünkü genellikle 
  belirsizdirler. loggedResult kötü bir isim çünkü "sonucun günlüğe kaydedilip 
  kaydedilmediği" veya "kaydedilen sonuç" anlamına gelebilir. Aynı şekilde, 
  closingConnection “bağlantının kapanıp kapanmadığı” veya “kapanmakta olan 
  bağlantı” olabilir. Etkin fiillere, ad yalnızca yüklem olarak okunabildiğinde 
  izin verilir.

Tüm bu fiil öbeklerini yöntem adlarından ayıran şey, bunların zorunlu 
olmamasıdır . Bir boole adı asla nesneye bir şey yapmasını söyleyen bir komut 
gibi ses çıkarmamalıdır, çünkü bir özelliğe erişmek nesneyi değiştirmez. 
(Özellik, nesneyi anlamlı bir şekilde değiştiriyorsa, bu bir yöntem olmalıdır.)

goog*
  isEmpty
  hasElements
  canClose
  closesWindow
  canShowPopup
  hasShownPopup

bad*
  empty         // Adjective or verb?
  withElements  // Sounds like it might hold elements.
  closeable     // Sounds like an interface.
                // "canClose" reads better as a sentence.
  closingWindow // Returns a bool or a window?
  showPopup     // Sounds like it shows the popup.  
*/
/*
Adlandırılmış bir boole parametresi için fiili çıkarmayı DÜŞÜNÜN.

Bu, önceki kuralı iyileştirir. Boole olan adlandırılmış parametreler için, ad 
genellikle fiil olmadan da nettir ve kod çağrı sitesinde daha iyi okunur.

good*
  Isolate.spawn(entryPoint, message, paused: false);
  var copy = List.from(elements, growable: true);
  var regExp = RegExp(pattern, caseSensitive: false);

Bir boole özelliği veya değişkeni için "pozitif" adı TERCİH EDİN.

Boolean adlarının çoğu kavramsal olarak "olumlu" ve "olumsuz" biçimlere 
sahiptir; burada birincisi temel kavram gibi hisseder ve ikincisi onun 
olumsuzlamasıdır—"açık" ve "kapalı", "etkin" ve "devre dışı", vb. Genellikle 
ikinci ad kelimenin tam anlamıyla birincisini reddeden bir önek vardır: 
“görünür” ve “görünürde” , “bağlı” ve “ bağlantısız”, “ sıfır ” ve “sıfır 
olmayan”.

trueTemsil eden iki durumdan hangisini ve dolayısıyla mülkün adının verildiğini 
seçerken , olumlu veya daha temel olanı tercih edin. Boole üyeleri, olumsuzlama 
işleçleri de dahil olmak üzere genellikle mantıksal ifadelerin içine 
yerleştirilmiştir. Mülkünüzün kendisi bir olumsuzlama gibi görünüyorsa, 
okuyucunun çift olumsuzlamayı zihinsel olarak gerçekleştirmesi ve kodun ne 
anlama geldiğini anlaması daha zordur.

good*
  if (socket.isConnected && database.hasData) {
    socket.write(database.read());
  }

bad*
  if (!socket.isDisconnected && !database.isEmpty) {
    socket.write(database.read());
  }


Bazı özellikler için belirgin bir pozitif form yoktur. Diske atılan bir belge 
"kaydedilmiş" mi yoksa " değiştirilmemiş" mi? Temizlenmemiş bir belge 
“kaydedilmemiş ” veya “değiştirilmemiş” midir ? Belirsiz durumlarda, 
kullanıcılar tarafından reddedilme olasılığı daha düşük olan veya adı daha kısa 
olan seçeneğe yönelin.

İstisna: Bazı özelliklerde, olumsuz biçim, kullanıcıların ezici bir çoğunlukla 
kullanması gereken şeydir. !Olumlu durumu seçmek, onları her yerde mülkü 
reddetmeye zorlayacaktır . Bunun yerine, o özellik için olumsuz durumu 
kullanmak daha iyi olabilir.
*/
/*
Asıl amacı yan etki olan bir işlev veya yöntem için zorunlu bir fiil öbeği 
TERCİH edin.

Çağrılabilir üyeler, arayana bir sonuç döndürebilir ve diğer iş veya yan 
etkileri gerçekleştirebilir. Dart gibi zorunlu bir dilde, üyeler genellikle yan 
etkileri için çağrılır: bir nesnenin iç durumunu değiştirebilir, bir miktar 
çıktı üretebilir veya dış dünyayla konuşabilirler.

Bu tür üyeler, üyenin gerçekleştirdiği işi açıklayan zorunlu bir fiil tümcesi 
kullanılarak adlandırılmalıdır.

good*
  list.add('element');
  queue.removeFirst();
  window.refresh();

Bu şekilde, bir çağrı, bu işi yapmak için bir komut gibi okunur.  
*/
