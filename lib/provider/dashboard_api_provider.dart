import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_scan_parser/constant/api_endpoints.dart';
import 'package:stock_scan_parser/models/get_dashboard_data_model.dart';

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
