import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resethandler;
  Result(this.resultscore, this.resethandler);

  String get str {
    var phrase;
    if (resultscore <= 4) {
      phrase = 'You were good!';
    } else if (resultscore <= 8) {
      phrase = 'You were awesome!';
    } else {
      phrase = 'You were bad!';
    }
    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          str,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Restart Quiz!'),
          textColor: Colors.blue,
          onPressed: resethandler,
        ),
      ],
    ));
  }
}
