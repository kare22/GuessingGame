import 'package:flutter/material.dart';

class GameDrawer extends StatelessWidget {

  Function onTap;
  GameDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Choose game type',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Pick one picture'),
            onTap: () {
              onTap('pickOnePicture');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.texture),
            title: Text('Pick one name'),
            onTap: () {
              onTap('pickOneName');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.text_fields),
            title: Text('Write correct answer'),
            onTap: () {
              onTap('writeCorrectAnswer');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.radio_button_checked),
            title: Text('Pick correct letters'),
            onTap: () {
              onTap('pickCorrectLetters');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}