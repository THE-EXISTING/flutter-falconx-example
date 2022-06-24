import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';

class ProductImageCarousel extends ComponentGroup {
  const ProductImageCarousel({
    required this.imagePathList,
    this.loading = false,
  }) : super(key: const Key('ProductImageCarousel'));

  final List<String> imagePathList;
  final bool loading;

  @override
  _ProductImageCarouselState createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState
    extends ComponentLocaleStateX<ProductImageCarousel> {
  int pageNumber = 1;

  @override
  Widget buildDefault(BuildContext context) {
    final width = context.screenWidth;

    return SizedBox(
      width: width,
      height: width,
      child: Stack(
        children: [
          if (widget.loading)
            SkeletonX.rect(
              width: width,
              height: width,
              color: AppColors.blackLoading,
              borderRadius: BorderRadius.circular(0),
            ),
          if (!widget.loading)
            CarouselSlider(
              options: _setupCarouselOptions(),
              items: widget.imagePathList
                  .map((url) => _buildProductImage(size: width, imageUrl: url))
                  .toList(),
            ),
          if (!widget.loading)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(right: 12, bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.icon.blackDisabled,
                ),
                child: AppText(
                  '$pageNumber/${widget.imagePathList.length}',
                  style: AppTextStyle.primary.caption1.whiteActive,
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildProductImage({
    required double size,
    required String imageUrl,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: NetworkImageX.rect(
        imageUrl: imageUrl,
        height: size,
        width: size,
        loadingColor: AppColors.blackLoading,
      ),
    );
  }

  CarouselOptions _setupCarouselOptions() {
    return CarouselOptions(
      aspectRatio: 1,
      viewportFraction: 1,
      onPageChanged: (index, reason) {
        setState(() {
          pageNumber = index + 1;
        });
      },
    );
  }
}
