import 'dart:developer';

import 'package:dio/dio.dart';
import 'cache_helper.dart';

enum AppState { loading, failure, success }

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://thimar.amr.aait-d.com/api/',
      headers: {
        'Accept-Language': 'ar',
      },
    ),
  );
  static Future<CustomResponse> sendData({
    required String endPoint,
    dynamic data,
  }) async {
    _dio.options.headers.addAll({
      "Authorization": "Bearer ${CacheHelper.getToken()}",
    });
    try {
      final response = await _dio.post(endPoint, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CustomResponse(
          isSucces: true,
          succesMessage: response.data['message'],
          data: response.data,
        );
      }
      return CustomResponse(
        isSucces: false,
        exception: response.data['message'],
      );
    } on DioException catch (exception) {
      if (exception.response is Map) {
        return CustomResponse(
          isSucces: false,
          exception: exception.response!.data['message'],
        );
      }
      return CustomResponse(
        isSucces: false,
        exception: 'حدث خطا ما يرجي المحاوله لاحقا',
      );
    }
  }
  static Future<CustomResponse> deleteData({
    required String endPoint,
    dynamic data,
  }) async {
    _dio.options.headers.addAll({
      "Authorization": "Bearer ${CacheHelper.getToken()}",
    });
    try {
      final response = await _dio.delete(endPoint, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CustomResponse(
          isSucces: true,
          succesMessage: response.data['message'],
          data: response.data,
        );
      }
      return CustomResponse(
        isSucces: false,
        exception: response.data['message'],
      );
    } on DioException catch (exception) {
      if (exception.response is Map) {
        return CustomResponse(
          isSucces: false,
          exception: exception.response!.data['message'],
        );
      }
      return CustomResponse(
        isSucces: false,
        exception: 'حدث خطا ما يرجي المحاوله لاحقا',
      );
    }
  }

  static Future<CustomResponse> getData({
    required String endPoint,
    Map<String, dynamic>? qweryParameters,
  }) async {
    _dio.options.headers.addAll({
      "Authorization": "Bearer ${CacheHelper.getToken()}",
    });
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: qweryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {


        return CustomResponse(
          isSucces: true,

          data: response.data,
        );
      }
      return CustomResponse(
        isSucces: false,
        exception: response.data['message'],
      );
    } on DioException catch (exception) {
      if (exception.response is Map) {
        return CustomResponse(
          isSucces: false,
          exception: exception.response!.data['message'],
        );
      }
      return CustomResponse(
        isSucces: false,
        exception: 'حدث خطا ما يرجي المحاوله لاحقا',
      );
    }
  }
}

class CustomResponse {
  final bool isSucces;
  final String? succesMessage, exception;
  final dynamic data;
  CustomResponse({
    required this.isSucces,
    this.data,
    this.exception,
    this.succesMessage,
  });
}
