import 'package:flutter/material.dart';

class RewardProgressWidget extends StatelessWidget {
  final String? rankName;
  final double? points;
  final String? morePoints;

  const RewardProgressWidget({
    super.key,
    this.rankName,
    this.points,
    this.morePoints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xCCCCCCCC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$rankName",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Collect',
              style: TextStyle(color: Colors.grey),
              children: [
                TextSpan(
                  text: ' $morePoints wow ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'to receive a special prize',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: points,
                  minHeight: 8,
                  backgroundColor: Color(0xCCCCCCCC),
                  borderRadius: BorderRadius.circular(8),
                  valueColor: const AlwaysStoppedAnimation(Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
