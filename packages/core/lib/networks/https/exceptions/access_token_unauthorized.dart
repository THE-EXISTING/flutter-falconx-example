import 'package:core/app.dart';

class AccessTokenUnauthorizedException extends Network4XXException {
  const AccessTokenUnauthorizedException()
      : super(
          service: AccessTokenUnauthorizedException.name,
          code: 401,
        );
  static const name = 'ACCESS_TOKEN_UNAUTHORIZED';
}
