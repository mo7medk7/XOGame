import 'package:flutter/material.dart';
import 'package:xogames/NamePlayers.dart';
import 'package:xogames/XO_Games.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamePlayers.routeName,
      routes: {
        XOGames.routeName: (context) => XOGames(),
        NamePlayers.routeName: (context) => NamePlayers(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
