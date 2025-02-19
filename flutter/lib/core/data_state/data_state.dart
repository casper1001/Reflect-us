part 'data_status.dart';


class DataState<T> {

  final T? data;
  final String message;
  final DataStatus status;

  const DataState({
    this.data,
    this.message = '',
    this.status = DataStatus.loading
  });

  @override
  String toString() {
    return """DataState<$T>
status : $status
data : $data
message : $message    
""";
  }

  // no need to dartz any more
  B? fold<B>(B Function(DataState<T> failState) fail,B Function(DataState<T> successState) success){
    if(status.isError){
      return fail(this);
    }else if(status.isSuccess){
      return success(this);
    }
    return null;
  }

}
