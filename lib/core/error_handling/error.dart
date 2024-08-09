import 'dart:developer';

import 'package:practical_growth_route_network_package/core/error_handling/failure.dart';

/// A class representing an error failure, extending the [Failure] class.
class ErrorFailure extends Failure {
  /// The error associated with this failure.
  final Error? error;

  /// The message describing the failure.
  @override
  final String message;

  /// Private constructor for [ErrorFailure].
  ErrorFailure._({
    required this.message,
    this.error,
  });

  /// Factory constructor to create an [ErrorFailure] from an [Error].
  /// Logs the error and its stack trace.
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
