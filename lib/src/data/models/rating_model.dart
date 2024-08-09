final class RatingModel {
  final double? rate;
  final int? count;

  const RatingModel({
    this.rate,
    this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: double.tryParse((json['rate']).toString()),
        count: int.tryParse((json['count']).toString()),
      );

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
