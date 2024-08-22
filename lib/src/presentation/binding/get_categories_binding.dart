import 'package:http/http.dart' as http;

import 'package:practical_growth_route_network_package/src/core/types/bindings.dart';
import 'package:practical_growth_route_network_package/src/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_package/src/data/repositories/product_repository_impl.dart';
import 'package:practical_growth_route_network_package/src/domain/repositories/product_repository.dart';
import 'package:practical_growth_route_network_package/src/domain/use_cases/get_categories_use_case.dart';

/// Clase que se encarga de enlazar las dependencias necesarias para construir una instancia del caso de uso [GetCategoriesUseCase]
class GetCategoriesBinding extends Bindings<GetCategoriesUseCase> {
  /// Método que instancia las dependencias necesarias para construir una instancia de [GetCategoriesUseCase]
  /// - [http.Client] client: Cliente HTTP
  /// - [ProductDataSource] dataSource: Fuente de datos de productos
  /// - [ProductRepository] repository: Repositorio de productos
  /// - [GetCategoriesUseCase] useCase: Caso de uso para obtener las categorías de productos
  /// 
  /// ```dart
  /// final GetCategoriesUseCase getCategoriesUseCase =
  ///    GetCategoriesBinding().dependencies(); 
  /// ```
  @override
  GetCategoriesUseCase dependencies() {
    final http.Client client = http.Client();
    final ProductDataSource dataSource = ProductDataSourceImpl(client: client);
    final ProductRepository repository = ProductRepositoryImpl(
      productDataSource: dataSource,
    );
    return GetCategoriesUseCase(productRepository: repository);
  }
}
