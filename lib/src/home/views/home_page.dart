import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:go_router/go_router.dart';

class HomeMainPage extends AppScreen {
  const HomeMainPage._({required super.key});

  static Widget create() {
    return const HomeMainPage._(key: Key('HomeMainPage'));
  }

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends LocaleStateX<HomeMainPage> {
  bool isDisplayGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: AppSize.symmetricHorizontalInsets,
                  child: Text(
                    'Products',
                    style: AppTextStyle.primary.h5.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  AppSize.symmetricHorizontal,
                ),
                child: IconButton(
                  icon: Icon(
                    !isDisplayGrid
                        ? Icons.grid_view_rounded
                        : Icons.list_alt_rounded,
                    size: 24,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      isDisplayGrid = !isDisplayGrid;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child:
                isDisplayGrid ? _buildProductsGrid() : _buildProductsListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsListView() {
    return ListView.separated(
      padding: AppSize.listVerticalPadding,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (_, i) => ProductList(
        product: ProductModel.mock(),
      ),
      separatorBuilder: (_, __) => AppSize.listSeparator,
    );
  }

  Widget _buildProductsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      padding: AppSize.listVerticalPadding,
      mainAxisSpacing: AppSize.gapSize,
      crossAxisSpacing: AppSize.gapSize,
      children: List.generate(
        20,
        (i) => ProductGrid(product: ProductModel.mock()),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        AppRouter.detail,
        params: {
          'id': product.id,
        },
      ),
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
          // clipBehavior: Clip.none,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: NetworkImageX.rect(
                    imageUrl: product.imageList.first,
                    width: context.screenWidth,
                    height: double.infinity,
                    loadingColor: AppColors.blackLoading,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: AppSize.allInsets,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: AppTextStyle.primary.body1.primary,
                        ),
                        Text.rich(
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
                        ),
                        const Spacer(),
                        SizedBox(
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
                        ),
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
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        AppRouter.detail,
        params: {
          'id': product.id,
        },
      ),
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
                // Image.network(
                //   product.imageList.first,
                //   height: 120,
                //   fit: BoxFit.cover,
                // ),
                Expanded(
                  child: Container(
                    height: 120,
                    padding: AppSize.symmetricInsets,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: AppTextStyle.primary.body1.primary,
                        ),
                        Text.rich(
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
                        ),
                        const Spacer(),
                        SizedBox(
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
                        ),
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
}
