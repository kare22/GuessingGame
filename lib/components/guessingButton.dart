import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuessingButton extends StatelessWidget {
  String text;
  Function onPressed;
  bool disabled;
  GuessingButton(this.text, {this.onPressed, this.disabled});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: MaterialButton(

        onPressed: disabled == true ? null : onPressed,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: Colors.grey,
        minWidth: 0,
        height: 0,
        padding: EdgeInsets.all(4),
        child: Text(text),
      ),
    );
  }

}