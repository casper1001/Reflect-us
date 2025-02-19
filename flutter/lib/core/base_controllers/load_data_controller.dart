import 'package:get/get.dart';

import '../data_state/data_state.dart';
import '../handler/handler.dart';

abstract class LoadDataController<T> extends GetxController {

  DataState<T> _dataState = DataState<T>(
    status: DataStatus.loading
  );

  DataStatus get status => _dataState.status;
  String get error => _dataState.message;
  T get data => _dataState.data!;
  DataState<T> get state => _dataState;

  void loadData() async{
    _dataState = DataState<T>(
        status: DataStatus.loading
    );
    update();
    _dataState = await handle<T>(callApi);
    _dataState.fold(onFail,onSuccess);
    update();
  }

  Future<T> callApi();

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  void onFail(DataState<T> dataState){}

  void onSuccess(DataState<T> dataState){}

}