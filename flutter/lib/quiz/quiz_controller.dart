import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'question_model.dart';

class QuizController extends GetxController{
  final List<QuestionModel> questions;
  QuizController(this.questions);

  int score = 0;
  int _current = 0;

  int get current => min(_current, questions.length -1);

  QuestionModel get currentQuestion => questions[current];
  void next(bool isCorrect){
    if(isCorrect) score ++;
    _current++;
    if(_current >= questions.length){
      bool isPassed = false;
      if (score >= questions.length * 0.6) {
        //pass if 60 %
        isPassed = true;
      }
      String title = isPassed ? "Passed " : "Failed";

      Get.dialog(AlertDialog(
        title: Text(
          "$title | Score is $score",
          style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
        ),
        content: ElevatedButton(
          child: const Text("Next"),
          onPressed: () {
            Get.offAllNamed('/Home');
          },
        ),
      ));
    }else{
      update();
    }
  }


}