import 'package:flutter/material.dart';

class SeparateInput extends StatelessWidget {
  Function onChanged;
  String hint;
  SeparateInput({this.hint, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        onChanged: (text) => onChanged(text),
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