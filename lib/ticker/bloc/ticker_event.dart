part of 'ticker_bloc.dart';

abstract class TickerEvent extends Equatable {
  const TickerEvent();
  @override
  List<Object> props() => [];
}

class TickerStart extends TickerEvent {}

class TickerTick extends TickerEvent {
  const TickerTick({required this.tick});
  final int tick;

  @override
  List<Object> props() => [tick];
}
