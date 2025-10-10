import 'package:chateo_eela_2025_2/app/core/ui/app_colors.dart';
import 'package:chateo_eela_2025_2/domain/models/contact.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final (status, color) = switch (contact.status) {
      true => ('Online', Colors.green),
      false => ('Offline', Colors.red),
    };
    return ListTile(
      onTap: () => {},
      leading: CircleAvatar(
        backgroundImage: NetworkImage(contact.photoUrl ?? ''),
      ),
      title: Text(contact.name),
      subtitle: Text(status, style: TextStyle(color: AppColors.darkGrey)),
      trailing: SizedBox(
        width: 12,
        height: 12,
        child: DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}
