// ignore_for_file: dead_code_on_catch_subtype

/*
Catch

Bir istisnayı yakalamak veya yakalamak, istisnanın yayılmasını durdurur 
(siz istisnayı yeniden atmadığınız sürece). Bir istisnayı yakalamak, size 
onunla başa çıkma şansı verir:
*/
void atkar() {
  try {
    breedMoreLlamas();
  } on Exception {
    buyMoreLlamas();
  }
}

void breedMoreLlamas() {}
void buyMoreLlamas() {}

/*
Birden fazla istisna türü oluşturabilen kodu işlemek için birden çok catch 
yan tümcesi belirtebilirsiniz. Atılan nesnenin türüyle eşleşen ilk catch yan 
tümcesi istisnayı işler. Catch yan tümcesi bir tür belirtmiyorsa, bu yan 
tümce herhangi bir tür atılan nesneyi işleyebilir:
*/
void atkar1() {
  try {
    breedMoreLlamas();
  } on Exception {
    // A specific exception
    buyMoreLlamas();
  } on Exception catch (e) {
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  }
}
