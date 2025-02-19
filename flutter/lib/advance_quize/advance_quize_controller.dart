import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reflectus2/api_service/api_service.dart';
import 'package:reflectus2/core/base_controllers/send_data_controller.dart';
import 'package:reflectus2/core/core_components/pop_up.dart';

import '../core/data_state/data_state.dart';
import 'advance_quize_model.dart';

class AdvanceQuestionController extends SendDataController<bool> {
  @override
  Future<bool> callApi() =>
      ApiService.advanceQuestion(questions[current].answer, selectedImage!);

  final List<AdvanceQuizModel> questions;
  AdvanceQuestionController(this.questions);

  int score = 0;
  int _current = 0;
  String? selectedImage;

  int get current => min(_current, questions.length -1);

  AdvanceQuizModel get currentQuestion => questions[current];

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

  void setImage()async{
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = file?.path;
    update();
  }

  @override
  bool validate() {
    return selectedImage != null;
  }

  @override
  void onSuccess(DataState<bool> dataState) {
    super.onSuccess(dataState);
    next(dataState.data ?? false);
    selectedImage = null;
    update();
  }



}