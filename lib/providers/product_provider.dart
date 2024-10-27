import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  String? label;
  String? buttonText;
  final ApiService _apiService = ApiService();

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final data = await _apiService.fetchProducts();
    final components = data['data'];

    for (var component in components) {
      switch (component['type']) {
        case 'Label':
          label = component['customAttributes']['label']['text'];
          break;
        case 'Button':
          buttonText = component['customAttributes']['button']['text'];
          break;
        case 'ProductList':
          List<dynamic> items =
              component['customAttributes']['productlist']['items'];
          _products = items.map((json) => Product.fromJson(json)).toList();
          break;
      }
    }
    notifyListeners();
  }

  void addProduct(Product product) {
    _products.insert(0, product);
    notifyListeners();
  }
}
