
part of 'network_helper.dart';

class AppResponse {

  final dynamic data;
  final int statusCode;
  final Map<String,String>? headers;

  AppResponse({
    this.data,
    required this.statusCode,
    this.headers
  });

}