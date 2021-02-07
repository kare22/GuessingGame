import 'package:flutter/material.dart';

import '../components/gameItem.dart';

class PickOneName extends StatefulWidget {
  List<GameItem> items;
  String type;

  PickOneName(this.items, this.type);

  @override
  _PickOneNameState createState() => _PickOneNameState(items, type);
}

class _PickOneNameState extends State<PickOneName> {
  int _counter = 0;
  int _score = 0;
  List<GameItem> items;
  String type;

  _PickOneNameState(this.items, this.type);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

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
        _incrementCounter();
      },));
    }
    options.add(RaisedButton(child: Text(item.name), onPressed: () {
      _incrementScore();
      _incrementCounter();
    },));
    options..shuffle();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/$type/' + item.fileUrl),
              width: 100,
            ),
            Text(
              '$_score/$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Wrap(children: options,)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
