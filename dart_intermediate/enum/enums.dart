/*
Enumerated types

Numaralandırılmış türler
Genellikle numaralandırma veya numaralandırma olarak adlandırılan
numaralandırılmış türler, sabit sayıda sabit değeri temsil etmek için 
kullanılan özel bir sınıf türüdür.

Basit numaralandırmaları bildirme
Basit bir numaralandırılmış tür bildirmek için enumanahtar sözcüğü kullanın ve 
numaralandırılmasını istediğiniz değerleri listeleyin:
*/
enum Color { red, green, blue }

enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
