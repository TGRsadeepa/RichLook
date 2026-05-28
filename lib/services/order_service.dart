import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cart_item.dart';

class OrderService {
  OrderService._();
  static final OrderService instance = OrderService._();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> placeOrder(List<CartItem> items, double total) async {
    final orderData = {
      'createdAt': FieldValue.serverTimestamp(),
      'total': total,
      'items': items.map((item) {
        return {
          'productId': item.product.id,
          'name': item.product.name,
          'imageUrl': item.product.imageUrl,
          'price': item.product.price,
          'quantity': item.quantity,
          'selectedSize': item.selectedSize,
          'selectedColor': item.selectedColor.value,
        };
      }).toList(),
    };

    await _db.collection('orders').add(orderData);
  }
}
