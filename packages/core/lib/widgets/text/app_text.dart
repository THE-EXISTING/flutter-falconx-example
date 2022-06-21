import 'package:core/app.dart';

enum TextEnum { h1, h2, h3, h4, h5, h6, body1, body2, caption1, caption2 }

class AppText extends AppComponent {
  const AppText(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.softWrap,
    this.overflow,
    this.maxLines,
  });

  final String? data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;

  @override
  Widget buildDefault(BuildContext context) {
    return Text(
      data ?? '',
      key: key,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      style: style,
      maxLines: maxLines,
    );
  }
}
