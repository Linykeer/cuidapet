// ignore_for_file: public_member_api_docs, sort_constructors_first
class RestClientResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;
  RestClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
