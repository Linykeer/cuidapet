// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet/app/core/helpers/constants.dart';
import 'package:cuidapet/app/core/helpers/environments.dart';
import 'package:cuidapet/app/core/local_storage/local_storage.dart';
import 'package:cuidapet/app/core/logger/app_logger.dart';
import 'package:cuidapet/app/core/rest_client/dio/interceptors/auth_interceptor.dart';
import 'package:cuidapet/app/core/rest_client/rest_client_exception.dart';
import 'package:dio/dio.dart';

import 'package:cuidapet/app/core/rest_client/rest_client.dart';
import 'package:cuidapet/app/core/rest_client/rest_client_response.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;

  final _defaultOptions = BaseOptions(
      baseUrl: Environments.param('base_url') ?? '',
      connectTimeout: Duration(
          milliseconds: int.parse(
              Environments.param('rest_client_connect_timeout') ?? '0')),
      receiveTimeout: Duration(
          milliseconds: int.parse(
              Environments.param('rest_client_receive_timeout') ?? '0')));

  DioRestClient({
    required LocalStorage localStorage,
    required AppLogger log,
    BaseOptions? baseOptions,
  }) {
    _dio = Dio(baseOptions ?? _defaultOptions);
    _dio.interceptors.addAll(
      [
        AuthInterceptor(localStorage: localStorage, log: log),
        LogInterceptor(requestBody: true, responseBody: true),
      ],
    );
  }
  @override
  RestClient auth() {
    _defaultOptions.extra[Constants.REST_CLIENT_AUTH_REQUIRE_KEY] = true;
    return this;
  }

  @override
  RestClient unAuth() {
    _defaultOptions.extra[Constants.REST_CLIENT_AUTH_REQUIRE_KEY] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      return _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      return _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      return _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
        response: _dioErrorConverter(e.response),
      );
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      return _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {required String method,
      data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      return _throwRestClientException(e);
    }
  }

  RestClientResponse<T> _dioErrorConverter<T>(Response? response) {
    return RestClientResponse<T>(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(
      Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  _throwRestClientException(DioError dioError) {
    final response = dioError.response;
    throw RestClientException(
      error: dioError.error,
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      response: RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }
}
