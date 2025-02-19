
part of 'data_state.dart';

enum DataStatus{
  init,
  loading,
  error,
  success,
}

extension IsX on DataStatus{

  bool get isError => this == DataStatus.error;

  bool get isSuccess => this == DataStatus.success;

  bool get isLoading => this == DataStatus.loading;

  bool get isInit => this == DataStatus.init;
}