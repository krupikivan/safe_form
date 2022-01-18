import 'package:dio/dio.dart';
import 'package:safe_form/utilities/locator.dart';

typedef ApiCallFunction<T> = Future<Response<T>> Function();

class ApiService {
  ApiService({Dio? client}) : _client = client ?? locator();

  final Dio _client;

  Future get({
    required String path,
  }) async {
    return _unwrapError(
      () => _client.get(
        path,
      ),
    );
  }

  Future delete({
    required String path,
  }) async {
    return _unwrapError(
      () => _client.delete(
        path,
      ),
    );
  }

  Future post({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return _unwrapError(
      () => _client.post(
        path,
        data: data,
      ),
    );
  }

  Future put({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return _unwrapError(
      () => _client.put(
        path,
        data: data,
      ),
    );
  }

  Future _unwrapError(
    ApiCallFunction<dynamic> apiCall,
  ) async {
    try {
      final value = await apiCall();
      return value.data;
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other) {
        throw dioError.error;
      } else {
        rethrow;
      }
    }
  }
}
