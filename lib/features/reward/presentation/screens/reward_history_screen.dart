import 'package:flutter/material.dart';
import 'package:no_screenshot/no_screenshot.dart';

class RewardHistoryScreen extends StatefulWidget {
  const RewardHistoryScreen({super.key});
  @override
  RewardHistoryScreenState createState() => RewardHistoryScreenState();
}

class RewardHistoryScreenState extends State<RewardHistoryScreen> {
  final _noScreenshot = NoScreenshot.instance;

  void disableScreenshot() async {
    bool result = await _noScreenshot.screenshotOff();
    debugPrint('ScreenshotScreenshot Off: $result');
  }

  void toggleScreenshot() async {
    bool result = await _noScreenshot.toggleScreenshot();
    debugPrint('Toggle Screenshot: $result');
  }

  @override
  void initState() {
    disableScreenshot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reward History')),
      body: Center(
        child: ElevatedButton(
          onPressed: toggleScreenshot,
          child: const Text('Toggle Screenshot'),
        ),
      ),
    );
  }
}
