/*
yield* nedir
getiri* anahtar sözcüğü , özyinelemeli oluşturucular oluşturmak için kullanılır
*/
/// this mai fuction fo Eldiyar
void main() {
  Iterable<int> numbers = getNumbersRecursive(3);
  print(numbers);
  for (int val in numbers) {
    print('$val');
  }
}

/// this documantation
/// ```dart
/// if (number > 0) {
///   yield* getNumbersRecursive(number - 1);
/// }
/// for (var book in kidsBooks.keys) {
///   print('$book was written by ${kidsBooks[book]}');
/// }
/// ```
Iterable<int> getNumbersRecursive(int number) sync* {
  if (number > 0) {
    yield* getNumbersRecursive(number - 1);
  }
  yield number;
}
