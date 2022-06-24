import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

class ProductTitle extends AppComponent {
  const ProductTitle({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget buildDefault(BuildContext context) {
    return Padding(
      padding: AppSize.symmetricHorizontalInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            product.name,
            style: AppTextStyle.primary.h5.normal,
          ),
          Space.height8,
          Row(
            children: [
              AppText(
                product.rating.toStringAsFixed(1),
                style: AppTextStyle.primary.h6.primary,
              ),
              Space.width8,
              SizedBox(
                height: 24,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: product.rating.toInt(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => const Icon(
                    Icons.star_rate_rounded,
                    size: 24,
                    color: AppColors.primary,
                  ),
                  separatorBuilder: (_, __) => AppSize.listSmallSeparator,
                ),
              ),
              Space.width12,
              Container(
                height: 24,
                width: 2,
                color: AppColors.blackTransparent20,
              ),
              Space.width12,
              Container(
                height: 32,
                padding: AppSize.symmetricHorizontalInsets,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: AppRadius.largeRadius,
                ),
                child: Center(
                  child: Text(
                    product.category,
                    style: AppTextStyle.primary.body1.normal.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
