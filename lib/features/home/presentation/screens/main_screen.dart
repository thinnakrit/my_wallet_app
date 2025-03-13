// libs
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_wallet/features/home/presentation/widgets/main_bottom_menu_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: false,
        resizeToAvoidBottomInset: true,
        body: RouterOutlet(),
        bottomNavigationBar: MainBottomMenuWidget(),
      ),
    );
  }
}
