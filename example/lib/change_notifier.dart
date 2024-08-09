import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practical_growth_route_network_package/practical_growth_route_network_package.dart';

class MyAppChangeNotifier extends ChangeNotifier {
  final PracticalGrowthRouteNetworkPackage _package;

  MyAppChangeNotifier({
    required PracticalGrowthRouteNetworkPackage package,
  }) : _package = package;

  final _products = <ProductModel>[];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getProducts() async {
    _isLoading = true;
    notifyListeners();
    final result = await _package.getProducts();
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
