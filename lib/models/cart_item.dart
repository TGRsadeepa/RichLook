import 'package:flutter/material.dart';
import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  String selectedSize;
  Color selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    required this.selectedSize,
    required this.selectedColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': product.id,
      'name': product.name,
      'imageUrl': product.imageUrl,
      'price': product.price,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedColor': selectedColor.value,
    };
  }
}
