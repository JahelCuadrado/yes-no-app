import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';


class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key, 
    required this.onValue
    });

  @override
  Widget build(BuildContext context) {

    final chatProvider   = context.watch<ChatProvider>();
    final textController = TextEditingController();
    final focusNode      = FocusNode();

    const outlineInputBorder =  UnderlineInputBorder(
      borderSide:  BorderSide(color: Colors.transparent)
    );

    final inputDecoration = InputDecoration(
        hintText: 'Escribe un mensaje con "?"',
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            chatProvider.sendMessage(textValue);
          },
        ),
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        chatProvider.sendMessage(value);
      }
    );
  }
}