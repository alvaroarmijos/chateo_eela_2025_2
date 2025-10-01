import 'package:chateo_eela_2025_2/app/core/ui/ui.dart';
import 'package:flutter/material.dart';

// class SocialMediaButton extends StatelessWidget {
//   const SocialMediaButton({
//     super.key,
//     required this.iconPath,
//     this.color = Colors.grey,
//   });

//   factory SocialMediaButton.facebook() =>
//       SocialMediaButton(iconPath: 'assets/icons/icon_facebook.png');

//   factory SocialMediaButton.google() =>
//       SocialMediaButton(iconPath: 'assets/icons/icon_google.png');

//   factory SocialMediaButton.apple() =>
//       SocialMediaButton(iconPath: 'assets/icons/icon_apple.png');

//   final String iconPath;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: color),
//       ),
//       child: Image.asset(iconPath),
//     );
//   }
// }

enum SocialMediaType { facebook, google, apple }

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.socialMediaType,
    this.color = Colors.grey,
    this.iconColor,
  });

  final SocialMediaType socialMediaType;
  final Color color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final iconPath = switch (socialMediaType) {
      SocialMediaType.facebook => AppDrawables.facebookIcon,
      SocialMediaType.google => AppDrawables.googleIcon,
      SocialMediaType.apple => AppDrawables.appleIcon,
    };

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
      child: Image.asset(iconPath, color: iconColor),
    );
  }
}
