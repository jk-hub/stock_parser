import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_scan_parser/models/get_dashboard_data_model.dart';
import 'package:stock_scan_parser/resources/app_config.dart';
import 'package:stock_scan_parser/resources/color_manager.dart';
import 'package:stock_scan_parser/resources/routes/routes_manager.dart';
import 'package:stock_scan_parser/widgets/bg_container.dart';
import 'package:stock_scan_parser/widgets/number_highlight_in_sentence.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          getDashboardDataModel?[parentIndex!].name ?? '',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: BgContainer(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ColoredBox(
                    color: ColorManager.blueColor,
                    child: ListTile(
                      title: Text(
                        getDashboardDataModel?[parentIndex!].name ?? "",
                        style: TextStyle(
                          color: ColorManager.whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        getDashboardDataModel?[parentIndex!].tag ?? "",
                        style: TextStyle(
                          color: getDashboardDataModel?[parentIndex!].tag ==
                                      "Bullish" ||
                                  getDashboardDataModel?[parentIndex!].tag ==
                                      "Intra day Bullish"
                              ? ColorManager.greenColor
                              : ColorManager.redColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount:
                          getDashboardDataModel?[parentIndex!].criteria?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                          ),
                          child: NumberHighlightText(
                            sentence: getDashboardDataModel?[parentIndex!]
                                    .criteria?[index]
                                    .text ??
                                "",
                            onTap: (String? val) {
                              if (val != null &&
                                  getDashboardDataModel?[parentIndex!]
                                          .criteria?[index]
                                          .type ==
                                      "indicator") {
                                getListValue(
                                  val,
                                  getDashboardDataModel?[parentIndex!],
                                  index,
                                  context,
                                );
                              } else {
                                if (getListValue(
                                          val,
                                          getDashboardDataModel?[parentIndex!],
                                          index,
                                          context,
                                        ) !=
                                        null &&
                                    getListValue(
                                      val,
                                      getDashboardDataModel?[parentIndex!],
                                      index,
                                      context,
                                    )!
                                        .isNotEmpty) {
                                  valuesIndex = index;
                                  variableListData = getList(
                                    getListValue(
                                          val,
                                          getDashboardDataModel?[parentIndex!],
                                          index,
                                          context,
                                        ) ??
                                        [],
                                  );
                                  Navigator.of(context)
                                      .pushNamed(
                                    RouteNames.selectValueDetailScreen,
                                  )
                                      .then((value) {
                                    setState(() {});
                                  });
                                }
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<num> getList(List<num> value) {
  final List<num> test = [];

  for (final element in value) {
    test.add(element);
  }
  return test;
}

List<num>? getListValue(
  String? val,
  GetDashboardDataModel? argument,
  int index,
  BuildContext context,
) {
  List<num>? variableListData;
  if (val != null) {
    if (val.contains('\$1') &&
        argument!.criteria![index].variable?.the1?.type == "value") {
      variableListData = argument.criteria![index].variable?.the1?.values;
    } else if (val.contains('\$1') &&
        argument!.criteria![index].variable?.the1?.type == "indicator") {
      valuesIndex = index;
      variableData1 = argument.criteria![index].variable?.the1;
      isVariableData1 = true;
      Navigator.of(context).pushNamed(
        RouteNames.valueScreen,
      );
    } else if (val.contains('\$2') &&
        argument!.criteria![index].variable?.the2?.type == "indicator") {
      valuesIndex = index;
      variableData2 = argument.criteria![index].variable?.the2;
      isVariableData1 = false;

      Navigator.of(context).pushNamed(
        RouteNames.valueScreen,
      );
    } else if (val.contains('\$3') &&
        argument!.criteria![index].variable?.the3?.type == "indicator") {
      valuesIndex = index;
      variableData2 = argument.criteria![index].variable?.the3;
      isVariableData1 = false;

      Navigator.of(context).pushNamed(
        RouteNames.valueScreen,
      );
    } else if (val.contains('\$4') &&
        argument!.criteria![index].variable?.the4?.type == "indicator") {
      valuesIndex = index;
      variableData1 = argument.criteria![index].variable?.the4;
      isVariableData1 = true;

      Navigator.of(context).pushNamed(
        RouteNames.valueScreen,
      );
    } else if (val.contains('\$2') &&
        argument!.criteria![index].variable?.the2?.type == "value") {
      variableListData = argument.criteria![index].variable?.the2!.values;
    } else if (val.contains('\$3')) {
      variableListData = argument!.criteria![index].variable?.the3!.values;
    } else if (val.contains('\$4')) {
      variableListData = argument!.criteria![index].variable?.the4!.values;
    }
  }
  return variableListData;
}
