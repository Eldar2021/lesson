/*
Comments
Halihazırda kafanızdaki içeriğe ne kadar güvendiğinizi fark etmeden kodunuzun 
bugün bariz olduğunu düşünmek kolaydır. Kodunuzda yeni olan insanlar ve hatta 
unutkan gelecekteki benliğiniz bile bu bağlama sahip olmayacak. Kısa ve doğru 
bir yorumun yazılması yalnızca birkaç saniye sürer, ancak bu kişilerden birini 
saatlerce zaman kazandırabilir.

Kodun kendi kendini belgelemesi gerektiğini hepimiz biliyoruz ve tüm yorumlar 
yardımcı olmuyor. Ama gerçek şu ki çoğumuz gerektiği kadar yorum yazmıyoruz. 
Egzersiz yapmak gibidir: teknik olarak çok fazla şey yapabilirsiniz , ancak çok 
daha az şey yapıyor olmanız çok daha olasıdır. Adım atmaya çalışın.
*/
/*
Yorumlar
Aşağıdaki ipuçları, oluşturulan belgelere dahil edilmesini istemediğiniz 
yorumlar için geçerlidir.

Yorumları cümleler gibi biçimlendirin.

good*
  // Not if there is nothing before it.
  if (_chunks.isEmpty) return false;

Büyük/küçük harfe duyarlı bir tanımlayıcı olmadığı sürece ilk sözcüğü büyük 
harf yapın. Bir nokta ile bitirin (veya “!” veya “?”, sanırım). Bu, tüm 
yorumlar için geçerlidir: doküman yorumları, satır içi şeyler, hatta TODO'lar. 
Bir cümle parçası olsa bile.

Dokümantasyon için blok yorumları KULLANMAYIN.

good*
  void greet(String name) {
    // Assume we have a valid name.
    print('Hi, $name!');
  }

bad*
  void greet(String name) {
    /* Assume we have a valid name. */
    print('Hi, $name!');
  }

/* ... */Bir kod bölümünü geçici olarak yorumlamak için bir blok yorumu () 
kullanabilirsiniz, ancak diğer tüm yorumlarda //.
*/
