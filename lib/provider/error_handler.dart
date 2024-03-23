import 'package:dio/dio.dart';

String errorHandler(DioException response) {
  final statusCode = response.response!.statusCode;
  final responsePhrase = response.requestOptions.responseType;
  final String errorMessage =
      'Request failed\nStatus Code : $statusCode\nReason: $responsePhrase';
  return errorMessage;
}
