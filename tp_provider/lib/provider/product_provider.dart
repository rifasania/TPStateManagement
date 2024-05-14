import 'package:flutter/material.dart';
import 'package:tp_statemanagement/model/product.dart';
import 'package:tp_statemanagement/services/product_services.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  final ProductService _productService = ProductService();

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _productService.fetchProducts();
    } catch (e) {
      print('Error fetching products: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}