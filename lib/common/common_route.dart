import 'package:chat_app/page/chat/chat_page.dart';
import 'package:chat_app/page/chatUserList/chatUserList_page.dart';
import 'package:chat_app/page/signin/signin_page.dart';
import 'package:flutter/material.dart';
gotoSignIn(context)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
gotoChatListUser(context)=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatUserList()));
gotoChatRoom(context)=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatRoom()));
