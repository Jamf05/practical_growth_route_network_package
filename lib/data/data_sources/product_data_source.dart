import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practical_growth_route_network/core/env/environment.dart';
import 'package:practical_growth_route_network/core/error_handling/error.dart';
import 'package:practical_growth_route_network/core/error_handling/exception.dart';
import 'package:practical_growth_route_network/core/error_handling/http_client_response.dart';
import 'package:practical_growth_route_network/data/models/product_model.dart';

/// Interface that defines the operations for fetching products.
abstract class ProductDataSource {
  /// Fetches a list of products.
  Future<List<ProductModel>> getProducts();

  /// Fetches a list of product categories.
  Future<List<String>> getCategories();

  /// Fetches a list of products by category.
  ///
  /// [category] is the [String] category to filter products by.
  Future<List<ProductModel>> getProductsByCategory({
    required String category,
  });
}

/// Implementation of [ProductDataSource] that uses an HTTP client to fetch products.
class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;

  /// Constructor that requires an HTTP client.
  ProductDataSourceImpl({
    required this.client,
  });

  /// Fetches a list of products from a remote API.
  ///
  /// Makes a GET request to the URL defined in the environment and decodes
  /// the JSON response into a list of [ProductModel].
  ///
  /// Throws [ClientFailure], [ErrorFailure], or [ExceptionFailure] in case of errors.
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      const uri = '${Environment.api}/products';
      final response = await client.get(Uri.parse(uri));
      HttpClientResponse.validate(response);
      final data = json.decode(response.body);
      if (data is List) {
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw const FormatException('Data is not a List');
      }
    } on http.ClientException catch (error) {
      throw ClientFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  /// Fetches a list of product categories from a remote API.
  ///
  /// Makes a GET request to the URL defined in the environment and decodes
  /// the JSON response into a list of strings representing categories.
  ///
  /// Throws [ClientFailure], [ErrorFailure], or [ExceptionFailure] in case of errors.
  @override
  Future<List<String>> getCategories() async {
    try {
      const uri = '${Environment.api}/products/categories';
      final response = await client.get(Uri.parse(uri));
      HttpClientResponse.validate(response);
      final data = json.decode(response.body);
      if (data is List) {
        return data.map((e) => e.toString()).toList();
      } else {
        throw const FormatException('Data is not a List');
      }
    } on http.ClientException catch (error) {
      throw ClientFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  /// Fetches a list of products by category from a remote API.
  ///
  /// Makes a GET request to the URL defined in the environment with the specified category
  /// and decodes the JSON response into a list of [ProductModel].
  ///
  /// [category] is the [String] category to filter products by.
  ///
  /// Throws [ClientFailure], [ErrorFailure], or [ExceptionFailure] in case of errors.
  @override
  Future<List<ProductModel>> getProductsByCategory({
    required String category,
  }) async {
    try {
      final uri = '${Environment.api}/products/category/$category';
      final response = await client.get(Uri.parse(uri));
      HttpClientResponse.validate(response);
      final data = json.decode(response.body);
      if (data is List) {
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw const FormatException('Data is not a List');
      }
    } on http.ClientException catch (error) {
      throw ClientFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }
}
