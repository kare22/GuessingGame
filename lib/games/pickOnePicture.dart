import 'package:flutter/material.dart';

import '../components/gameItem.dart';

class PickOnePicture extends StatefulWidget {
  List<GameItem> items;
  String type;

  PickOnePicture(this.items, this.type);

  @override
  _PickOnePictureState createState() => _PickOnePictureState(items, type);
}

class _PickOnePictureState extends State<PickOnePicture> {
  int _counter = 0;
  int _score = 0;
  List<GameItem> items;
  String type;

  _PickOnePictureState(this.items, this.type);

  @override
  Widget build(BuildContext context) {

    if(_counter >= items.length) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Game over, you scored $_score out of $_counter'),
              RaisedButton(child: Text('Try again!'), onPressed: () {
                setState(() {
                  _counter = 0;
                  _score = 0;
                });
              },)
            ],
          ),
        ),
      );
    }

    final item = items[_counter % items.length];
    final List<GameItem> shuffledItems = items.toList()..shuffle();
    List<RaisedButton> options = [];
    for (int i = 0; i < shuffledItems.length; i++) {
      if (options.length == 3) break; //We only want 3
      if (shuffledItems[i] == item) continue; //If selected item is right answer, skip
      options.add(RaisedButton(child: Text(shuffledItems[i].name), onPressed: () {
        setState(() => {_counter++});
      },));
    }
    options.add(RaisedButton(child: Text(item.name), onPressed: () {
      setState(() {
        _score++;
        _counter++;
      });
    },));
    options..shuffle();
    return Scaffold(
      body: Center(
        child: Text('yolo')
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
