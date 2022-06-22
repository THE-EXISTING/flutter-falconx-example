import 'package:core/app.dart';

class BottomButton extends AppComponent {
  const BottomButton({
    super.key,
  });

  @override
  Widget buildDefault(BuildContext context) {
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
