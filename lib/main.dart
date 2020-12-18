import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp()); // void main() => runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _question = [
    {
      'questionText': 'What\'s your favourite Animal?',
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Tiger', 'score': 2},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Dog', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite Colour?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite Food?',
      'answers': [
        {'text': 'Litti', 'score': 1},
        {'text': 'Biryani', 'score': 2},
        {'text': 'Pav bhaji', 'score': 3},
        {'text': 'Chowmein', 'score': 4},
      ],
    },
  ];

  var _questionindex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionindex = 0;
      _totalscore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionindex = _questionindex + 1;
    });
    print(_questionindex);
    if (_questionindex < _question.length) {
      print('We have more question');
    } else {
      print('The End!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My First App')),
      ),
      body: _questionindex < _question.length
          ? Quiz(
              answerquestion: answerQuestion,
              questionindex: _questionindex,
              question: _question,
            )
          : Result(_totalscore, _resetQuiz),
    ));
  }
}
