import 'package:practical_growth_route_network_package/src/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_package/src/data/models/product_model.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_package/src/domain/repositories/product_repository.dart';

/// Implementación de la interfaz [ProductRepository].
/// Esta clase maneja las operaciones de datos relacionadas con los productos.
class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  /// Constructor para [ProductRepositoryImpl].
  /// Requiere un [ProductDataSource] para obtener datos de productos.
  ProductRepositoryImpl({
    required this.productDataSource,
  });

  /// Obtiene una lista de productos desde la fuente de datos.
  ///
  /// Retorna un Future que resuelve a un [Failure] o una Lista de [ProductModel].
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final products = await productDataSource.getProducts();
      return Right(products);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  /// Obtiene una lista de categorías de productos desde la fuente de datos.
  ///
  /// Retorna un Future que resuelve a un [Failure] o una Lista de [String].
  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final categories = await productDataSource.getCategories();
      return Right(categories);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  /// Obtiene una lista de productos por categoría desde la fuente de datos.
  ///
  /// Toma un parámetro requerido [category] para filtrar los productos.
  /// Retorna un Future que resuelve a un [Failure] o una Lista de [ProductModel].
  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory({
    required String category,
  }) async {
    try {
      final products =
          await productDataSource.getProductsByCategory(category: category);
      return Right(products);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
