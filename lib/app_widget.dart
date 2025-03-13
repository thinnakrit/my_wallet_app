import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_wallet/shared/themes/my_wallet_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/tab/home');

    return MaterialApp.router(
      title: 'My Wallet',
      debugShowCheckedModeBanner: false,
      theme: MyWalletTheme.themeData,
      routerConfig: Modular.routerConfig,
    );
  }
}
