import 'package:core/app.dart';

class RefreshTokenExpiredException extends Network5XXException {
  const RefreshTokenExpiredException({super.message})
      : super(
          service: RefreshTokenExpiredException.name,
          code: 500,
        );
  static const name = 'REFRESH_TOKEN_EXPIRED';
}
