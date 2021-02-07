import 'package:flutter/material.dart';

import 'games/game.dart';
import 'components/menuItem.dart';

class Home extends StatelessWidget {
  final _menuItemsList = [
    MenuItem('Composers', 'composers'),
    MenuItem('Scientists', 'scientists'),
    MenuItem('Chess players', 'chess_players'),
  ];

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _menuItemsList.length * 2,
        itemBuilder: (context, item) {
          if (item.isOdd)
            return Divider(
              thickness: 2,
            );

          final index = item ~/ 2;
          final listItem = _menuItemsList[index];
          return ListTile(
            title: Text(listItem.name, style: TextStyle(fontSize: 18)),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeRoute(listItem)),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: _buildList(),
    );
  }
}


