// libs
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_wallet/features/account/presentation/screens/account_screen.dart';
import 'package:my_wallet/features/authentication/presentation/screens/auth_screen.dart';
// features
import 'package:my_wallet/features/home/presentation/screens/home_screen.dart';
import 'package:my_wallet/features/home/presentation/screens/main_screen.dart';
import 'package:my_wallet/features/reward/presentation/screens/reward_screen.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => MainScreen(),
      transition: TransitionType.noTransition,
      children: [
        ChildRoute('/tab/home', child: (context) => HomeScreen()),
        ChildRoute('/tab/activity', child: (context) => AccountScreen()),
        ChildRoute('/tab/wallet', child: (context) => AuthScreen()),
        ChildRoute('/tab/reward', child: (context) => RewardScreen()),
        ChildRoute('/tab/coupon', child: (context) => AuthScreen()),
      ],
    );
  }
}
