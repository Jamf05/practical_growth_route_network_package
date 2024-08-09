import 'package:practical_growth_route_network_package/src/data/models/rating_model.dart';

final class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingModel? rating;

  const ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: int.tryParse((json['id']).toString()),
        title: json['title'],
        price: double.tryParse((json['price']).toString()),
        description:
            json['description'] != null && json['description'] is String
                ? json['description']
                : '',
        category: json['category'] != null && json['category'] is String
            ? json['category']
            : '',
        image: json['image'] != null && json['image'] is String
            ? json['image']
            : '',
        rating: json['rating'] != null && json['rating'] is Map
            ? RatingModel.fromJson(json['rating'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ProductModel &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.description == description &&
        other.category == category &&
        other.image == image &&
        other.rating == rating;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      description.hashCode ^
      category.hashCode ^
      image.hashCode ^
      rating.hashCode;
}
