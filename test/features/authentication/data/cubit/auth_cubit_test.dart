import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_wallet/features/authentication/data/cubit/auth_cubit.dart';
import 'package:my_wallet/features/authentication/data/cubit/auth_state.dart';
import 'package:my_wallet/features/authentication/data/services/auth_entity.dart';
import 'package:my_wallet/features/authentication/data/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

class MockStorage extends Mock implements Storage {}

void main() {
  late AuthCubit authCubit;
  late MockAuthService mockAuthService;
  late Storage storage;

  setUp(() {
    mockAuthService = MockAuthService();
    storage = MockStorage();

    when(() => storage.write(any(), any())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);

    HydratedBloc.storage = storage;
    authCubit = AuthCubit(mockAuthService);
  });

  tearDown(() {
    authCubit.close();
  });

  group('AuthCubit', () {
    test('initial state is AuthStateInitial', () {
      expect(authCubit.state, isA<AuthStateInitial>());
    });

    test(
      'emits [AuthStateInProgress, AuthStateAuthenticated] on successful login',
      () async {
        when(
          () => mockAuthService.login(any(), any()),
        ).thenAnswer((_) async => LoginResponse(token: 'valid_token'));

        final expectedStates = [
          isA<AuthStateInProgress>(),
          isA<AuthStateAuthenticated>(),
        ];

        expectLater(authCubit.stream, emitsInOrder(expectedStates));
        await authCubit.login('test_user', 'password');
      },
    );

    test(
      'emits [AuthStateInProgress, AuthStateFailure] on login failure',
      () async {
        when(
          () => mockAuthService.login(any(), any()),
        ).thenThrow(Exception('Login failed'));

        final expectedStates = [
          isA<AuthStateInProgress>(),
          isA<AuthStateFailure>(),
        ];

        expectLater(authCubit.stream, emitsInOrder(expectedStates));
        await authCubit.login('test_user', 'password');
      },
    );

    test('emits [AuthStateInitial] on logout', () async {
      authCubit.logout();
      expect(authCubit.state, isA<AuthStateInitial>());
    });
  });
}
