import 'package:equatable/equatable.dart';
import 'package:stock_scan_parser/models/get_dashboard_data_model.dart';

enum StockParserStatus { initial, loading, success, error }

class StockParserState extends Equatable {
  final StockParserStatus status;
  final List<GetDashboardDataModel> stockParserData;

  const StockParserState({required this.status, required this.stockParserData});

  factory StockParserState.initial() {
    return const StockParserState(
      status: StockParserStatus.initial,
      stockParserData: [],
    );
  }

  StockParserState copyWith({
    StockParserStatus? status,
    List<GetDashboardDataModel>? stockParserData,
  }) {
    return StockParserState(
      status: status ?? this.status,
      stockParserData: stockParserData ?? this.stockParserData,
    );
  }

  @override
  String toString() =>
      'StockParserState(status: $status, stockParserData: $stockParserData)';

  @override
  List<Object?> get props => [status, stockParserData];
}
