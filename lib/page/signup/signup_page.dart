import 'package:chat_app/app.dart';
import 'package:chat_app/common/common_route.dart';
import 'package:chat_app/common/common_widget.dart';
import 'package:chat_app/page/signup/signup_page_view_model.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  AuthMethod authMethod = AuthMethod();
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  SignUpPageViewModel model;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = SignUpPageViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: [
              commonIcon() ,
              text(text: App.signUpText , size: 45) ,
              Container(
                padding: const EdgeInsets.all(12.0) ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end ,
                  children: [
                    Form(
                      key: formKey ,
                      child: Column(
                        children: [
                          textField(userController , App.username , (val) {
                            return val.isEmpty || val.length < 4
                                ? "please enter username"
                                : null;
                          }) ,
                          textField(emailController , App.emailid ,
                                  (val) {
                            if (emailValid.hasMatch(val)) {
                              return null;
                            } else {
                              return "enter valid id ";
                            }
                          }) ,
                          textField(passController , App.password ,
                                  (val) {
                            return val.length < 6
                                ? "please enter maximum 6 character length of password"
                                : null;
                          }) ,
                        ] ,
                      ) ,
                    ) ,
                    forgotPassword(App.forgotPassword , 20) ,
                    commonButton(
                        text: App.signUpText ,
                        ontap: () async {
                          bool result = await authMethod
                              .SignUpWithEmailAndPassword(
                              emailController.text
                                  .toString()
                                  .trim(),
                              passController.text.toString().trim() ,
                              userController.text.toString().trim());
                          if (formKey.currentState.validate()) {
                            if (result==true) {
                              gotoSignIn(context);
                            }
                          }
                        })
                  ] ,
                ) ,
              ) ,
            ] ,
          ) ,
        ) ,
      ) ,
    );
  }

  forgotPassword(forgotantext , double size) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right: 12) ,
        child: Text(
          forgotantext ,
          style: TextStyle(fontSize: size) ,
        ) ,
      ) ,
      onTap: null ,
    );
  }
}
