/*
Effective Dart: Style
İyi kodun şaşırtıcı derecede önemli bir parçası iyi stildir. Tutarlı adlandırma, 
sıralama ve biçimlendirme , aynı kodun aynı görünmesine yardımcı olur. 
Çoğumuzun oküler sistemlerimizde sahip olduğu güçlü model eşleştirme 
donanımından yararlanır. Dart ekosisteminin tamamında tutarlı bir stil 
kullanırsak, hepimizin birbirimizin kodundan öğrenmesini ve katkıda bulunmasını 
kolaylaştırır.

tanımlayıcılar
Tanımlayıcılar Dart'ta üç farklı şekilde gelir.

  UpperCamelCaseisimler, ilki de dahil olmak üzere her kelimenin ilk harfini 
  büyük harfle yazar.

  lowerCamelCase isimler , kısaltma olsa bile her zaman küçük harf olan ilk 
  hariç , her kelimenin ilk harfini büyük yapar.

  lowercase_with_underscoresisimler, kısaltmalar için bile yalnızca küçük 
  harfler kullanır ve sözcükleri ile ayırın _.
*/
/*
UpperCamelCase Kullanarak ad türleri yapın
Sınıflar, enum türleri, typedef'ler ve tür parametreleri, her kelimenin ilk 
harfini (ilk kelime dahil) büyük yazmalı ve ayırıcı kullanmamalıdır.

  good*
    class SliderMenu { ... }

    class HttpRequest { ... }

    typedef Predicate<T> = bool Function(T value);

Bu, meta veri açıklamalarında kullanılması amaçlanan sınıfları bile içerir.

  good*
    class Foo {
      const Foo([Object? arg]);
    }

    @Foo(anArg)
    class A { ... }

    @Foo()
    class B { ... }

lowerCamelCaseAçıklama sınıfının yapıcısı parametre almıyorsa, bunun için ayrı 
bir sabit oluşturmak isteyebilirsiniz.

  good*
    const foo = Foo();

    @foo
    class C { ... }
*/
/*
kullanarak uzantıları adlandırın UpperCamelCase.
Türler gibi, uzantılar da her kelimenin ilk harfini (ilk kelime dahil) büyük 
yazmalı ve ayırıcı kullanmamalıdır.

  good*
    extension MyFancyList<T> on List<T> { ... }

    extension SmartIterable<T> on Iterable<T> { ... }

*/
/*
NET kullanarak kitaplıkları, paketleri, dizinleri ve kaynak dosyaları adlandırın 
lowercase_with_underscores.

Bazı dosya sistemleri büyük/küçük harfe duyarlı değildir, bu nedenle birçok 
proje dosya adlarının tamamının küçük harf olmasını gerektirir. Bir ayırma 
karakteri kullanmak, adların bu biçimde hala okunabilir olmasını sağlar. 
Ayırıcı olarak alt çizgi kullanmak, adın hala geçerli bir Dart tanımlayıcısı 
olmasını sağlar; bu, dil daha sonra sembolik içe aktarmayı destekliyorsa 
yardımcı olabilir.

  good*
    library peg_parser.source_scanner;

    import 'file_system.dart';
    import 'slider_menu.dart';

  bad*
    library pegparser.SourceScanner;

    import 'file-system.dart';
    import 'SliderMenu.dart';  
*/
/*
kullanarak önekleri adlandırın lowercase_with_underscores.
  good*
    import 'dart:math' as math;
    import 'package:angular_components/angular_components.dart' as angular_components;
    import 'package:js/js.dart' as js;

  bad*
    import 'dart:math' as Math;
    import 'package:angular_components/angular_components.dart' as angularComponents;
    import 'package:js/js.dart' as JS;  
*/
/*
kullanarak diğer tanımlayıcıları adlandırın lowerCamelCase.
Sınıf üyeleri, üst düzey tanımlar, değişkenler, parametreler ve adlandırılmış 
parametreler, ilk kelime dışındaki her kelimenin ilk harfini büyük yazmalı ve 
ayırıcı kullanmamalıdır.

  good*
    var count = 3;

    HttpRequest httpRequest;

    void align(bool clearItems) {
      // ...
    }
*/
/*
lowerCamelCaseSabit adlar için kullanmayı TERCİH EDİN .
Yeni kodda, lowerCamelCaseenum değerleri de dahil olmak üzere sabit değişkenler 
için kullanın.

  good*
    const pi = 3.14;
    const defaultTimeout = 1000;
    final urlScheme = RegExp('^([a-z]+):');

    class Dice {
      static final numberGenerator = Random();
    }

  bad*
    const PI = 3.14;
    const DefaultTimeout = 1000;
    final URL_SCHEME = RegExp('^([a-z]+):');

    class Dice {
      static final NUMBER_GENERATOR = Random();
    }  
*/
