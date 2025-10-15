import 'package:chateo_eela_2025_2/app/core/widgets/widgets.dart';
import 'package:chateo_eela_2025_2/domain/models/contact.dart';
import 'package:flutter/material.dart';

class ChatAppBarTitle extends StatelessWidget {
  const ChatAppBarTitle({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ChatAvatar(name: contact.name, photoUrl: contact.photoUrl),
            SizedBox(
              width: 12,
              height: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: contact.statusColor,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListTile(
            title: Text(contact.name, style: textTheme.labelLarge),
            subtitle: Text(contact.statusDetail, style: textTheme.bodySmall),
          ),
        ),
      ],
    );
  }
}
