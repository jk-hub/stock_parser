import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/blocs/stock_parser_event.dart';
import 'package:stock_scan_parser/blocs/stock_parser_state.dart';
import 'package:stock_scan_parser/repositories/dashboard_api_repo.dart';

class StockParserBloc extends Bloc<StockParserEvent, StockParserState> {
  StockParserBloc() : super(StockParserState.initial()) {
    on<FetchStockParserEvent>(_onFetchStockParserData);
  }

  Future<void> _onFetchStockParserData(
    FetchStockParserEvent event,
    Emitter<StockParserState> emit,
  ) async {
    emit(state.copyWith(status: StockParserStatus.loading));
    try {
      final DashboardRepo dashboardRepo = DashboardRepo();
      final data = await dashboardRepo.fetchStockList();
      emit(
        state.copyWith(
          status: StockParserStatus.success,
          stockParserData: data,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(
        state.copyWith(
          status: StockParserStatus.success,
        ),
      );
    }
  }
}
