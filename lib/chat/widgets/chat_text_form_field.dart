import 'package:chateo_eela_2025_2/app/core/ui/ui.dart';
import 'package:chateo_eela_2025_2/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextFormField extends StatefulWidget {
  const ChatTextFormField({super.key, required this.contactId});

  final String contactId;

  @override
  State<ChatTextFormField> createState() => _ChatTextFormFieldState();
}

class _ChatTextFormFieldState extends State<ChatTextFormField> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12).copyWith(bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _messageController,
                  minLines: 1,
                  maxLines: 5,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    filled: true,
                    fillColor: AppColors.greyForm,
                    hintText: 'Write your message',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGrey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyForm),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyForm),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              FloatingActionButton.small(
                onPressed: () {
                  final message = _messageController.text.trim();
                  context.read<ChatBloc>().add(
                    SendMessageEvent(
                      message: message,
                      contactId: widget.contactId,
                    ),
                  );
                  _messageController.clear();
                },
                shape: const CircleBorder(),
                elevation: 0,
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
