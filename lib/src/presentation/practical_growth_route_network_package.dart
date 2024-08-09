import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_package/src/core/types/no_params.dart';
import 'package:practical_growth_route_network_package/src/data/models/product_model.dart';
import 'package:practical_growth_route_network_package/src/domain/use_cases/get_categories_use_case.dart';
import 'package:practical_growth_route_network_package/src/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:practical_growth_route_network_package/src/domain/use_cases/get_products_use_case.dart';
import 'package:practical_growth_route_network_package/src/presentation/binding/get_categories_binding.dart';
import 'package:practical_growth_route_network_package/src/presentation/binding/get_products_binding.dart';
import 'package:practical_growth_route_network_package/src/presentation/binding/get_products_by_category_binding.dart';

/// Clase principal del paquete PracticalGrowthRouteNetworkPackage
/// que proporciona métodos para obtener categorías y productos
/// de la api https://fakestoreapi.com/.
final class PracticalGrowthRouteNetworkPackage {
  /// Obtiene una lista de categorías.
  ///
  /// Devuelve un `Future` que resuelve en un `Either<Failure, List<String>>`.
  /// 
  /// - Ejemplo de uso:
  /// 
  ///   ```dart
  ///   final PracticalGrowthRouteNetworkPackage package = PracticalGrowthRouteNetworkPackage();
  ///   final result = await package.getCategories();
  ///   result.fold(
  ///    (failure) => log('Error: $failure'),
  ///    (categories) => log('Categories: $categories'),
  ///   );
  ///   ```
  Future<Either<Failure, List<String>>> getCategories() {
    final GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesBinding().dependencies();
    return getCategoriesUseCase.call(const NoParams());
  }

  /// Obtiene una lista de productos.
  ///
  /// Devuelve un `Future` que resuelve en un `Either<Failure, List<ProductModel>>`.
  /// 
  /// - Ejemplo de uso:
  /// 
  ///   ```dart
  ///   final PracticalGrowthRouteNetworkPackage package = PracticalGrowthRouteNetworkPackage();
  ///   final result = await package.getProducts();
  ///   result.fold(
  ///    (failure) => log('Error: $failure'),
  ///    (products) => log('Productos: $products'),
  ///   );
  ///   ```
  Future<Either<Failure, List<ProductModel>>> getProducts() {
    final GetProductsUseCase getProductsUseCase =
        GetProductsBinding().dependencies();
    return getProductsUseCase.call(const NoParams());
  }

  /// Obtiene una lista de productos por categoría.
  ///
  /// [category] es el nombre de la categoría para la cual se desean obtener los productos.
  /// Devuelve un `Future` que resuelve en un `Either<Failure, List<ProductModel>>`.
  /// 
  /// - Ejemplo de uso:
  /// 
  ///   ```dart
  ///   const category = 'electronics';
  ///   final PracticalGrowthRouteNetworkPackage package = PracticalGrowthRouteNetworkPackage();
  ///   final result = await package.getProductsByCategory(category);
  ///   result.fold(
  ///    (failure) => log('Error: $failure'),
  ///    (products) => log('Productos: $products'),
  ///   );
  ///   ```
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(
      String category) {
    final GetProductsByCategoryUseCase getProductsByCategoryUseCase =
        GetProductsByCategoryBinding().dependencies();
    return getProductsByCategoryUseCase.call(category);
  }
}
