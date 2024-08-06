import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practical_growth_route_network_package/practical_growth_route_network_package.dart';

class MyAppChangeNotifier extends ChangeNotifier {
  final GetProductsUseCase _getProductsUseCase;

  MyAppChangeNotifier({
    required GetProductsUseCase getProductsUseCase,
  }) : _getProductsUseCase = getProductsUseCase;

  final _products = <ProductModel>[];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getProducts() async {
    _isLoading = true;
    notifyListeners();
    final result = await _getProductsUseCase.call(NoParams());
    result.fold(
      (failure) => log('Error: $failure'),
      (products) {
        _products.clear();
        _products.addAll(products);
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}
