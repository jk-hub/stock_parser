import 'package:flutter/material.dart';

class BgContainer extends StatelessWidget {
  final Widget child;
  const BgContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: double.infinity,
        color: Colors.black,
        child: child,
      ),
    );
  }
}
