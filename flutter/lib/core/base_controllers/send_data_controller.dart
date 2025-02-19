
import 'package:get/get.dart';

import '../core_components/pop_up.dart';
import '../data_state/data_state.dart';
import '../handler/handler.dart';

abstract class SendDataController<T> extends GetxController {
  Future<T> callApi();

  DataState<T> _dataState = DataState<T>(status: DataStatus.loading);
  DataStatus get status => _dataState.status;
  String get error => _dataState.message;
  T get data => _dataState.data!;
  DataState<T> get state => _dataState;

  void sendData() async {
    if (!validate()) return;
    _dataState = DataState<T>(status: DataStatus.loading);
    showLoader();
    update();
    _dataState = await handle<T>(callApi);
    _dataState.fold(onFail, onSuccess);
    update();
  }

  void onFail(DataState<T> dataState) {
    Get.back();
    showSnackBar(error);
  }

  void onSuccess(DataState<T> dataState) {
    Get.back();
  }

  bool validate() => true;
}
