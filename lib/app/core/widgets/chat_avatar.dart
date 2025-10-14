import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({super.key, this.photoUrl, required this.name});

  final String? photoUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return photoUrl == null
        ? Avatar(name: name, shape: AvatarShape.circle(20))
        : CircleAvatar(backgroundImage: NetworkImage(photoUrl!));
  }
}
