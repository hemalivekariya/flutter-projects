import 'package:chat_app/common/common_route.dart';
import 'package:chat_app/common/common_widget.dart';
import 'package:chat_app/page/chatUserList/chatUserListPage_view_model.dart';
import 'package:flutter/material.dart';
import '../../app.dart';
class ChatUserList extends StatefulWidget {
  @override
  ChatUserListState createState() => ChatUserListState();
}
class ChatUserListState extends State<ChatUserList> {
  ChatUserListViewModel model;
  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ChatUserListViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            weChatAppBar(context, App.ChatText),
            IconButton(
              icon: Icon(
                Icons.navigate_next,
                size: 60,
              ),
              onPressed: () {
                gotoChatRoom(context);
              },
            )
          ],
        ),
        floatingActionButton: searchButton(),
      ),
    );
  }
  searchButton(){
    return FloatingActionButton(
      child: Icon(Icons.search),
      backgroundColor: ColorRes.darkGreen,
    );
  }
}
