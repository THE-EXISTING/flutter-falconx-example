import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:flutter_falconx_example/src/product_detail/product_detail.dart';

class ProductDetailPage extends AppScreen {
  const ProductDetailPage._({required super.key});

  static Widget create({required String id}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductDetailBloc(productId: id)
            ..addInitEvent(ProductDetailEvent.getDetail),
        ),
      ],
      child: const ProductDetailPage._(
        key: Key('ProductDetail'),
      ),
    );
  }

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ScreenLocaleScaffoldBlocStateX<
    ProductDetailPage, ProductDetailBloc, Resource<ProductModel?>> {
  @override
  bool get extendBodyBehindAppBar => true;

  @override
  PreferredSizeWidget? buildAppBar(Resource<ProductModel?> state) {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  // final product = ProductModel.mock();

  @override
  Widget buildBody(BuildContext context, Resource<ProductModel?> resource) {
    showPageLoadingIndicatorFromResource(resource);
    final product = resource.data;
    if (product == null) {
      return buildBodyEmpty(context, resource);
    }
    return Column(
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
                ProductTitle(product: product),
                Space.height12,
                const ProductSeller(),
                Container(
                  width: context.screenWidth,
                  color: AppColors.blackDivider,
                  child: Space.height12,
                ),
                ProductDetail(product: product),
                Space.height24,
              ],
            ),
          ),
        ),
        const BottomButton(),
      ],
    );
  }

  @override
  Widget buildBodyEmpty(BuildContext context, Resource<ProductModel?> state) {
    // _dismissRefreshWhenSuccess(resource);
    return Center(
      child: AppEmptyView(
        text: 'Product not found',
        themeMode: ThemeMode.light,
      ),
    );
  }

  @override
  Widget buildBodyError(BuildContext context, Resource<ProductModel?> state) {
    return const ColoredBox(
      color: Colors.red,
    );
  }
}

// class _ProductDetailPageState extends LocaleStateX<ProductDetailPage> {
//   final product = ProductModel.mock();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   ProductImageCarousel(
//                     imagePathList: product.imageList,
//                   ),
//                   Space.height12,
//                   ProductTitle(product: product),
//                   Space.height12,
//                   const ProductSeller(),
//                   Container(
//                     width: context.screenWidth,
//                     color: AppColors.blackDivider,
//                     child: Space.height12,
//                   ),
//                   ProductDetail(product: product),
//                   Space.height24,
//                 ],
//               ),
//             ),
//           ),
//           const BottomButton(),
//         ],
//       ),
//     );
//   }
// }
