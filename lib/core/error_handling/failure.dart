/// Abstract class representing a failure.
/// This class extends Equatable to allow for value comparison.
abstract class Failure {
  /// A message describing the failure.
  String get message;
}
