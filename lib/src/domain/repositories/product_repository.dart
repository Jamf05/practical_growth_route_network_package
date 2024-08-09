import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_package/src/data/models/product_model.dart';

/// Clase abstracta que representa un repositorio para la gestión de productos.
abstract class ProductRepository {
  /// Obtiene una lista de productos.
  ///
  /// Retorna un [Future] que se completa con un [Either] que contiene un [Failure]
  /// en el lado izquierdo si ocurre un error, o una [List] de [ProductModel] en el lado derecho si tiene éxito.
  Future<Either<Failure, List<ProductModel>>> getProducts();

  /// Obtiene una lista de categorías de productos.
  ///
  /// Retorna un [Future] que se completa con un [Either] que contiene un [Failure]
  /// en el lado izquierdo si ocurre un error, o una [List] de [String] que representa
  /// las categorías en el lado derecho si tiene éxito.
  Future<Either<Failure, List<String>>> getCategories();

  /// Obtiene una lista de productos filtrados por categoría.
  ///
  /// Toma un parámetro requerido [String] [category] que especifica la categoría por la cual filtrar los productos.
  /// Retorna un [Future] que se completa con un [Either] que contiene un [Failure]
  /// en el lado izquierdo si ocurre un error, o una [List] de [ProductModel] en el lado derecho si tiene éxito.
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory({
    required String category,
  });
}