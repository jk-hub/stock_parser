import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_scan_parser/resources/app_config.dart';
import 'package:stock_scan_parser/resources/color_manager.dart';
import 'package:stock_scan_parser/widgets/bg_container.dart';

class EditValueDetailScreen extends StatefulWidget {
  const EditValueDetailScreen({super.key});

  @override
  State<EditValueDetailScreen> createState() => _EditValueDetailScreenState();
}

class _EditValueDetailScreenState extends State<EditValueDetailScreen> {
  late TextEditingController periodController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    periodController = TextEditingController();
    periodController.text =
        isVariableData1 ? variableData1?.defaultValue.toString() ?? '' : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          variableData1!.parameterName ?? '',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: BgContainer(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isVariableData1
                          ? variableData1?.studyType.toString().toUpperCase() ??
                              ''
                          : variableData2?.type.toString().toUpperCase() ?? '',
                      style: TextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Set Parameter",
                      style: TextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ColoredBox(
                      color: ColorManager.whiteColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Text(
                                isVariableData1
                                    ? variableData1?.parameterName
                                            .toString()
                                            .toUpperCase() ??
                                        ''
                                    : variableData2?.type
                                            .toString()
                                            .toUpperCase() ??
                                        '',
                                style: TextStyle(
                                  color: ColorManager.blackColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: 30.h,
                                top: 14.h,
                                right: 16.w,
                              ),
                              child: TextFormField(
                                controller: periodController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                keyboardAppearance: Brightness.dark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: periodController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
