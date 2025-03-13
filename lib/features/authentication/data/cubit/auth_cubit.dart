import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_wallet/features/authentication/data/cubit/auth_state.dart';
import 'package:my_wallet/features/authentication/data/services/auth_service.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthStateInitial());

  bool get isAuthentication => state.isAuthenticating;
  bool get isAuthenticated => state.isAuthenticated;

  Future<void> login(String username, String password) async {
    emit(AuthStateInProgress());
    try {
      final response = await _authService.login(username, password);
      if (response?.token == null) {
        throw Exception('Received invalid token');
      }
      emit(AuthStateAuthenticated(token: response!.token!));
    } catch (e) {
      emit(AuthStateFailure(errorMessage: e.toString()));
      addError(e.toString());
    }
  }

  Future<void> logout() async {
    emit(AuthStateInitial());
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
