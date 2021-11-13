import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_questions.dart';
import 'constants.dart';
// ignore_for_file: prefer_const_constructors

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> results = [];
  QuizData quizData = QuizData();
  int correctAnswerCounter = 0;

  void buttonFunc(bool answer) {
    if (quizData.isDone()) {
      //show alerDialog
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.indigo,
              title: Text(
                "Test is done!",
                style: TextStyle(color: Colors.white),
              ),
              content: Text('Result is:$correctAnswerCounter ',
                  style: TextStyle(color: Colors.white)),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    setState(() {
                      //clear the list
                      results.clear();
                      //clear the index
                      quizData.clearQuestionIndex();
                    });
                  },
                  child: Text(
                    'Restart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          });
    } else {
      setState(() {
        if (quizData.getAnswer() == answer) {
          results.add(kCorrectAnswer);
          correctAnswerCounter++;
          quizData.nextQuestion();
        } else {
          results.add(kWrongAnswer);
          quizData.nextQuestion();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Container(
              child: Text(
                quizData.getQuestion(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: results,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () => buttonFunc(true),
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 30,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        //padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () => buttonFunc(false),
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.white,
                        size: 30,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        //padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
