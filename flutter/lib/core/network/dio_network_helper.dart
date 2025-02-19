import 'package:dio/dio.dart';
import '../storage/storage_handler.dart';
import 'exceptions.dart';
import 'network_helper.dart';

class DioNetworkHelper extends NetworkHelper {
  DioNetworkHelper._() : super.create();
  static DioNetworkHelper? _instance;
  factory DioNetworkHelper() => _instance ??= DioNetworkHelper._();

  static Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (StorageHandler().hasToken)
          'Authorization': 'Token ${StorageHandler().token}'
      };

  final _dio = Dio();

  @override
  Future<AppResponse> get(String url, {Map<String, String>? headers}) async {
    try {
      var response = await _dio.get(url,
          options: Options(
            headers: {..._headers, if (headers != null) ...headers},
          ));
      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppResponse> post(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Map<String, String>? files}) async {
    try {
      dynamic data = body;
      if (files != null) {
        data = FormData.fromMap({
          if (body != null) ...body,
          ...files.map(
              (key, value) => MapEntry(key, MultipartFile.fromFileSync(value)))
        });
      }
      var response = await _dio.post(url,
          options:
              Options(headers: {..._headers, if (headers != null) ...headers}),
          data: data);
      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e);
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppResponse> put(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Map<String, String>? files}) async {
    try {
      dynamic data = body;
      if (files != null) {
        data = FormData.fromMap({
          if (body != null) ...body,
          ...files.map(
              (key, value) => MapEntry(key, MultipartFile.fromFileSync(value)))
        });
      }
      var response = await _dio.put(url,
          options:
              Options(headers: {..._headers, if (headers != null) ...headers}),
          data: data);
      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppResponse> delete(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      var response = await _dio.delete(url,
          options:
              Options(headers: {..._headers, if (headers != null) ...headers}),
          data: body);
      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }
}

extension DioToAppResponse on Response {
  AppResponse get toAppResponse => AppResponse(
        statusCode: statusCode ?? 400,
        data: data,
        headers: headers.map.map((key, value) => MapEntry(key, value.join(""))),
      );
}
