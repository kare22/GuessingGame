import 'package:flutter/material.dart';

class SeparateInput extends StatelessWidget {
  Function onChanged;
  String hint;
  TextEditingController controller;
  SeparateInput({this.hint, this.onChanged, this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        style: TextStyle(
          letterSpacing: 1,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
            hintText: hint,
            hintStyle: TextStyle( color: Colors.black26),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}