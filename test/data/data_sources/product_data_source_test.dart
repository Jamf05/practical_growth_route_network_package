import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:practical_growth_route_network_package/src/core/env/environment.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/error.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/exception.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';

import 'package:practical_growth_route_network_package/src/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_package/src/data/models/product_model.dart';

import '../../helpers/dummy_data.dart';
import '../../helpers/json_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  late ProductDataSource dataSource;
  late MockHttpClient mockClient;
  late MockResponse mockResponse;
  setUp(() async {
    mockClient = MockHttpClient();
    mockResponse = MockResponse();
    dataSource = ProductDataSourceImpl(
      client: mockClient,
    );
  });

  group('Method getProducts', () {
    const tPath = '${Environment.api}/products';
    final tUri = Uri.parse(tPath);
    final List tRawData = json.decode(
      JsonHelpers.readJson(DummyData.productsGetSuccessResponseJson),
    );
    final List<ProductModel> tList =
        tRawData.map((e) => ProductModel.fromJson(e)).toList();
    test('should return a successful response', () async {
      // arrange
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.body).thenReturn(
        jsonEncode(tRawData),
      );
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      final result = await dataSource.getProducts();

      // assert
      expect(result, equals(tList));
      verify(() => mockClient.get(tUri));
    });

    test(
        'should return a client failure response when api return status code 500',
        () async {
      // arrange
      const tMessage = 'Status code: 500';

      when(() => mockResponse.statusCode).thenReturn(500);
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      Object? result;
      try {
        result = await dataSource.getProducts();
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ClientFailure>());
      expect((result as ClientFailure).exception, isA<http.ClientException>());
      expect(result.message, equals(tMessage));
    });

    test(
        'should return a exception failure response when data api return is not a list',
        () async {
      // arrange
      const Map tRawData = {};
      const tMessage = 'FormatException: Data is not a List';

      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.body).thenReturn(
        jsonEncode(tRawData),
      );
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      Object? result;
      try {
        result = await dataSource.getProducts();
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ExceptionFailure>());
      expect((result as ExceptionFailure).exception, isA<FormatException>());
      expect(result.message, equals(tMessage));
    });

    test('should return a error failure response when client return out of memory error',
        () async {
      // arrange
      const tError = OutOfMemoryError();
      const tMessage = 'Out of Memory';

      when(() => mockClient.get(tUri)).thenThrow(tError);

      // act
      Object? result;
      try {
        result = await dataSource.getProducts();
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ErrorFailure>());
      expect((result as ErrorFailure).error, isA<OutOfMemoryError>());
      expect(result.message, equals(tMessage));
    });
  });

  group('Method getCategories', () {
    const tPath = '${Environment.api}/products/categories';
    final tUri = Uri.parse(tPath);
    final List tRawData = json.decode(
      JsonHelpers.readJson(DummyData.productsCategoriesGetSuccessResponseJson),
    );
    final List<String> tList = tRawData.map((e) => e.toString()).toList();
    test('should return a successful response', () async {
      // arrange
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.body).thenReturn(
        jsonEncode(tRawData),
      );
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      final result = await dataSource.getCategories();

      // assert
      expect(result, equals(tList));
    });

    test(
        'should return a client failure response when api return status code 500',
        () async {
      // arrange
      const tMessage = 'Status code: 500';

      when(() => mockResponse.statusCode).thenReturn(500);
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      Object? result;
      try {
        result = await dataSource.getCategories();
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ClientFailure>());
      expect((result as ClientFailure).exception, isA<http.ClientException>());
      expect(result.message, equals(tMessage));
    });

    test(
        'should return a exception failure response when data api return is not a list',
        () async {
      // arrange
      const Map tRawData = {};
      const tMessage = 'FormatException: Data is not a List';

      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.body).thenReturn(
        jsonEncode(tRawData),
      );
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      Object? result;
      try {
        result = await dataSource.getCategories();
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ExceptionFailure>());
      expect((result as ExceptionFailure).exception, isA<FormatException>());
      expect(result.message, equals(tMessage));
    });

    test('should return a error failure response when client return out of memory error',
        () async {
      // arrange
      const tError = OutOfMemoryError();
      const tMessage = 'Out of Memory';

      when(() => mockClient.get(tUri)).thenThrow(tError);

      // act
      Object? result;
      try {
        result = await dataSource.getCategories();
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ErrorFailure>());
      expect((result as ErrorFailure).error, isA<OutOfMemoryError>());
      expect(result.message, equals(tMessage));
    });
  });

  group('Method getProductsByCategory', () {
    const tCategory = 'electronics';
    const tPath = '${Environment.api}/products/category/$tCategory';
    final tUri = Uri.parse(tPath);
    final List tRawData = json.decode(
      JsonHelpers.readJson(DummyData.productsCategoryGetSuccessResponseJson),
    );
    final List<ProductModel> tList =
        tRawData.map((e) => ProductModel.fromJson(e)).toList();
    test('should return a successful response', () async {
      // arrange
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.body).thenReturn(
        jsonEncode(tRawData),
      );
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      final result =
          await dataSource.getProductsByCategory(category: tCategory);

      // assert
      expect(result, equals(tList));
    });

    test(
        'should return a client failure response when api return status code 500',
        () async {
      // arrange
      const tMessage = 'Status code: 500';

      when(() => mockResponse.statusCode).thenReturn(500);
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      Object? result;
      try {
        result = await dataSource.getProductsByCategory(category: tCategory);
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ClientFailure>());
      expect((result as ClientFailure).exception, isA<http.ClientException>());
      expect(result.message, equals(tMessage));
    });

    test(
        'should return a exception failure response when data api return is not a list',
        () async {
      // arrange
      const Map tRawData = {};
      const tMessage = 'FormatException: Data is not a List';

      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.body).thenReturn(
        jsonEncode(tRawData),
      );
      when(() => mockClient.get(tUri)).thenAnswer((_) async => mockResponse);

      // act
      Object? result;
      try {
        result = await dataSource.getProductsByCategory(category: tCategory);
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ExceptionFailure>());
      expect((result as ExceptionFailure).exception, isA<FormatException>());
      expect(result.message, equals(tMessage));
    });

    test('should return a error failure response when client return out of memory error',
        () async {
      // arrange
      const tError = OutOfMemoryError();
      const tMessage = 'Out of Memory';

      when(() => mockClient.get(tUri)).thenThrow(tError);

      // act
      Object? result;
      try {
        result = await dataSource.getProductsByCategory(category: tCategory);
      } catch (e) {
        result = e;
      }

      // assert
      expect(result, isA<Failure>());
      expect(result, isA<ErrorFailure>());
      expect((result as ErrorFailure).error, isA<OutOfMemoryError>());
      expect(result.message, equals(tMessage));
    });
  });
}
