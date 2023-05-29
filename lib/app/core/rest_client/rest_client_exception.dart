// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet/app/core/rest_client/rest_client_response.dart';

class RestClientException implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  RestClientResponse? response;
  RestClientException({
    this.message,
    this.statusCode,
    required this.error,
    this.response,
  });

  @override
  String toString() {
    return 'RestClientException(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
