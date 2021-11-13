import 'dart:math';

import 'package:quiz_app/quesiton.dart';

class QuizData {
  int _questIndex = 0;
  final List<Question> _questions = [
    Question(question: 'Titanic gelmiş geçmiş en büyük gemidir', answer: false),
    Question(
        question: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        answer: true),
    Question(question: 'Kelebeklerin ömrü bir gündür', answer: false),
    Question(question: 'Dünya düzdür', answer: false),
    Question(
        question: 'Kaju fıstığı aslında bir meyvenin sapıdır', answer: true),
    Question(
        question: 'Fatih Sultan Mehmet hiç patates yememiştir', answer: true),
    Question(question: 'Fransızlar 80 demek için, 4 - 20 der', answer: true),
  ];

  String getQuestion() {
    return _questions[_questIndex].question;
  }

  bool getAnswer() {
    return _questions[_questIndex].answer;
  }

  void nextQuestion() {
    if (_questIndex + 1 < _questions.length) {
      _questIndex++;
    }
  }
  bool isDone(){
    if(_questIndex+1 ==_questions.length){
      return true;
    }
    else {
      return false;
    }
  }
  void clearQuestionIndex(){
     _questIndex=0;
  }

}
