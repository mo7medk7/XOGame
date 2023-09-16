import 'package:flutter/material.dart';
import 'package:xogames/Button.dart';

class XOGames extends StatefulWidget {
  static const String routeName = "XoGames ";

  @override
  State<XOGames> createState() => _XOGamesState();
}

class _XOGamesState extends State<XOGames> {
  List<String> boardState = ["", "", "", "", "", "", "", "", ""];
  int player1 = 0;
  int player2 = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as XOGamesArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text("XOGames"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${args.player1} (X)",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text("$player1",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${args.player2} (O)",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$player2",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                      text: boardState[0],
                      onButtonClicked: onButtonClicked,
                      index: 0),
                  Button(
                      text: boardState[1],
                      onButtonClicked: onButtonClicked,
                      index: 1),
                  Button(
                      text: boardState[2],
                      onButtonClicked: onButtonClicked,
                      index: 2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                      text: boardState[3],
                      onButtonClicked: onButtonClicked,
                      index: 3),
                  Button(
                      text: boardState[4],
                      onButtonClicked: onButtonClicked,
                      index: 4),
                  Button(
                      text: boardState[5],
                      onButtonClicked: onButtonClicked,
                      index: 5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                      text: boardState[6],
                      onButtonClicked: onButtonClicked,
                      index: 6),
                  Button(
                      text: boardState[7],
                      onButtonClicked: onButtonClicked,
                      index: 7),
                  Button(
                      text: boardState[8],
                      onButtonClicked: onButtonClicked,
                      index: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 0;

  void onButtonClicked(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = "X";
    } else {
      boardState[index] = "O";
    }
    counter++;
    if (winCheck("X")) {
      player1 += 1;
      initBoard();
    } else if (winCheck("O")) {
      player2 += 1;
      initBoard();
    } else if (counter == 9) {
      initBoard();
    }

    setState(() {});
  }

  bool winCheck(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }

    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardState = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
  }
}

class XOGamesArgs {
  String player1;

  String player2;

  XOGamesArgs({required this.player2, required this.player1});
}
