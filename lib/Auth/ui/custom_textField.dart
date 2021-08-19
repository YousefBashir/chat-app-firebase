import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  IconData icon;

  CustomTextField(this.controller, this.label,this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: this.label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
