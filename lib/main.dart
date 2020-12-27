import 'package:chat_app/page/signup/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorRes.darkGreen,
    //statusBarBrightness: Brightness.dark,
    statusBarColor: ColorRes.darkGreen,
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp , DeviceOrientation.portraitDown]).then((
      value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: ColorRes.green,
        fontFamily: App.font_name,
      ),
      home:SignUp(),
    );
  }
}

