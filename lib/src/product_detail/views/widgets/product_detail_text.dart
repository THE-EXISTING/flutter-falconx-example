import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

class ProductDetail extends AppComponent {
  const ProductDetail({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget buildDefault(BuildContext context) {
    return Container(
      padding: AppSize.allInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'รายละเอียดสินค้า',
            style: AppTextStyle.primary.h6.normal,
          ),
          Space.height12,
          Text(
            product.description,
            style: AppTextStyle.primary.body1.normal,
          ),
        ],
      ),
    );
  }
}
