import 'package:my_wallet/core/services/api_endpoint.dart';
import 'package:my_wallet/core/services/api_service.dart';
import 'package:my_wallet/features/authentication/data/services/auth_entity.dart';

import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<LoginResponse>? login(String username, String password) async {
    try {
      final body = LoginRequest(username: username, password: password);

      final Uri url = ApiEndpoint.apiBuilder(
        service: EService.loremService,
        path: 'jwt',
      );

      final response = await ApiService.post<LoginResponse, LoginRequest>(
        url,
        body,
        (json) => LoginResponse.fromJson(json),
      );

      if (response.token?.isNotEmpty ?? false) {
        return response;
      } else {
        throw Exception('Received invalid token');
      }
    } catch (e) {
      throw Exception('Failed to login: ${e.toString()}');
    }
  }

  @override
  Future<void> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
