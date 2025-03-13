import 'package:flutter/material.dart';

class HomeMenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTab;

  const HomeMenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTab();
      },
      child: Column(
        spacing: 8,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xCCCCCCCC)),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, size: 36),
          ),
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
