// libs
import 'package:flutter_modular/flutter_modular.dart';
// features
import 'package:my_wallet/features/account/presentation/screens/account_screen.dart';
import 'package:my_wallet/features/account/presentation/screens/new_account_screen.dart';

class AccountModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.rightToLeft,
      child: (context) => AccountScreen(),
      children: [ChildRoute('/new', child: (context) => NewAccountScreen())],
    );
  }
}
