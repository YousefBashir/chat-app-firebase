import 'package:chat_app_firebase/services/constants.dart';
import 'package:flutter/material.dart';

class FilledOutLineButton extends StatelessWidget {

   String btnText;
   VoidCallback press;
   bool isFilled;


   FilledOutLineButton({@required this.btnText,@required this.press,this.isFilled});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isFilled?Colors.white:Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.white),
        ),
        elevation: isFilled?2:0,
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 12,
              color: isFilled ? kContentColorLightTheme : Colors.white),
        ),
        onPressed: press);
  }
}
