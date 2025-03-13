// libs
import 'package:flutter/material.dart';
// widgets
import 'package:my_wallet/features/account/presentation/widgets/account_header_widget.dart';
import 'package:my_wallet/features/home/presentation/widgets/home_menu_widget.dart';
import 'package:my_wallet/features/reward/presentation/widgets/reward_point_widget.dart';
import 'package:my_wallet/features/reward/presentation/widgets/reward_progress_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: ClampingScrollPhysics(),
        primary: false,
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                AccountHeaderWidget(),
                SizedBox(height: 16),
                RewardProgressWidget(
                  rankName: 'Bronze',
                  points: 0.5,
                  morePoints: "121",
                ),
                SizedBox(height: 8),
                RewardPointWidget(point: "100"),
                SizedBox(height: 24),
                HomeMenuWidget(),
              ],
            ),
          ),
          // SizedBox(height: 8),
          // SliderImageWidget(),
          // SizedBox(height: 8),
          // SliderImageWidget(),
        ],
      ),
    );
  }
}
