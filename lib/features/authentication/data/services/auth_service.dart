import 'package:my_wallet/features/authentication/data/services/auth_entity.dart';

abstract class AuthService {
  Future<LoginResponse>? login(String username, String password);

  Future<void> register();
}
