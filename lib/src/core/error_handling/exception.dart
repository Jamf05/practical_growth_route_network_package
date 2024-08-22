import 'dart:developer';
import 'package:http/http.dart';
import 'package:practical_growth_route_network_package/src/core/error_handling/failure.dart';

/// Una clase que representa un fallo de tipo excepción y que extiende de la clase [Failure].
class ExceptionFailure extends Failure {
  /// La excepción que causó el fallo.
  final Exception? exception;

  /// El mensaje que describe el fallo.
  /// El mensaje tiene valor de `error.toString()`.
  @override
  final String message;

  ExceptionFailure._({
    required this.message,
    this.exception,
  });

  /// - Constructor factory para crear un [ExceptionFailure] a partir de una [Exception].
  /// - Inicializa el mensaje con el valor de `error.toString()`.
  /// - Registra el error en el log.
  factory ExceptionFailure.decode(Exception? exception) {
    log(exception.toString(), name: 'FAILURE[EXCEPTION]');
    return ExceptionFailure._(
      exception: exception,
      message: exception.toString(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ExceptionFailure &&
        other.exception == exception &&
        other.message == message;
  }

  @override
  int get hashCode => exception.hashCode ^ message.hashCode;
}

/// Una clase que representa un fallo de tipo cliente http y que extiende de la clase [Failure].
class ClientFailure extends Failure {
  /// La excepción que causó el fallo.
  final ClientException? exception;

  /// El mensaje que describe el fallo.
  /// El mensaje tiene valor de `error.toString()`.
  @override
  final String message;

  ClientFailure._({
    required this.message,
    this.exception,
  });

  /// - Constructor factory para crear un [ClientFailure] a partir de una [ClientException].
  /// - Inicializa el mensaje con el valor de `error.toString()`.
  /// - Registra el error en el log.
  factory ClientFailure.decode(ClientException? exception) {
    log(exception.toString(), name: 'FAILURE[CLIENTEXCEPTION]');
    return ClientFailure._(
      exception: exception,
      message: exception?.message ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ClientFailure &&
        other.exception == exception &&
        other.message == message;
  }

  @override
  int get hashCode => exception.hashCode ^ message.hashCode;
}
