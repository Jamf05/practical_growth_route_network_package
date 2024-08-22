import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:practical_growth_route_network_package/practical_growth_route_network_package.dart';

import '../../helpers/dummy_data.dart';
import '../../helpers/json_reader.dart';

void main() {
  group('Method from json', () {
    test('should return a successful response', () async {
      // arrange
      const ProductModel tProductModel = ProductModel(
        id: 1,
        title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
        price: 109.95,
        description:
            'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
        category: "men's clothing",
        image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        rating: RatingModel(rate: 3.9, count: 120),
      );
      final Map<String, dynamic> jsonMap = json.decode(
        JsonHelpers.readJson(DummyData.productJson),
      );

      // act
      final ProductModel result = ProductModel.fromJson(jsonMap);

      // assert
      expect(result, equals(tProductModel));
    });
  });

  group('Method to Json', () {
    test('should return a successful response', () async {
      // arrange
      const ProductModel tProductModel = ProductModel(
        id: 1,
        title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
        price: 109.95,
        description:
            'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
        category: "men's clothing",
        image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        rating: RatingModel(rate: 3.9, count: 120),
      );
      final Map<String, dynamic> jsonMap = json.decode(
        JsonHelpers.readJson(DummyData.productJson),
      );
      // act
      final result = tProductModel.toJson();
      // assert
      expect(result, equals(jsonMap));
    });
  });
}
