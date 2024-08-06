import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:practical_growth_route_network_package/data/data_sources/product_data_source.dart';

import 'package:practical_growth_route_network_package/data/repositories/product_repository_impl.dart';
import 'package:practical_growth_route_network_package/domain/repositories/product_repository.dart';

class MockProductDataSource extends Mock implements ProductDataSource {}

void main() {
  late ProductRepository repository;
  late MockProductDataSource dataSource;
  setUp(() async {
    dataSource = MockProductDataSource();
    repository = ProductRepositoryImpl(
      productDataSource: dataSource
    );
  });

  group('Method getProducts', () {
    test('should return a successful response', () async {
      // arrange
      // act
      // assert
    });

    test('should return a failed response', () async {
      // arrange
      // act
      // assert
    });
  });

  group('Method getCategories', () {
    test('should return a successful response', () async {
      // arrange
      // act
      // assert
    });

    test('should return a failed response', () async {
      // arrange
      // act
      // assert
    });
  });

  group('Method getProductsByCategory', () {
    test('should return a successful response', () async {
      // arrange
      // act
      // assert
    });

    test('should return a failed response', () async {
      // arrange
      // act
      // assert
    });
  });
}
