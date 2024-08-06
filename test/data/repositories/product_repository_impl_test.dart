import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:practical_growth_route_network_package/core/error_handling/exception.dart';
import 'package:practical_growth_route_network_package/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_package/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_package/data/models/product_model.dart';

import 'package:practical_growth_route_network_package/data/repositories/product_repository_impl.dart';
import 'package:practical_growth_route_network_package/domain/repositories/product_repository.dart';

import '../../helpers/dummy_data.dart';
import '../../helpers/json_reader.dart';

class MockProductDataSource extends Mock implements ProductDataSource {}

void main() {
  late ProductRepository repository;
  late MockProductDataSource dataSource;
  setUp(() async {
    dataSource = MockProductDataSource();
    repository = ProductRepositoryImpl(productDataSource: dataSource);
  });

  group('Method getProducts', () {
    final List tRawData = json.decode(
      JsonHelpers.readJson(DummyData.productsGetSuccessResponseJson),
    );
    final List<ProductModel> tList =
        tRawData.map((e) => ProductModel.fromJson(e)).toList();
    test('should return a successful response', () async {
      // arrange
      when(() => dataSource.getProducts()).thenAnswer((_) async => tList);

      // act
      final result = await repository.getProducts();
      final resultList = result.fold<List<ProductModel>?>((l) => null, (r) => r);

      // assert
      expect(result, isA<Right>());
      expect(resultList, isNotNull);
      expect(resultList, equals(tList));
      verify(() => dataSource.getProducts());
    });

    test('should return a failed response', () async {
      // arrange
      final tException = ClientException('An error occurred');
      final tFailure = ClientFailure.decode(tException);

      when(() => dataSource.getProducts()).thenThrow(tFailure);
      // act
      final result = await repository.getProducts();
      final resultFailure = result.fold<Failure?>((l) => l, (r) => null);
      
      // assert
      expect(result, isA<Left>());
      expect(resultFailure, isNotNull);
      expect(resultFailure, equals(tFailure));
      verify(() => dataSource.getProducts());
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
