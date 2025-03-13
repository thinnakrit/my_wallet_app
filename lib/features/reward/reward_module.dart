// libs
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_wallet/features/reward/presentation/screens/reward_history_screen.dart';
import 'package:my_wallet/features/reward/presentation/screens/reward_screen.dart';

class RewardModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.rightToLeft,
      child: (context) => RewardScreen(),
    );
    r.child(
      '/history',
      transition: TransitionType.rightToLeft,
      child: (context) => RewardHistoryScreen(),
    );
  }
}
