import 'package:chat_app/common/common_route.dart';
import 'package:chat_app/common/common_widget.dart';
import 'package:chat_app/page/signin/signin_page_view_model.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  AuthMethod authMethod = AuthMethod();
  SignInPageViewModel model;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = SignInPageViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonIcon(),
              text(text: App.signInText, size: 45),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    textField(emailController, App.emailid, (val) {
                      if (emailValid.hasMatch(val)) {
                        return null;
                      } else {
                        return "enter valid id ";
                      }
                    }),
                    textField(passController, App.password, (val) {
                      return val.length < 6
                          ? "please enter maximum 6 character length of password"
                          : null;
                    }),
                    commonButton(
                        text: App.signInText,
                        ontap: () async {
                          UserCredential userResult = await authMethod.SignInWithEmailAndPassword(
                              emailController.text.toString().trim(),
                              passController.text.toString().trim());
                          print("user results..........$userResult");
                          if (userResult!=null) {
                            print("user result not null");
                            gotoChatListUser(context);
                          } else {
                            return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                      ),
                                      title: Text("wrong email and password"),
                                    ));
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
callback: () async {
              final userEmail = emailController.text.toString().trim();

              final userPass = passwordController.text.toString().trim();
              UserCredential result = await loginUser(userEmail, userPass);
              if (result != null) {
                gotoChtRoomPage(context);
              } else {
                return showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          title: Text(App.errorEmail1),
                        ));
              }
            }
 */
