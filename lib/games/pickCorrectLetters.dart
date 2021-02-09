import 'package:GuessingGame/components/guessingButton.dart';
import 'package:GuessingGame/components/roundButton.dart';
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
  String _guess = '';
  List<String> _usedIndexes = [];
  Set<int> _breakPoints = Set();

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
    final splitName = item.name.split(' ');
    List<GuessingButton> options = [];
    int _breakPointCounter = 0;
    splitName.asMap().forEach((nameIndex, name) {
      if(nameIndex != splitName.length  - 1){
        _breakPointCounter += name.length;
        if(nameIndex != 0){
          _breakPointCounter++;
        }
        _breakPoints.add(_breakPointCounter);
      }
      final split_name = name.split('');
      split_name.asMap().forEach((letterIndex, letter) {
        if(!_usedIndexes.contains('$nameIndex$letterIndex')){
          options.add(GuessingButton(letter, disabled: _usedIndexes.contains('$nameIndex$letterIndex'), onPressed: () {
            setState(() {
              _guess += letter;
              print(_breakPoints);
              if(_breakPoints.contains(_guess.length)){
                _guess += ' ';
              }
              _usedIndexes.add('$nameIndex$letterIndex');
              if(_guess.length == item.name.length) {
                if(_guess == item.name){
                  _score++;
                }
                _counter++;
                _guess = '';
                _usedIndexes = [];
                _breakPoints = Set();
              }
            });
          }));
        }
      });
    });
    options..shuffle();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_guess, style: TextStyle(fontSize: 30),),
                RoundButton(Icon(Icons.chevron_left), visible: _guess.length > 0, onPressed: () {
                  setState(() {
                    if(_guess[_guess.length - 1] == ' ') {
                      _guess = _guess.substring(0, _guess.length - 1);
                    }
                    _usedIndexes.removeLast();
                    _guess = _guess.substring(0, _guess.length - 1);
                  });
                }),
                RoundButton(Icon(Icons.clear), visible: _guess.length > 0, onPressed: () {
                  setState(() {
                    _guess = '';
                    _usedIndexes = [];
                  });
                })
              ],
            ),
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
