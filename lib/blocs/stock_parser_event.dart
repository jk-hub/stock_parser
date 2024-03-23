import 'package:equatable/equatable.dart';

class StockParserEvent extends Equatable {
  const StockParserEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchStockParserEvent extends StockParserEvent {
  const FetchStockParserEvent();
}
