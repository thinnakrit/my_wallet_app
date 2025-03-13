import 'package:flutter/material.dart';

import 'package:my_wallet/features/home/logic/main_bottom_menu_controller.dart';

class MainBottomMenuWidget extends StatelessWidget {
  const MainBottomMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mainBottomMenuController = MainBottomMenuController();

    return ValueListenableBuilder<int>(
      valueListenable: mainBottomMenuController.currentIndexNotifier,
      builder: (context, currentIndex, child) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedFontSize: 14.0,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.gamepad),
              label: 'Activity',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard),
              label: 'Reward',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Coupon',
            ),
          ],
          onTap: mainBottomMenuController.navigateToPage,
        );
      },
    );
  }
}
