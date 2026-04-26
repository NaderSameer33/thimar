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
        'Accept': 'application/json',
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
      return CustomResponse(
        isSucces: false,
        exception: _extractErrorMessage(exception),
      );
    }
  }

  static Future<CustomResponse> putData({
    required String endPoint,
    dynamic data,
  }) async {
    _dio.options.headers.addAll({
      "Authorization": "Bearer ${CacheHelper.getToken()}",
    });
    try {
      final response = await _dio.put(endPoint, data: data);
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
      return CustomResponse(
        isSucces: false,
        exception: _extractErrorMessage(exception),
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
      return CustomResponse(
        isSucces: false,
        exception: _extractErrorMessage(exception),
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
      return CustomResponse(
        isSucces: false,
        exception: _extractErrorMessage(exception),
      );
    }
  }

  static String _extractErrorMessage(DioException exception) {
    if (exception.response?.data is Map) {
      final data = exception.response!.data;
      if (data['errors'] is Map) {
        final Map errors = data['errors'];
        if (errors.isNotEmpty) {
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }
          return firstError.toString();
        }
      }
      return data['message'] ?? 'بيانات غير صالحة';
    }
    return 'حدث خطا ما يرجي المحاوله لاحقا';
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
