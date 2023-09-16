import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;

  Function onButtonClicked;

  int index;

  Button(
      {required this.text, required this.onButtonClicked, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(6),
            child: ElevatedButton(
                onPressed: () {
                  onButtonClicked(index);
                },
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text(
                  "$text ",
                  style: TextStyle(fontSize: 50),
                ))));
  }
}
