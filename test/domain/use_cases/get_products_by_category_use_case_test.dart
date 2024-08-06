import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import 'package:practical_growth_route_network_package/core/error_handling/exception.dart';
import 'package:practical_growth_route_network_package/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_package/data/models/product_model.dart';
import 'package:practical_growth_route_network_package/domain/repositories/product_repository.dart';
import 'package:practical_growth_route_network_package/domain/use_cases/get_products_by_category_use_case.dart';

import '../../helpers/dummy_data.dart';
import '../../helpers/json_reader.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late GetProductsByCategoryUseCase useCase;
  late MockProductRepository mockProductRepository;
  setUp(() async {
    mockProductRepository = MockProductRepository();
    useCase = GetProductsByCategoryUseCase(
      productRepository: mockProductRepository,
    );
  });

  group('Get products use case', () {
    const tCategory = 'electronics';
    test('should return a successful response', () async {
      // arrange
      final List tRawData = json.decode(
        JsonHelpers.readJson(DummyData.productsGetSuccessResponseJson),
      );
      final List<ProductModel> tList =
          tRawData.map((e) => ProductModel.fromJson(e)).toList();

      when(() =>
              mockProductRepository.getProductsByCategory(category: tCategory))
          .thenAnswer((_) async => Right(tList));

      // act
      final result = await useCase.call(tCategory);
      final resultList =
          result.fold<List<ProductModel>?>((l) => null, (r) => r);

      // assert
      expect(result, isA<Right>());
      expect(resultList, isNotNull);
      expect(resultList, equals(tList));
      verify(() =>
          mockProductRepository.getProductsByCategory(category: tCategory));
    });

    test(
        'should return a client failure response when api return status code 500',
        () async {
      // arrange
      final tException = ClientException('An error occurred');
      final tFailure = ClientFailure.decode(tException);

      when(() =>
              mockProductRepository.getProductsByCategory(category: tCategory))
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await useCase.call(tCategory);
      final resultFailure = result.fold<Failure?>((l) => l, (r) => null);

      // assert
      expect(result, isA<Left>());
      expect(resultFailure, isNotNull);
      expect(resultFailure, equals(tFailure));
      expect(resultFailure?.message, equals('An error occurred'));
      verify(() =>
          mockProductRepository.getProductsByCategory(category: tCategory));
    });

    test(
        'should return a exception failure response when data api return is not a list',
        () async {
      // arrange
      const tException = FormatException('Data is not a List');
      final tFailure = ExceptionFailure.decode(tException);

      when(() =>
              mockProductRepository.getProductsByCategory(category: tCategory))
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await useCase.call(tCategory);
      final resultFailure = result.fold<Failure?>((l) => l, (r) => null);

      // assert
      expect(result, isA<Left>());
      expect(resultFailure, isNotNull);
      expect(resultFailure, equals(tFailure));
      expect(resultFailure?.message,
          equals('FormatException: Data is not a List'));
      verify(() =>
          mockProductRepository.getProductsByCategory(category: tCategory));
    });
  });
}
