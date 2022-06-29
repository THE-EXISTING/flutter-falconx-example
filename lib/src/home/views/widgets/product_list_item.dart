import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _isFocused = false;
  void _onTap(BuildContext context) {
    context.pushNamed(
      AppRouter.detail,
      params: {
        'id': widget.product.id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onFocusChange: (value) => setState(() {
        _isFocused = value;
      }),
      onKey: (_, event) {
        if (event.hasSubmitIntent) {
          _onTap(context);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: AnimatedScale(
        scale: _isFocused ? 1.025 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: InkWell(
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
                      imageUrl: widget.product.imageList.first,
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
        ),
      ),
    );
  }

  Widget _buildRating() {
    return SizedBox(
      height: 22,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: widget.product.rating.toInt(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => const Icon(
          Icons.star_rounded,
          size: 24,
          color: Colors.amber,
        ),
        separatorBuilder: (_, __) => AppSize.listSmallSeparator,
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      widget.product.name,
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
            text: widget.product.price.toStringAsFixed(0),
            style: AppTextStyle.primary.h5.primary,
          ),
        ],
      ),
    );
  }
}
