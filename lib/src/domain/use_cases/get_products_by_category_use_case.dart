import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_package/src/core/types/use_case.dart';
import 'package:practical_growth_route_network_package/src/data/models/product_model.dart';
import 'package:practical_growth_route_network_package/src/domain/repositories/product_repository.dart';

/// Caso de uso para recuperar productos por categoría.
/// Implementa la interfaz [UseCase] con una lista de [ProductModel] como salida y un [String] como entrada.
class GetProductsByCategoryUseCase
    implements UseCase<List<ProductModel>, String> {
  /// Repositorio para obtener productos.
  final ProductRepository productRepository;

  /// Constructor para [GetProductsByCategoryUseCase].
  /// Requiere una instancia de [ProductRepository] como parámetro requerido.
  GetProductsByCategoryUseCase({
    required this.productRepository,
  });

  /// Llama al caso de uso para obtener productos por categoría.
  /// Toma un parámetro [String] que representa la categoría.
  /// Devuelve un [Future] con un [Either] que contiene un [Failure] o una lista de [ProductModel].
  @override
  Future<Either<Failure, List<ProductModel>>> call(String category) {
    return productRepository.getProductsByCategory(category: category);
  }
}
