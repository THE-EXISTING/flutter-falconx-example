// ignore_for_file: constant_identifier_names

import 'package:core/app.dart';

class ProductResponse extends ResponseData {
  ProductResponse({
    required this.productId,
    required this.name,
    required this.price,
    required this.imageList,
    required this.description,
    required this.category,
    required this.rating,
  });
  factory ProductResponse.empty() => ProductResponse(
        productId: '',
        name: '',
        price: 0,
        imageList: [],
        description: '',
        category: '',
        rating: 0,
      );

  static Future<ProductResponse> fromJson(Map<String, dynamic>? json) async {
    if (json == null) return ProductResponse.empty();
    return ProductResponse(
      productId: json[PRODUCT_ID_FIELD] as String,
      name: json[NAME_FIELD] as String,
      price: json[PRICE_FIELD] as double,
      imageList: json[IMG_FIELD] as List<String>,
      description: json[DESCRIPTION_FIELD] as String? ?? '',
      category: json[CATEGORY_FIELD] as String,
      rating: json[RATING_FIELD] as double,
    );
  }

  static const String PRODUCT_ID_FIELD = 'productID';
  static const String NAME_FIELD = 'name';
  static const String IMG_FIELD = 'img';
  static const String PRICE_FIELD = 'price';
  static const String DESCRIPTION_FIELD = 'description';
  static const String CATEGORY_FIELD = 'category';
  static const String RATING_FIELD = 'rating';

  final String productId;
  final String name;
  final double price;
  final List<String> imageList;
  final String description;
  final String category;
  final double rating;

  @override
  List<Object?> get props => [
        productId,
        name,
        price,
        imageList,
        description,
        category,
        rating,
      ];
}
