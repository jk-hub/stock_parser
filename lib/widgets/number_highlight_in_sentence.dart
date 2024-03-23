import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_scan_parser/resources/color_manager.dart';

// ignore: must_be_immutable
class NumberHighlightText extends StatelessWidget {
  final String sentence;
  void Function(String? value) onTap;

  NumberHighlightText({
    super.key,
    required this.sentence,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    // Your sentence with numbers or integers

    // Use regular expressions to find and highlight numbers or integers
    // final RegExp numberRegex = RegExp(r'\d+(\.\d+)?');
    final RegExp numberRegex = RegExp(r'(\(\$\d+(\.\d+)?\))|\$\d+(\.\d+)?');

    // Split the sentence using the regular expression
    final List<RegExpMatch> matches = numberRegex.allMatches(sentence).toList();

    // Create a list of TextSpan elements with different styles for numbers
    final List<TextSpan> textSpans = [];
    int start = 0;

    for (final RegExpMatch match in matches) {
      if (start < match.start) {
        // Add non-number text
        textSpans.add(
          TextSpan(
            text: sentence.substring(start, match.start),
            style: TextStyle(color: ColorManager.whiteColor, fontSize: 14.sp),
          ),
        );
      }

      // Add number with a different style (e.g., color)
      textSpans.add(
        TextSpan(
          text: match.group(0),
          recognizer: TapGestureRecognizer()
            ..onTap = () => onTap(match.group(0)),
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      );

      start = match.end;
    }

    if (start < sentence.length) {
      // Add any remaining non-number text
      textSpans.add(
        TextSpan(
          text: sentence.substring(start),
          style: TextStyle(color: ColorManager.whiteColor, fontSize: 14.sp),
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
    );
  }
}
