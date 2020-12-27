import 'package:chat_app/common/common_widget.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import 'chat_page_view_model.dart';

class ChatRoom extends StatefulWidget {
  @override
  ChatRoomState createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoom> {
  TextEditingController chatTypingController = TextEditingController();
  ChatPageViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ChatPageViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            weChatAppBar(context, App.name),
            Spacer(),
            Row(
              children: [
                chatTypingKeyBord(context, chatTypingController),
                sentButton(context, null)
              ],
            ),
          ],
        ),
      ),
    );
  }

  chatTypingKeyBord(context, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            style: TextStyle(fontSize: 25),
            controller: controller,
            decoration: InputDecoration(
              hintText: "Message...",
              hintStyle: TextStyle(fontSize: 25),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: ColorRes.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }

  sentButton(context, Function ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: CircleAvatar(
          radius: 30,
          child: Icon(Icons.send),
        ),
      ),
    );
  }
}
