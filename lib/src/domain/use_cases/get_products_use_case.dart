import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_package/src/core/types/no_params.dart';
import 'package:practical_growth_route_network_package/src/core/types/use_case.dart';
import 'package:practical_growth_route_network_package/src/data/models/product_model.dart';
import 'package:practical_growth_route_network_package/src/domain/repositories/product_repository.dart';

/// Caso de uso para obtener una lista de productos.
class GetProductsUseCase implements UseCase<List<ProductModel>, NoParams> {
  final ProductRepository productRepository;

  /// Constructor para [GetProductsUseCase].
  ///
  /// Requiere una instancia de [ProductRepository] como parámetro requerido.
  GetProductsUseCase({
    required this.productRepository,
  });

  /// Llama al caso de uso para obtener productos.
  ///
  /// Toma [NoParams] como entrada y devuelve un [Future] que se completa con un [Either]
  /// que contiene un [Failure] en el lado izquierdo si ocurre un error, o una [List] de [ProductModel]
  /// en el lado derecho si tiene éxito.
  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    return productRepository.getProducts();
  }
}