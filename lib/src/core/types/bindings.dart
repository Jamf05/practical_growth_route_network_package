import 'package:practical_growth_route_network_package/src/core/types/use_case.dart';

abstract class Bindings<T extends UseCase> {
  T dependencies();
}