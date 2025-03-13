import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_wallet/features/home/presentation/widgets/home_menu_item_widget.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisCount: 4,
      childAspectRatio: 1 / 1.2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomeMenuItemWidget(
          icon: Icons.account_balance_wallet,
          title: 'Redeem Reward',
          onTab: () {
            Modular.to.pushNamed('/reward/redeem');
          },
        ),
        HomeMenuItemWidget(
          icon: Icons.point_of_sale,
          title: 'Point Exchange',
          onTab: () {
            Modular.to.pushNamed('/point/exchange');
          },
        ),
        HomeMenuItemWidget(
          icon: Icons.history,
          title: 'History',
          onTab: () {
            Modular.to.pushNamed('/reward/history');
          },
        ),
        HomeMenuItemWidget(
          icon: Icons.devices_other,
          title: 'Others',
          onTab: () {
            Modular.to.pushNamed('/other-menu');
          },
        ),
      ],
    );
  }
}
