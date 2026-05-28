import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/firebase_service.dart';

class ProductProvider with ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService.instance;

  List<Product> _products = [];
  bool _isLoading = true;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  ProductProvider() {
    loadProducts();
  }

  Future<void> loadProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _firebaseService.fetchProducts();
    } catch (e) {
      _error = e.toString();
      _products = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
