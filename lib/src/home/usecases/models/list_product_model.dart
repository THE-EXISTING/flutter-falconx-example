import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

class ProductListModel extends AppModel<ProductListModel> {
  ProductListModel({
    super.generatedId,
    required this.productList,
  });

  factory ProductListModel.fromMapResponse(ProductListResponse response) =>
      ProductListModel(
        productList: response.products
            .map((e) => ProductModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  factory ProductListModel.empty() => ProductListModel(productList: []);

  final List<ProductModel> productList;

  @override
  ProductListModel copyWith({
    String? generatedId,
    List<ProductModel>? productList,
  }) {
    return ProductListModel(
      generatedId: generatedId ?? this.generatedId,
      productList: productList ?? this.productList,
    );
  }

  @override
  List<Object?> get props => [productList];

  @override
  bool? get stringify => true;
}
