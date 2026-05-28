import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class FirebaseService {
  FirebaseService._();
  static final FirebaseService instance = FirebaseService._();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    final snapshot = await _db.collection('products').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      final map = Map<String, dynamic>.from(data);
      map['id'] = doc.id;
      return Product.fromMap(map);
    }).toList();
  }
}
