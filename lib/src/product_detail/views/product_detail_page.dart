import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:flutter_falconx_example/src/product_detail/product_detail.dart';

class ProductDetailPage extends AppScreen {
  const ProductDetailPage._({required super.key, required this.id});

  final String id;

  static Widget create({required String id}) {
    return ProductDetailPage._(
      key: const Key('ProductDetail'),
      id: id,
    );
  }

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends LocaleStateX<ProductDetailPage> {
  final product = ProductModel.mock();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProductImageCarousel(
                    imagePathList: product.imageList,
                  ),
                  Space.height12,
                  Padding(
                    padding: AppSize.symmetricHorizontalInsets,
                    child: Column(
                      children: [
                        AppText(
                          product.name,
                          style: AppTextStyle.primary.h5.normal,
                        ),
                        Space.height8,
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
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
                                separatorBuilder: (_, __) =>
                                    AppSize.listSmallSeparator,
                              ),
                            ),
                            Space.width12,
                            Container(
                              height: 24,
                              width: 2,
                              color: AppColors.blackTransparent20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Space.height12,
                  Container(
                    padding: AppSize.symmetricInsets,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 32,
                        ),
                        Space.width8,
                        AppText(
                          'Seller',
                          style: AppTextStyle.primary.body1.normal,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: context.screenWidth,
                    color: AppColors.blackDivider,
                    child: Space.height12,
                  ),
                  Container(
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
                  ),
                  Space.height24,
                ],
              ),
            ),
          ),
          const BottomButton(),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton.bottom(
            title: 'Buy',
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
