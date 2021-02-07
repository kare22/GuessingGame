
import 'package:flutter/material.dart';
import '../components/menuItem.dart';
import 'gameDrawer.dart';
import 'pickOneName.dart';
import '../components/gameItem.dart';

class GameRoute extends StatelessWidget {
  final Map<String, List<GameItem>> itemsData = {
    'composers': [
      GameItem('Ludwig van Beethoven', 'beethoven.jpg'),
      GameItem('Wolfgang Amadeus Mozart', 'mozart.jpg'),
      GameItem('Niccolò Paganini', 'paganini.jpg'),
      GameItem('Sergei Prokofiev', 'prokofiev.jpg'),
    ],
    'chess_players': [
      GameItem('Paul Keres', 'keres.jpg'),
      GameItem('Robert James Fischer', 'fischer.jpg'),
      GameItem('Paul Morphy', 'morphy.jpg'),
      GameItem('Richard Réti', 'reti.jpg'),
      GameItem('François-André Danican Philidor', 'philidor.jpg'),
      GameItem('Tigran Petrosian', 'petrosian.jpg'),
      GameItem('José Raúl Capablanca', 'capablanca.jpg'),
    ],
    'scientists': [
      GameItem('Albert Einstein', 'einstein.jpg'),
      GameItem('Stephen Hawking', 'hawking.jpg'),
      GameItem('Ernest Rutherford', 'rutherford.jpg'),
      GameItem('Marie Curie', 'curie.jpg'),
    ]
  };

  MenuItem menuItem;
  List<GameItem> items;

  GameRoute(this.menuItem) {
    items = itemsData[menuItem.type];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: GameDrawer(),
      appBar: AppBar(
        title: Text(menuItem.name),
      ),
      body: Center(child: PickOneName(items, menuItem.type)),
    );
  }
}