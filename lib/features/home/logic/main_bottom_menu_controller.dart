import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainBottomMenuController {
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  void navigateToPage(int index) {
    currentIndexNotifier.value = index;
    _navigateToPage(index);
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Modular.to.navigate('/tab/home');
        break;
      case 1:
        Modular.to.navigate('/tab/activity');
        break;
      case 2:
        Modular.to.navigate('/tab/wallet');
        break;
      case 3:
        Modular.to.navigate('/tab/reward');
        break;
      case 4:
        Modular.to.navigate('/tab/coupon');
        break;
      default:
        Modular.to.navigate('/tab/home');
    }
  }
}
