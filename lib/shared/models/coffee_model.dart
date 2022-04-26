import 'dart:convert';

class CoffeeModel {
  final String id;
  final String name;
  int size;
  int sugar;
  int quantity;
  final double price;
  double totalItemPrice;
  final String image;

  CoffeeModel({
    required this.id,
    required this.name,
    required this.size,
    required this.sugar,
    required this.quantity,
    required this.price,
    required this.image,
    required this.totalItemPrice,
  });

  static CoffeeModel init() {
    return CoffeeModel(
      id: '',
      name: '',
      size: 0,
      sugar: 0,
      quantity: 0,
      price: 0.0,
      image: '',
      totalItemPrice: 0.0,
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
      'totalItemPrice': totalItemPrice,
    };
  }

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    return CoffeeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      size: map['size'] ?? 0,
      sugar: map['sugar'] ?? 0,
      quantity: map['quantity'] ?? 0,
      price: map['price'].toDouble() ?? 0,
      image: map['image'] ?? '',
      totalItemPrice: map['totalItemPrice'].toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoffeeModel.fromJson(String source) =>
      CoffeeModel.fromMap(json.decode(source));
}
