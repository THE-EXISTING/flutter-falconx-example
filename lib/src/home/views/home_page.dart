import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

class HomeMainPage extends AppScreen {
  const HomeMainPage._({required super.key});

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeProductBloc()..addInitEvent(HomeProductEvent.getProducts),
        ),
      ],
      child: const HomeMainPage._(key: Key('HomeMainPage')),
    );
  }

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends ScreenLocaleScaffoldBlocStateX<HomeMainPage,
    HomeProductBloc, Resource<ProductListModel?>> {
  bool isDisplayGrid = false;
  @override
  Widget buildBody(BuildContext context, Resource<ProductListModel?> resource) {
    showPageLoadingIndicatorFromResource(resource);
    return Column(
      children: [
        Row(
          children: [
            _buildTitle(),
            _buildChangeDisplay(),
          ],
        ),
        Expanded(
          child: isDisplayGrid
              ? _buildProductsGrid(resource)
              : _buildProductsListView(resource),
        ),
      ],
    );
  }

  Widget _buildChangeDisplay() {
    return Padding(
      padding: const EdgeInsets.all(
        AppSize.symmetricHorizontal,
      ),
      child: IconButton(
        icon: Icon(
          !isDisplayGrid ? Icons.grid_view_rounded : Icons.list_alt_rounded,
          size: 24,
          color: Colors.blue,
        ),
        onPressed: () {
          setState(() {
            isDisplayGrid = !isDisplayGrid;
          });
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Padding(
        padding: AppSize.symmetricHorizontalInsets,
        child: Text(
          'สินค้า',
          style: AppTextStyle.primary.h5.normal,
        ),
      ),
    );
  }

  Widget _buildProductsListView(Resource<ProductListModel?> resource) {
    return ListView.separated(
      padding: AppSize.listVerticalPadding,
      shrinkWrap: true,
      itemCount: resource.data?.productList.length ?? 0,
      itemBuilder: (_, i) => ProductList(
        product: resource.data!.productList[i],
      ),
      separatorBuilder: (_, __) => AppSize.listSeparator,
    );
  }

  Widget _buildProductsGrid(Resource<ProductListModel?> resource) {
    return GridView.count(
      crossAxisCount: 2,
      padding: AppSize.listVerticalPadding,
      mainAxisSpacing: AppSize.gapSize,
      crossAxisSpacing: AppSize.gapSize,
      childAspectRatio: 6 / 10,
      children: List.generate(
        resource.data?.productList.length ?? 0,
        (i) => ProductGrid(
          product: resource.data!.productList[i],
        ),
      ),
    );
  }
}
