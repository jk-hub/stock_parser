import 'package:stock_scan_parser/models/get_dashboard_data_model.dart';
import 'package:stock_scan_parser/provider/dashboard_api_provider.dart';

class DashboardRepo {
  final DashboardAPIs dashboardAPIs = DashboardAPIs();

  Future<List<GetDashboardDataModel>> fetchStockList() async =>
      dashboardAPIs.fetchStockList();
}
