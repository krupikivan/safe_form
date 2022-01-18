import 'dart:io';

import 'package:dio/dio.dart';
import 'package:safe_form/utilities/exception/custom_networking_exception.dart';
import 'package:safe_form/utilities/failures/failures.dart';

class StatusValidationInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    switch (response.statusCode) {
      case 200:
      case 201:
        handler.next(response);
        break;
      default:
        throw FetchDataException(
          'An error occurred',
        );
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.error is SocketException) {
      throw const NoInternetConnectionFailure();
    }
    if (err.response != null) {
      switch (err.response!.statusCode) {
        case 404:
          throw BadRequestException(err.response!.statusMessage);
        default:
          throw FetchDataException(
            'An error occurred',
          );
      }
    }
  }
}
