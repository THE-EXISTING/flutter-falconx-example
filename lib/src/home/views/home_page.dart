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
  bool _isFocusMenu = false;

  @override
  Widget buildBodyError(
    BuildContext context,
    Resource<ProductListModel?> state,
  ) {
    return const Scaffold(
      body: Center(
        child: Text("There's someting wrong. 😥"),
      ),
    );
  }

  @override
  Widget buildBodyLoading(
    BuildContext context,
    Resource<ProductListModel?> state,
  ) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget buildBody(BuildContext context, Resource<ProductListModel?> resource) {
    // showPageLoadingIndicatorFromResource(resource);
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: AppSize.allInsets,
            child: Row(
              children: [
                _buildTitle(),
                _buildChangeDisplay(),
              ],
            ),
          ),
        ),
        Expanded(
          child: resource.data?.productList.isEmpty ?? true
              ? const Center(child: Text("There's no data"))
              : isDisplayGrid
                  ? _buildProductsGrid(resource)
                  : _buildProductsListView(resource),
        ),
      ],
    );
  }

  Widget _buildChangeDisplay() {
    return Focus(
      autofocus: true,
      onFocusChange: (val) => setState(() {
        _isFocusMenu = val;
      }),
      onKey: (context, event) {
        if (event.hasSubmitIntent) {
          setState(() {
            isDisplayGrid = !isDisplayGrid;
          });
          // widget.onTap!();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: _isFocusMenu ? 1.05 : 1.0,
        child: IconButton(
          icon: Icon(
            !isDisplayGrid ? Icons.grid_view_rounded : Icons.list_alt_rounded,
            size: 24,
            color: AppColors.black,
          ),
          onPressed: () {
            setState(() {
              isDisplayGrid = !isDisplayGrid;
            });
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Text(
        'สินค้า',
        style: AppTextStyle.primary.h5.normal,
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
    return AppResponsiveGridList(
      minItemWidth: 190,
      minItemsPerRow: 2,
      // padding: AppSize.listVerticalPadding,
      verticalGridSpacing: AppSize.gapSize,
      horizontalGridSpacing: AppSize.gapSize,
      // childAspectRatio: 6 / 10,
      children: List.generate(
        resource.data?.productList.length ?? 0,
        (i) => ProductGrid(
          product: resource.data!.productList[i],
        ),
      ),
    );
  }
}
