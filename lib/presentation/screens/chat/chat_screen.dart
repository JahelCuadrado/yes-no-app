import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 220,
        leading:  
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){}),
            const SizedBox(
              width: 60,
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://kenh14cdn.com/thumb_w/660/203336854389633024/2021/9/1/photo-1-16304832141231584345047.jpg'),

                ),
              ),
            ),
            const Text('Mi amor ❤️', style: TextStyle(fontSize: 20)),
          ],
        ),

        
        // backgroundColor: const Color.fromRGBO(23, 33, 43, 1),
        // foregroundColor: Colors.white,             
      ),

      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index){
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble(message: message);
              }),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: MessageFieldBox(
            onValue: (value) {
              chatProvider.sendMessage(value);
            },
          ),
        ),
        ],
      ),
    );
  }
}