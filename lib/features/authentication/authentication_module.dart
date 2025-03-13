// libs
import 'package:flutter_modular/flutter_modular.dart';
// features
import 'package:my_wallet/features/authentication/presentation/screens/auth_screen.dart';
import 'package:my_wallet/features/authentication/presentation/screens/finger_auth_screen.dart';
import 'package:my_wallet/features/authentication/presentation/screens/pin_auth_screen.dart';

class AuthenticationModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => AuthScreen(),
      children: [
        ChildRoute('/pin', child: (context) => PinAuthScreen()),
        ChildRoute('/finger', child: (context) => FingerAuthScreen()),
      ],
    );
  }
}
