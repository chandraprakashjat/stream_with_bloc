part of 'ticker_bloc.dart';

abstract class TickerState extends Equatable {
  const TickerState();
  @override
  List<Object?> props() => [];
}

class InitialState extends TickerState {}

class TickerCompleted extends TickerState {}

class TickSuccess extends TickerState {
  const TickSuccess({required this.tickValue});
  final int tickValue;

  @override
  List<Object> props() => [tickValue];
}
