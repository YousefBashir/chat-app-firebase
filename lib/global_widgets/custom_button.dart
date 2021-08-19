import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function function;

  CustomButton(this.title, this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 220,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(
                Colors.blue.shade800),
            shape: MaterialStateProperty.all<
                RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                //side: BorderSide(color:Color(0xFF3EB16F)),
              ),
            ),
          ),
          onPressed: () {
            function();
          },
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, color: Colors.white),
          ),
        ));
  }
}
