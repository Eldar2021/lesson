/*
Dart Uzantıları ile Numaralandırmalar
Dart'ta uzatma yöntemlerini kullanarak daha temiz kod nasıl yazılır
*/
enum SelectedColor { primary, secondary }

extension SelectedColorExtension on SelectedColor {
  String get name => _getName();

  String _getName() {
    switch (this) {
      case SelectedColor.primary:
        print('This is primaryColor');
        return 'This is primaryColor';
      case SelectedColor.secondary:
        print('This is secondaryColor');
        return 'This is secondaryColor';
      default:
        print('This is Not found Color');
        return 'This is Not found Color';
    }
  }
}

void main() {
  final color = SelectedColor.primary;
  color.name;
}
/*
Dart, yakın zamanda uzatma yöntemleri için destek yayınladı; bu, artık bu 
harika özelliği kullanabileceğiniz anlamına geliyor. Bu makale, Flutter kodumda 
uzantı yöntemlerini nasıl kullandığımın bir örneğini açıklamaktadır.

Flutter kodumda her zaman numaralandırmalar kullandım, ancak numaralandırmaları 
ve uzatma yöntemlerini entegre etmek Flutter'da geliştirmeyi ve kodun daha 
temiz okunmasını sağladı.

Diyelim ki bir numaralandırma yaptınız ve metniniz numaralandırmanıza bağlı. 
Daha önce, IIFE ( orta postaWidget ) kullanarak içinde bir switch ifadesi 
kullanırdım . Hemen çağrılan bir işlev ifadesi , kullanışlı bir Dart modeli 
olan anonim bir yöntemi çağırmanıza olanak tanır. Ancak bu kalıbı kullanmak, 
aşağıdaki örnekte gösterildiği gibi spagetti koduna yol açabilir. Ayrıca, aynı 
metni başka bir yere eklemeniz gerekirse, yalnızca bir işlev çağrısı yapmak 
yerine kod parçacığının tamamını kopyalamanız gerekir.
*/
