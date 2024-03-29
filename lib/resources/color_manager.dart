// static and const keyword
// In Dart, the static keyword declares variables and methods at the class level,
// making them accessible and shared by all class instances.
// The const keyword ensures variable immutability and creates compile-time
// constants, which are immutable and have values known at compile-time.
// For example, you can declare a static const variable inside of a class

import 'package:flutter/material.dart';

class ColorManager {
  static const greenColor = Color(0xFF34B71F);
  static const redColor = Color(0xFFF3392F);
  static const blackColor = Color(0xFF01131B);
  static const whiteColor = Color(0xFFf5f5f5);
  static const blueColor = Color(0xFF1686b0);
}
