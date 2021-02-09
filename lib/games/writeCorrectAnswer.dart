import 'package:GuessingGame/components/separateInput.dart';
import 'package:flutter/material.dart';

import '../components/gameItem.dart';

class WriteCorrectAnswer extends StatefulWidget {
  List<GameItem> items;
  String type;

  WriteCorrectAnswer(this.items, this.type);

  @override
  _WriteCorrectAnswerState createState() => _WriteCorrectAnswerState(items, type);
}

class _WriteCorrectAnswerState extends State<WriteCorrectAnswer> {
  int _counter = 0;
  int _score = 0;
  List<GameItem> items;
  String type;

  _WriteCorrectAnswerState(this.items, this.type);

  @override
  Widget build(BuildContext context) {

    if(_counter >= items.length) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
          )
        ),
      );
    }

    final item = items[_counter % items.length];
    var _controller = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              SeparateInput(hint: 'name', controller: _controller,),
              RaisedButton(child: Text('Submit'), onPressed: () {
                setState(() {
                  if(_controller.text == item.name){
                    _score++;
                  }
                  _counter++;
//                _controller.clear();
                });
              },)
            ],
          ),
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
