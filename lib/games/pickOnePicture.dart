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
    List<GestureDetector> pictures = [];
    for (int i = 0; i < shuffledItems.length; i++) {
      if (pictures.length == 3) break; //We only want 3
      if (shuffledItems[i] == item) continue; //If selected item is right answer, skip
      pictures.add(GestureDetector(
        onTap: () => {setState(() => { _counter++ })},
        child: Image(
          image: AssetImage('assets/$type/' + shuffledItems[i].fileUrl), width: 100,
        ),
      ));
    }
    pictures.add(GestureDetector(
      onTap: () => {setState(() { _counter++; _score++; })},
      child: Image(
        image: AssetImage('assets/$type/' + item.fileUrl), width: 100,
      ),
    ));
    pictures..shuffle();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(children: pictures,),
            Text('$_score/$_counter'),
            Text(item.name),
          ],
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
