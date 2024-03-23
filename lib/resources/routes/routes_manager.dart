import 'package:flutter/material.dart';
import 'package:stock_scan_parser/screens/dashboard_screen.dart';
import 'package:stock_scan_parser/screens/detail_screen.dart';
import 'package:stock_scan_parser/screens/edit_value_detail_screen.dart';
import 'package:stock_scan_parser/screens/select_value_detail_screen.dart';
import 'package:stock_scan_parser/screens/splash_screen.dart';

class RouteNames {
  static const String splashScreen = 'splashScreen';
  static const String dashboard = 'dashboardScreen';
  static const String detailScreen = 'detailScreen';
  static const String valueScreen = 'valueScreen';
  static const String selectValueDetailScreen = 'SelectValueDetailScreen';
}

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouteNames.dashboard:
      return MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
        settings: routeSettings,
      );
    case RouteNames.detailScreen:
      return MaterialPageRoute(
        builder: (context) => const DetailScreen(),
        settings: routeSettings,
      );
    case RouteNames.valueScreen:
      return MaterialPageRoute(
        builder: (context) => const EditValueDetailScreen(),
        settings: routeSettings,
      );
    case RouteNames.splashScreen:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: routeSettings,
      );
    case RouteNames.selectValueDetailScreen:
      return MaterialPageRoute(
        builder: (context) => const SelectValueDetailScreen(),
        settings: routeSettings,
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: routeSettings,
      );
  }
}
