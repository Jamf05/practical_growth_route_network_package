import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/exception.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_package/src/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_package/src/data/models/product_model.dart';

import 'package:practical_growth_route_network_package/src/data/repositories/product_repository_impl.dart';
import 'package:practical_growth_route_network_package/src/domain/repositories/product_repository.dart';

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
    test('should return a successful response', () async {
      // arrange
      final List tRawData = json.decode(
        JsonHelpers.readJson(DummyData.productsGetSuccessResponseJson),
      );
      final List<ProductModel> tList =
          tRawData.map((e) => ProductModel.fromJson(e)).toList();

      when(() => dataSource.getProducts()).thenAnswer((_) async => tList);

      // act
      final result = await repository.getProducts();
      final resultList =
          result.fold<List<ProductModel>?>((l) => null, (r) => r);

      // assert
      expect(result, isA<Right>());
      expect(resultList, isNotNull);
      expect(resultList, equals(tList));
      verify(() => dataSource.getProducts());
    });

    test(
        'should return a client failure response when api return status code 500',
        () async {
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
      expect(resultFailure?.message, equals('An error occurred'));
      verify(() => dataSource.getProducts());
    });

    test(
        'should return a exception failure response when data api return is not a list',
        () async {
      // arrange
      const tException = FormatException('Data is not a List');
      final tFailure = ExceptionFailure.decode(tException);

      when(() => dataSource.getProducts()).thenThrow(tFailure);

      // act
      final result = await repository.getProducts();
      final resultFailure = result.fold<Failure?>((l) => l, (r) => null);

      // assert
      expect(result, isA<Left>());
      expect(resultFailure, isNotNull);
      expect(resultFailure, equals(tFailure));
      expect(resultFailure?.message,
          equals('FormatException: Data is not a List'));
      verify(() => dataSource.getProducts());
    });
  });

  group('Method getCategories', () {
    test('should return a successful response', () async {
      // arrange
      final List tRawData = json.decode(
        JsonHelpers.readJson(
            DummyData.productsCategoriesGetSuccessResponseJson),
      );
      final List<String> tList = tRawData.map((e) => e.toString()).toList();

      when(() => dataSource.getCategories()).thenAnswer((_) async => tList);

      // act
      final result = await repository.getCategories();
      final resultList = result.fold<List<String>?>((l) => null, (r) => r);

      // assert
      expect(result, isA<Right>());
      expect(resultList, isNotNull);
      expect(resultList, equals(tList));
      verify(() => dataSource.getCategories());
    });

    test(
        'should return a client failure response when api return status code 500',
        () async {
      // arrange
      final tException = ClientException('An error occurred');
      final tFailure = ClientFailure.decode(tException);

      when(() => dataSource.getCategories()).thenThrow(tFailure);

      // act
      final result = await repository.getCategories();
      final resultFailure = result.fold<Failure?>((l) => l, (r) => null);

      // assert
      expect(result, isA<Left>());
      expect(resultFailure, isNotNull);
      expect(resultFailure, equals(tFailure));
      expect(resultFailure?.message, equals('An error occurred'));
      verify(() => dataSource.getCategories());
    });

    test(
        'should return a exception failure response when data api return is not a list',
        () async {
      // arrange
      const tException = FormatException('Data is not a List');
      final tFailure = ExceptionFailure.decode(tException);

      when(() => dataSource.getCategories()).thenThrow(tFailure);

      // act
      final result = await repository.getCategories();
      final resultFailure = result.fold<Failure?>((l) => l, (r) => null);

      // assert
      expect(result, isA<Left>());
      expect(resultFailure, isNotNull);
      expect(resultFailure, equals(tFailure));
      expect(resultFailure?.message,
          equals('FormatException: Data is not a List'));
      verify(() => dataSource.getCategories());
    });
  });

  group('Method getProductsByCategory', () {
    const tCategory = 'electronics';
    test('should return a successful response', () async {
      // arrange
      final List tRawData = json.decode(
        JsonHelpers.readJson(DummyData.productsGetSuccessResponseJson),
      );
      final List<ProductModel> tList =
          tRawData.map((e) => ProductModel.fromJson(e)).toList();

      when(() => dataSource.getProductsByCategory(category: tCategory))
          .thenAnswer((_) async => tList);

      // act
      final result =
          await repository.getProductsByCategory(category: tCategory);
      final resultList =
          result.fold<List<ProductModel>?>((l) => null, (r) => r);

      // assert
      expect(result, isA<Right>());
      expect(resultList, isNotNull);
      expect(resultList, equals(tList));
      verify(() => dataSource.getProductsByCategory(category: tCategory));
    });

    test(
        'should return a client failure response when api return status code 500',
        () async {
      // arrange
      final tException = ClientException('An error occurred');
      final tFailure = ClientFailure.decode(tException);

      when(() => dataSource.getProductsByCategory(category: tCategory))
          .thenThrow(tFailure);

      // act
      final result =
          await repository.getProductsByCategory(category: tCategory);
      final resultFailure = result.fold<Failure?>((l) => l, (r) => null);

      // assert
      expect(result, isA<Left>());
      expect(resultFailure, isNotNull);
      expect(resultFailure, equals(tFailure));
      expect(resultFailure?.message, equals('An error occurred'));
      verify(() => dataSource.getProductsByCategory(category: tCategory));
    });

    test(
        'should return a exception failure response when data api return is not a list',
        () async {
      // arrange
      const tException = FormatException('Data is not a List');
      final tFailure = ExceptionFailure.decode(tException);

      when(() => dataSource.getProductsByCategory(category: tCategory))
          .thenThrow(tFailure);

      // act
      final result =
          await repository.getProductsByCategory(category: tCategory);
      final resultFailure = result.fold<Failure?>((l) => l, (r) => null);

      // assert
      expect(result, isA<Left>());
      expect(resultFailure, isNotNull);
      expect(resultFailure, equals(tFailure));
      expect(resultFailure?.message,
          equals('FormatException: Data is not a List'));
      verify(() => dataSource.getProductsByCategory(category: tCategory));
    });
  });
}
