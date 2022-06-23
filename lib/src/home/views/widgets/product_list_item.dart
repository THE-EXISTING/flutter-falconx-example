import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatelessWidget {
  const ProductList({
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
  Widget build(BuildContext context) {
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
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: AppRadius.smallRadius,
              color: Colors.white,
            ),
            child: Row(
              children: [
                NetworkImageX.rect(
                  imageUrl: product.imageList.first,
                  width: 120,
                  height: 120,
                  loadingColor: AppColors.blackLoading,
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    padding: AppSize.symmetricInsets,
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
      height: 24,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: product.rating.toInt(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => const Icon(
          Icons.star_rounded,
          size: 24,
          color: Colors.amber,
        ),
        separatorBuilder: (_, __) => AppSize.listSeparator,
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      product.name,
      style: AppTextStyle.primary.body1.primary,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
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
}
