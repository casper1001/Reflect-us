
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reflectus2/api_service/api_service.dart';
import 'package:reflectus2/core/base_controllers/send_data_controller.dart';

import '../core/data_state/data_state.dart';

class SignUpController extends SendDataController<void>{

  @override
  Future<void> callApi() => ApiService.signUp(
    email: emailController.text,
    password1: pass1Controller.text,
    password2: pass2Controller.text,
    username: usernameController.text
  );

  final emailController = TextEditingController();
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();
  final usernameController = TextEditingController();


  @override
  void onSuccess(DataState<void> dataState) {
    super.onSuccess(dataState);
    Get.offAllNamed('/ChooseOptions');
  }

}