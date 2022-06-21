// ignore_for_file: constant_identifier_names

import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

class ProductListResponse extends ResponseData {
  ProductListResponse({
    required this.products,
  });

  static const PRODUCTS_FIELD = 'products';

  final List<ProductResponse> products;

  @override
  List<Object?> get props => <Object?>[products];

  static Future<ProductListResponse> fromJson(
    Map<String, dynamic>? json,
  ) async {
    if (json == null || json[PRODUCTS_FIELD] == null) {
      return ProductListResponse(products: []);
    }

    return ProductListResponse(
      products: await (json[PRODUCTS_FIELD] as List<dynamic>).futureAsyncMap(
        (dynamic element) =>
            ProductResponse.fromJson(element as Map<String, dynamic>),
      ),
    );
  }
}
