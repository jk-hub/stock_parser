import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_scan_parser/resources/app_config.dart';
import 'package:stock_scan_parser/resources/color_manager.dart';
import 'package:stock_scan_parser/widgets/bg_container.dart';

class SelectValueDetailScreen extends StatelessWidget {
  const SelectValueDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Values",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: BgContainer(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 14.h),
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Divider(
                  color: ColorManager.whiteColor,
                ),
              );
            },
            itemCount: variableListData?.length ?? 0,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  getDashboardDataModel![parentIndex!]
                      .criteria![valuesIndex!]
                      .text = updateString(
                    getDashboardDataModel![parentIndex!]
                        .criteria![valuesIndex!]
                        .text
                        .toString(),
                    variableListData?[index],
                  );
                  Navigator.pop(context, true);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, bottom: 10.h),
                  child: Text(
                    variableListData?[index].toString() ?? '',
                    style: TextStyle(
                      color: ColorManager.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

String updateString(String originalString, dynamic newValue) {
  final RegExp regex = RegExp(r'(\$\d+\.?\d*)');
  final List<Match> matches = regex.allMatches(originalString).toList();
  for (int i = 0; i < matches.length; i++) {
    final String oldNumber = matches[i].group(0)!;
    if (originalString.contains(oldNumber)) {
      final String updatedString =
          originalString.replaceFirst(oldNumber, '\$$newValue');
      return updatedString;
    }
  }
  return originalString;
}
