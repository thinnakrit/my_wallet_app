import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_wallet/features/account/account_module.dart';
import 'package:my_wallet/features/account/data/cubit/account_cubit.dart';
import 'package:my_wallet/features/authentication/authentication_module.dart';
import 'package:my_wallet/features/authentication/data/cubit/auth_cubit.dart';
import 'package:my_wallet/features/authentication/data/services/auth_service.dart';
import 'package:my_wallet/features/authentication/data/services/auth_service_impl.dart';
import 'package:my_wallet/features/home/home_module.dart';
import 'package:my_wallet/features/reward/reward_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<AuthService>(AuthServiceImpl.new);
    i.addSingleton<AccountCubit>(AccountCubit.new);
    i.addSingleton<AuthCubit>(AuthCubit.new);
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/account', module: AccountModule());
    r.module('/authentication', module: AuthenticationModule());
    r.module('/reward', module: RewardModule());
  }
}
