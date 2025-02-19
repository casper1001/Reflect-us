
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reflectus2/api_service/api_service.dart';
import 'package:reflectus2/core/base_controllers/send_data_controller.dart';

import '../core/data_state/data_state.dart';

class SignInController extends SendDataController<void>{

  @override
  Future<void> callApi() => ApiService.signIn(emailController.text, passController.text);

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void onSuccess(DataState<void> dataState) {
    super.onSuccess(dataState);
    Get.offAllNamed('/Home');
  }

}