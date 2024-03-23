import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_scan_parser/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Create a timer for the splash screen
    Timer(const Duration(seconds: 3), () {
      // Navigate to the next screen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://fitpage.in/wp-content/uploads/2021/02/Fitpage-Logo_Home-Page-6.png',
        ),
      ),
    );
  }
}
