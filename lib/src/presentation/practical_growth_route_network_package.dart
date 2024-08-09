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

final class PracticalGrowthRouteNetworkPackage {
  Future<Either<Failure, List<String>>> getCategories() {
    final GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesBinding().dependencies();
    return getCategoriesUseCase.call(const NoParams());
  }

  Future<Either<Failure, List<ProductModel>>> getProducts() {
    final GetProductsUseCase getProductsUseCase =
        GetProductsBinding().dependencies();
    return getProductsUseCase.call(const NoParams());
  }

  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(
      String category) {
    final GetProductsByCategoryUseCase getProductsByCategoryUseCase =
        GetProductsByCategoryBinding().dependencies();
    return getProductsByCategoryUseCase.call(category);
  }
}
