import 'package:dartz/dartz.dart';

import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_package/src/core/types/no_params.dart';
import 'package:practical_growth_route_network_package/src/core/types/use_case.dart';
import 'package:practical_growth_route_network_package/src/domain/repositories/product_repository.dart';

/// Caso de uso para obtener categorías del repositorio de productos.
class GetCategoriesUseCase implements UseCase<List<String>, NoParams> {
  final ProductRepository productRepository;

  /// Constructor para GetCategoriesUseCase.
  /// Requiere una instancia de [ProductRepository] como parámetro requerido..
  GetCategoriesUseCase({
    required this.productRepository,
  });

  /// Llama al método getCategories del repositorio de productos.
  /// Retorna un [Future] que resuelve a un [Either] que contiene
  /// un [Failure] o una lista de cadenas de categorías.
  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return productRepository.getCategories();
  }
}
