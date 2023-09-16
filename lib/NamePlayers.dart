import 'package:flutter/material.dart';
import 'package:xogames/XO_Games.dart';

class NamePlayers extends StatelessWidget {
  static const String routeName = "Names ";

  String player1 = " ";

  String player2 = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XO Game"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Enter Name player 1"),
                onChanged: (text) {
                  player1 = text;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Enter Name player 2"),
                onChanged: (text) {
                  player2 = text;
                },
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                height: 60,
                child: Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(XOGames.routeName,
                            arguments: XOGamesArgs(
                                player1: player1, player2: player2));
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.teal),
                      child: Text("Enter XO Game")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
