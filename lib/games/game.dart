
import 'dart:convert';

import 'package:GuessingGame/games/pickCorrectLetters.dart';
import 'package:GuessingGame/games/writeCorrectAnswer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/menuItem.dart';
import 'gameDrawer.dart';
import 'pickOneName.dart';
import '../components/gameItem.dart';
import 'pickOnePicture.dart';

class GameRoute extends StatefulWidget {

  MenuItem menuItem;
  GameRoute(this.menuItem);

  @override
  State<StatefulWidget> createState() => GameRouteState(menuItem);
}

class GameRouteState extends State<GameRoute> {
  Map<String, List<GameItem>> itemsData = {};
  String currentRoute = 'pickOneName';
  MenuItem menuItem;
  List<GameItem> items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data.json');
    final data = await json.decode(response);
    Map<String, List<GameItem>> itemsDecoded = {};
    if(data != null) {
      data.forEach((game) {
        final List<GameItem> gameItems = [];
        game['items'].forEach((item) {
          gameItems.add(GameItem(item['name'], item['file_path']));
        });
        itemsDecoded[game['type']] = gameItems;
      });
    }
    setState(() {
      itemsData = itemsDecoded;
      items = itemsData[menuItem.type];
    });
  }

  GameRouteState(this.menuItem) {
    readJson();
  }

  _getGameType() {
    if(items != null) {
      items..shuffle();
    }
    switch(currentRoute) {
      case 'pickOnePicture':
        return PickOnePicture(items, menuItem.type);
      case 'writeCorrectAnswer':
        return WriteCorrectAnswer(items, menuItem.type);
      case 'pickCorrectLetters':
        return PickCorrectLetters(items, menuItem.type);
      default:
        return PickOneName(items, menuItem.type);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget game = _getGameType();
    return Scaffold(
      endDrawer: GameDrawer(onTap: (String route) {
        setState(() {
          currentRoute = route;
        });
      }),
      appBar: AppBar(
        title: Text(menuItem.name),
      ),
      body: Center(child: game
      ),
    );
  }
}