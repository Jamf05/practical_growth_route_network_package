import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';

/// Clase abstracta que representa un caso de uso en la aplicación.
///
/// Un caso de uso es una operación de lógica de negocios específica que la aplicación puede realizar.
/// Toma parámetros de tipo [Params] y devuelve un [Future] que se resuelve en un [Either]
/// que contiene un [Failure] o un resultado de tipo [Type].
abstract class UseCase<Type, Params> {
  /// Ejecuta el caso de uso con los parámetros indicados.
///
/// [params]: los parámetros necesarios para ejecutar el caso de uso.
///
/// Devuelve un [Future] que se resuelve en un [Either] que contiene un [Failure] o un resultado de tipo [Type].
  Future<Either<Failure, Type>> call(Params params);
}