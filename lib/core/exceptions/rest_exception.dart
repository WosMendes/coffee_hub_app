import 'package:get/get.dart';

class RestException implements Exception {
  final String message;
  final int? statusCode;
  final Response? response;

  RestException({
    required this.message,
    this.statusCode,
    this.response,
  });

  @override
  String toString() => message;
}