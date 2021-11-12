import 'package:flutter/material.dart';
import 'constants.dart';
// ignore_for_file: prefer_const_constructors

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> results = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Container(
              child: Text(
                'Bilgi yarışması',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 5,
          runSpacing:100,
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
                      onPressed: () => setState(
                        () {
                          results.add(kCorrectAnswer);
                        },
                      ),
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
                      onPressed: () => setState(() {
                        results.add(kWrongAnswer);
                      }),
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
