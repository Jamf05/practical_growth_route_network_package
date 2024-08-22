import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practical_growth_route_network_package/src/core/env/environment.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/error.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/exception.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/http_client_response.dart';
import 'package:practical_growth_route_network_package/src/data/models/product_model.dart';

/// Interface that defines the operations for fetching products.
abstract class ProductDataSource {
  /// Obtiene una lista de categorías de productos.
  Future<List<ProductModel>> getProducts();

  /// Fetches a list of product categories.
  Future<List<String>> getCategories();

  /// Obtiene una lista de productos por categoría.
  ///
  /// [category] es la categoría String para filtrar los productos.
  Future<List<ProductModel>> getProductsByCategory({
    required String category,
  });
}

/// Implementación de [ProductDataSource] que utiliza un cliente HTTP para obtener productos.
class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;

  /// Constructor that requires an HTTP client.
  ProductDataSourceImpl({
    required this.client,
  });

  /// Obtiene una lista de productos desde una API remota.
  ///
  /// Realiza una solicitud GET a la URL definida en el entorno y decodifica
  /// la respuesta JSON en una lista de [ProductModel].
  ///
  /// Lanza [ClientFailure], [ErrorFailure], o [ExceptionFailure] en caso de errores.
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

  /// Obtiene una lista de categorías de productos desde una API remota.
  ///
  /// Realiza una solicitud GET a la URL definida en el entorno y decodifica
  /// la respuesta JSON en una lista de [String].
  ///
  /// Lanza [ClientFailure], [ErrorFailure], o [ExceptionFailure] en caso de errores.
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

  /// Obtiene una lista de productos por categoría desde una API remota.
  ///
  /// Realiza una solicitud GET a la URL definida en el entorno con el parámetro de categoría
  /// y decodifica la respuesta JSON en una lista de [ProductModel].
  ///
  /// Lanza [ClientFailure], [ErrorFailure], o [ExceptionFailure] en caso de errores.
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
