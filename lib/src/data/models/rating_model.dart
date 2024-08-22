/// Modelo de calificación que contiene la tasa y el conteo.
final class RatingModel {
  /// La tasa de calificación, puede ser nula.
  final double? rate;

  /// El conteo de calificaciones, puede ser nulo.
  final int? count;

  /// Constructor constante para crear una instancia de [RatingModel].
  const RatingModel({
    this.rate,
    this.count,
  });

  /// Constructor factory para crear una instancia de [RatingModel] a partir de un [json] de tipo `Map<String, dynamic>`.
  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: double.tryParse((json['rate']).toString()),
        count: int.tryParse((json['count']).toString()),
      );

  /// Convierte una instancia de [RatingModel] a un mapa.
  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is RatingModel && other.rate == rate && other.count == count;
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}
