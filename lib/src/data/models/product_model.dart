import 'package:practical_growth_route_network_package/src/data/models/rating_model.dart';

/// Modelo que representa un producto.
final class ProductModel {
  /// Identificador único del producto.
  final int? id;

  /// Título del producto.
  final String? title;

  /// Precio del producto.
  final double? price;

  /// Descripción del producto.
  final String? description;

  /// Categoría del producto.
  final String? category;

  /// URL de la imagen del producto.
  final String? image;

  /// Modelo que representa la calificación del producto.
  final RatingModel? rating;

  /// Constructor de la clase [ProductModel].
  const ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  /// Crea una instancia de [ProductModel] a partir de [json] que es un mapa de tipo `Map<String, dynamic>`.
  ///
  /// [json] es un mapa que contiene los datos del producto.
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

  /// Convierte la instancia de [ProductModel] a un mapa de tipo `Map<String, dynamic>`.
  ///
  /// Retorna un mapa que representa los datos del producto.
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
