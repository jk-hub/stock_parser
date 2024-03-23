import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_scan_parser/blocs/stock_parser_bloc.dart';
import 'package:stock_scan_parser/blocs/stock_parser_state.dart';
import 'package:stock_scan_parser/resources/app_config.dart';
import 'package:stock_scan_parser/resources/routes/routes_manager.dart';
import 'package:stock_scan_parser/widgets/bg_container.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockParserBloc, StockParserState>(
      listener: (context, state) {
        if (state.status == StockParserStatus.error) {
          const Material(
            child: Center(
              child: Text("Something Went Wrong"),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == StockParserStatus.loading) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Stock Parser",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: BgContainer(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const Divider(
                        color: Colors.white,
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: state.stockParserData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        getDashboardDataModel = state.stockParserData;
                        parentIndex = index;
                        Navigator.of(context).pushNamed(
                          RouteNames.detailScreen,
                          arguments: state.stockParserData[index],
                        );
                      },
                      title: Text(
                        state.stockParserData[index].name ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      subtitle: Text(
                        state.stockParserData[index].tag ?? "",
                        style: TextStyle(
                          color:
                              state.stockParserData[index].tag == "Bullish" ||
                                      state.stockParserData[index].tag ==
                                          "Intra day Bullish"
                                  ? Colors.green
                                  : Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
