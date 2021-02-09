import 'package:GuessingGame/components/guessingButton.dart';
import 'package:flutter/material.dart';

import '../components/gameItem.dart';

class PickCorrectLetters extends StatefulWidget {
  List<GameItem> items;
  String type;

  PickCorrectLetters(this.items, this.type);

  @override
  _PickCorrectLettersState createState() => _PickCorrectLettersState(items, type);
}

class _PickCorrectLettersState extends State<PickCorrectLetters> {
  int _counter = 0;
  int _score = 0;
  List<GameItem> items;
  String type;
  String guess = '';

  _PickCorrectLettersState(this.items, this.type);

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
    final names = item.name.split(' ');
    List<GuessingButton> options = [];
    names.forEach((name) {
      final split_name = name.split('');
      split_name.forEach((letter) {
        options.add(GuessingButton(letter, onPressed: () {
          setState(() {
            guess += letter;
          });
        }));
      });
    });
    options..shuffle();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(guess),
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
