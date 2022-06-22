import 'package:core/app.dart';

class ProductSeller extends AppComponent {
  const ProductSeller({
    super.key,
  });

  @override
  Widget buildDefault(BuildContext context) {
    return Container(
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
    );
  }
}
