import 'package:http/http.dart' as http;

import 'package:practical_growth_route_network_package/src/core/types/bindings.dart';
import 'package:practical_growth_route_network_package/src/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_package/src/data/repositories/product_repository_impl.dart';
import 'package:practical_growth_route_network_package/src/domain/repositories/product_repository.dart';
import 'package:practical_growth_route_network_package/src/domain/use_cases/get_products_use_case.dart';

class GetProductsBinding extends Bindings<GetProductsUseCase> {
  @override
  GetProductsUseCase dependencies() {
    final http.Client client = http.Client();
    final ProductDataSource dataSource = ProductDataSourceImpl(client: client);
    final ProductRepository repository = ProductRepositoryImpl(
      productDataSource: dataSource,
    );
    return GetProductsUseCase(productRepository: repository);
  }
}
