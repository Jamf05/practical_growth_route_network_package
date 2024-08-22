import 'package:http/http.dart' as http;

import 'package:practical_growth_route_network_package/src/core/types/bindings.dart';
import 'package:practical_growth_route_network_package/src/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_package/src/data/repositories/product_repository_impl.dart';
import 'package:practical_growth_route_network_package/src/domain/repositories/product_repository.dart';
import 'package:practical_growth_route_network_package/src/domain/use_cases/get_products_by_category_use_case.dart';

/// Clase que se encarga de enlazar las dependencias necesarias para construir una instancia del caso de uso [GetProductsByCategoryUseCase]
class GetProductsByCategoryBinding extends Bindings<GetProductsByCategoryUseCase> {
  /// Método que instancia las dependencias necesarias para construir una instancia de [GetProductsByCategoryUseCase]
  /// - [http.Client] client: Cliente HTTP
  /// - [ProductDataSource] dataSource: Fuente de datos de productos
  /// - [ProductRepository] repository: Repositorio de productos
  /// - [GetProductsByCategoryUseCase] useCase: Caso de uso para obtener los productos de una categoría
  /// 
  /// ```dart
  /// final GetProductsByCategoryUseCase getProductsByCategoryUseCase =
  ///    GetProductsByCategoryBinding().dependencies(); 
  /// ```
  @override
  GetProductsByCategoryUseCase dependencies() {
    final http.Client client = http.Client();
    final ProductDataSource dataSource = ProductDataSourceImpl(client: client);
    final ProductRepository repository = ProductRepositoryImpl(
      productDataSource: dataSource,
    );
    return GetProductsByCategoryUseCase(productRepository: repository);
  }
}
