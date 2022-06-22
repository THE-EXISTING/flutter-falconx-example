import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:go_router/go_router.dart';

class ProductGrid extends AppComponent {
  const ProductGrid({
    super.key,
    required this.product,
  });
  final ProductModel product;

  void _onTap(BuildContext context) {
    context.pushNamed(
      AppRouter.detail,
      params: {
        'id': product.id,
      },
    );
  }

  @override
  Widget buildDefault(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 3,
              blurRadius: 3,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: AppRadius.smallRadius,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageCarousel(context),
                Expanded(
                  child: Padding(
                    padding: AppSize.allInsets,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductName(),
                        _buildProductPrice(),
                        const Spacer(),
                        _buildRating(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRating() {
    return SizedBox(
      height: 16,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: product.rating.toInt(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => const Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        separatorBuilder: (_, __) => AppSize.listSeparator,
      ),
    );
  }

  Widget _buildProductPrice() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '฿',
            style: AppTextStyle.primary.body1.primary,
          ),
          TextSpan(
            text: product.price.toStringAsFixed(0),
            style: AppTextStyle.primary.h5.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      product.name,
      style: AppTextStyle.primary.body1.primary,
    );
  }

  Widget _buildImageCarousel(BuildContext context) {
    return Expanded(
      flex: 3,
      child: NetworkImageX.rect(
        imageUrl: product.imageList.first,
        width: context.screenWidth,
        height: double.infinity,
        loadingColor: AppColors.blackLoading,
      ),
    );
  }
}
