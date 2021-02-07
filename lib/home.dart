import 'package:GuessingGame/gameItem.dart';
import 'package:GuessingGame/games/pickOneName.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final String type;

  MenuItem(this.name, this.type);
}

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

class HomeRoute extends StatelessWidget {
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

  final MenuItem menuItem;
  List<GameItem> items;

  HomeRoute(this.menuItem) {
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

class GameDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
