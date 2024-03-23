import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_scan_parser/constant/api_endpoints.dart';
import 'package:stock_scan_parser/models/get_dashboard_data_model.dart';
import 'package:stock_scan_parser/provider/error_handler.dart';

class DashboardAPIs {
  Dio dio = Dio();
  List<GetDashboardDataModel> stockParseList = [];
  Future<List<GetDashboardDataModel>> fetchStockList() async {
    try {
      final response =
          await dio.get(EndPoints.baseurl + EndPoints.stockParserApi);
      final responseData = jsonDecode(jsonEncode(response.data)) as List;
      if (kDebugMode) {
        print(responseData);
      } else {
        throw errorHandler(response as DioException);
      }
      return responseData
          .map(
            (e) => GetDashboardDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } on DioException {
      rethrow;
    }
  }
}
