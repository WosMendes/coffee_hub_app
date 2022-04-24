import 'dart:convert';

class CoffeeModel {
  final String id;
  final String name;
  final String size;
  final int sugar;
  int quantity;
  final double price;
  final String image;

  CoffeeModel({
    required this.id,
    required this.name,
    required this.size,
    required this.sugar,
    required this.quantity,
    required this.price,
    required this.image,
  });

  static CoffeeModel init() {
    return CoffeeModel(
      id: '',
      name: '',
      size: '',
      sugar: 0,
      quantity: 0,
      price: 0.0,
      image: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'size': size,
      'sugar': sugar,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    return CoffeeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      size: map['size'] ?? '',
      sugar: map['sugar'] ?? 0,
      quantity: map['quantity'] ?? 0,
      price: map['price'].toDouble(),
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoffeeModel.fromJson(String source) =>
      CoffeeModel.fromMap(json.decode(source));
}
