import 'package:chateo_eela_2025_2/app/core/ui/ui.dart';
import 'package:chateo_eela_2025_2/app/core/widgets/widgets.dart';
import 'package:chateo_eela_2025_2/domain/models/contact.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          Navigator.pushNamed(context, AppNavigator.chat, arguments: contact),
      leading: ChatAvatar(name: contact.name, photoUrl: contact.photoUrl),
      title: Text(contact.name),
      subtitle: Text(
        contact.statusDetail,
        style: TextStyle(color: AppColors.darkGrey),
      ),
      trailing: SizedBox(
        width: 12,
        height: 12,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: contact.statusColor,
          ),
        ),
      ),
    );
  }
}
