import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  Function onPressed;
  Icon icon;
  bool visible;
  RoundButton(this.icon, {this.visible, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: FlatButton(
            minWidth: 0,
            height: 0,
            onPressed: onPressed,
            child: icon,
            shape: CircleBorder(),
            color: Colors.blue,
          ),
        ));
  }
}
