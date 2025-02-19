import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/quiz/question_view.dart';
import 'package:reflectus2/quiz/quiz_controller.dart';

import 'question_model.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  static void push(List<QuestionModel> questions,String title)async{
    Get.put(QuizController(questions));
    await Get.to(()=>QuizScreen(title: title));
    Get.delete<QuizController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 11, 27, 77),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
        SizedBox(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                GetBuilder<QuizController>(
                  builder: (_){
                    return QuestionView(controller.currentQuestion);
                  },
                )
            ]),
        ),
      ),
    );
  }
}
