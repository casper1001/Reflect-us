import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'advance_question_view.dart';
import 'advance_quize_controller.dart';
import 'advance_quize_model.dart';

class AdvanceQuizScreen extends GetView<AdvanceQuestionController> {
  const AdvanceQuizScreen({Key? key,required this.title}) : super(key: key);
  final String title;

  static void push(List<AdvanceQuizModel> questions,String title)async{
    Get.put(AdvanceQuestionController(questions));
    await Get.to(()=>AdvanceQuizScreen(title: title));
    Get.delete<AdvanceQuestionController>();
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
                  GetBuilder<AdvanceQuestionController>(
                    builder: (_){
                      return AdvanceQuestionView(controller.currentQuestion);
                    },
                  )
                ]),
          ),
        )
    );
  }
}
