import 'dart:convert';

import 'package:coffee_hub_app/shared/models/coffee_model.dart';

class CartModel {
  double totalOrderPrice;
  List<CoffeeModel> coffees;

  CartModel({
    required this.coffees,
    required this.totalOrderPrice,
  });

  static CartModel init() {
    return CartModel(
      coffees: [],
      totalOrderPrice: 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalOrderPrice': totalOrderPrice,
      'coffees': coffees.map((x) => x.toMap()).toList(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      totalOrderPrice: map['totalOrderPrice'] ?? '',
      coffees: List<CoffeeModel>.from(
        map['coffees']?.map(
          (x) => CoffeeModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));
}
