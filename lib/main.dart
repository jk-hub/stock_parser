import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_scan_parser/blocs/stock_parser_bloc.dart';
import 'package:stock_scan_parser/blocs/stock_parser_event.dart';
import 'package:stock_scan_parser/resources/routes/routes_manager.dart';
import 'package:stock_scan_parser/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) =>
            StockParserBloc()..add(const FetchStockParserEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Stock Scan Parser',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
