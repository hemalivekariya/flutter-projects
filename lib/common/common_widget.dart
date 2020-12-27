import 'package:flutter/material.dart';

import '../app.dart';

weChatAppBar(context,String txt) {
  return Container(
    height: MediaQuery.of(context).size.height / 10,
    width: MediaQuery.of(context).size.width / 1,
    child: Center(child: Text(txt,style: TextStyle(color: ColorRes.white,fontSize: 30),)),
    decoration: BoxDecoration(
        color: ColorRes.darkGreen,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
  );
}

commonIcon() {
  return Center(
    child: Container(
        height: 150,
        width: 300,
        child: Image.asset(
          "${App.weChatIcon}",
        )),
  );
}

text({String text, double size}) {
  return Text(
    text,
    style: TextStyle(color: Colors.green[800], fontSize: size),
  );
}

textField(TextEditingController controller, String hintText,[FormFieldValidator<String> validator] ){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      validator: validator,
      style: TextStyle(fontSize: 20),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        hintText: hintText,
        hintStyle: TextStyle(color: ColorRes.black),
      ),
    ),
  );
}


commonButton({Function ontap, String text}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
          color: ColorRes.darkGreen,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 30, color: ColorRes.white),
        ),
      ),
    ),
  );
}


