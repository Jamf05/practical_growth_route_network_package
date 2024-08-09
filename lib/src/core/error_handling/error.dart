import 'dart:developer';

import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';

/// Una clase que representa un fallo de tipo error y que extiende de la clase [Failure].
class ErrorFailure extends Failure {
  /// El [error] asociado al fallo.
  final Error? error;

  /// El mensaje que describe el fallo.
  /// El mensaje tiene valor de `error.toString()`.
  @override
  final String message;

  ErrorFailure._({
    required this.message,
    this.error,
  });

  /// - Constructor factory para crear un [ErrorFailure] a partir de un [Error].
  /// - Inicializa el mensaje con el valor de `error.toString()`.
  /// - Registra el error en el log.
  factory ErrorFailure.decode(
    Error? error,
  ) {
    log(error.toString(), name: 'FAILURE[ERROR]');
    log((error?.stackTrace).toString(), name: 'FAILURE[ERROR][TRACE]');
    return ErrorFailure._(
      error: error,
      message: error.toString(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ErrorFailure &&
        other.error == error &&
        other.message == message;
  }

  @override
  int get hashCode => error.hashCode ^ message.hashCode;
}
