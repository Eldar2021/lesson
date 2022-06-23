import 'dart:convert';

/// бул документация example үчүн түзүлдү
/// биздин [categoryFromJson] функциябыз [List<Category>] тибинде кайтарат
/// ```dart
/// List<Category> categoryFromJson(String str) => List<Category>.from(
///      json.decode(str).map((x) => Category.fromJson(x)),
///    );
/// ```
///

List<Category> categoryFromJson(String str) => List<Category>.from(
      json.decode(str).map((x) => Category.fromJson(x)),
    );

String categoryToJson(List<Category> data) => json.encode(
      List<dynamic>.from(data.map((x) => x.toJson())),
    );

class Category {
  ///
  /// бул моделибиз Category үчүн түзүлдү
  /// биздин [Category] модел
  /// ```dart
  /// required this.id,
  /// required this.name,
  ///    );
  /// factory Category.fromJson(Map<String, dynamic> json) => Category(
  ///        id: json["id"],
  ///        name: json["name"],
  ///      );
  /// ```
  ///
  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  final int id;
  final String name;
}
