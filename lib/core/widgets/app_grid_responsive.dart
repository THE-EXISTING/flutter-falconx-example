import 'package:core/app.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class AppResponsiveGridList extends AbstractResponsiveGridList {
  const AppResponsiveGridList({
    super.key,
    required super.minItemWidth,
    super.minItemsPerRow = 1,
    super.maxItemsPerRow,
    super.horizontalGridSpacing = 16,
    super.verticalGridSpacing = 16,
    super.horizontalGridMargin,
    super.verticalGridMargin,
    super.rowMainAxisAlignment = MainAxisAlignment.start,
    this.shrinkWrap = false,
    required super.children,
  });

  /// shrinkWrap property of [ListView.builder].
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Get the grid list items
        final items = getResponsiveGridListItems(constraints.maxWidth - 32);

        return ListView.builder(
          padding: AppSize.listVerticalPadding,
          itemCount: items.length,
          shrinkWrap: shrinkWrap,
          itemBuilder: (BuildContext context, int index) {
            return items[index];
          },
        );
      },
    );
  }
}
