/*
Assertion with assert
iddia ile iddia
Bu dersimizde, assert ifadesinin nasıl kullanılacağını öğreneceğiz.

assertkod yürütmeye koşul koymanıza izin veren inanılmaz derecede kullanışlı 
bir ifadedir. Bir boole koşulu olduğunda normal yürütmeyi bozmak için 
kullanılır false.

sözdizimi #
Sözdizimi aşağıdaki gibidir:

İletilen ilk argüman assert, bir boole değerine indirgeyen herhangi bir ifade 
olabilir. İfadenin değeri doğruysa, iddia başarılı olur ve yürütme devam eder. 
Yanlışsa, iddia başarısız olur ve bir istisna (hata) atılır.

Bir iddiaya mesaj eklemek için, ikinci argüman olarak bir dize ekleyin assert.

Örnek # ile öğrenin
Olayları daha iyi anlamak için bir örneğe bakalım.
*/
main() {
  var variable;
  print(variable);

  // assert(variable != null);

  variable = 5;
  print(variable);
}

/*
# ile karşılaştırmaif
Akla gelebilecek bir şey, assertbir ififadeye benzer.

Yukarıdaki kodu, if-elseyerine bir ifade kullanacak şekilde değiştirelim assert.
*/
main1() {
  var variable;
  print(variable);

  // ignore: unnecessary_null_comparison
  if (variable != null) {
    print('not null');
  } else {
    variable = 5;
    print(variable);
  }
}
/*
Birincisi, program çalışmaya devam eder ve son kod satırına kadar yürütülür. 
Ayrıca, bir deyimin kullanılması , kodda 'lerin ifyüksek düzeyde iç içe 
geçmesiyle sonuçlanır . {}Ayrıca, kod büyüdükçe ve modüler hale geldikçe, 
herhangi bir işlevde gerektiği gibi herhangi bir yere iddia koyabilir ve 
istisnai bir durum ortaya çıktığında normal yürütmeyi kesintiye uğratacağına 
güvenebilirsiniz.

İddia ile, kontrol yapıları hakkındaki tartışmamız sona eriyor. Bir sonraki 
bölüme geçmeden önce kısa bir özet için bir test yapalım.
*/