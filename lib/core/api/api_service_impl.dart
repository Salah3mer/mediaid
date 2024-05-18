import 'package:dio/dio.dart';
import 'package:mediaid/core/api/api_service.dart';
import 'package:mediaid/core/api/end_point.dart';

class ApiServicesImplementation implements ApiServices {
  Dio? dio;
  ApiServicesImplementation(this.dio) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio = Dio(baseOptions);
  }

  @override
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token' ?? '',
      'Accept': 'application/json',
    };
    Response data = await dio!.get(endPoint, queryParameters: queryParameters);
    return data;
  }

  @override
  Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      String? token,
      required Map<String, dynamic>? data}) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token' ?? '',
      'Accept': 'application/json',
    };
    return await dio!.post(
      endPoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  @override
  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token' ?? '',
      'Accept': 'application/json',
    };
    return await dio!.delete(
      endPoint,
      queryParameters: queryParameters,
      data: data,
    );
  }

  @override
  Future<Response> update(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      String? token,
      required Map<String, dynamic> data}) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token' ?? '',
      'Accept': 'application/json',
    };
    return await dio!.put(
      endPoint,
      queryParameters: queryParameters,
      data: data,
    );
  }
}
