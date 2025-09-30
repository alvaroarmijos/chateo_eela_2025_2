import 'package:flutter/material.dart';

class OnboardingDivider extends StatelessWidget {
  const OnboardingDivider({super.key, this.textColor = Colors.white});

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('OR', style: TextStyle(color: textColor, fontSize: 14)),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
