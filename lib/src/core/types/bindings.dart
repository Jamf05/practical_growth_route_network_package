import 'package:practical_growth_route_network_package/src/core/types/use_case.dart';

/// Clase abstracta que representa una clase construye las dependencias de un [UseCase]
abstract class Bindings<T extends UseCase> {
  /// Método que construye las dependencias de un [UseCase]
  T dependencies();
}