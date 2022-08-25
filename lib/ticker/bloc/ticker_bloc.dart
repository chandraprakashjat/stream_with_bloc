import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../util/ticker.dart';

part 'ticker_event.dart';
part 'ticker_state.dart';

class TickerBloc extends Bloc<TickerEvent, TickerState> {
  final MyTicker _ticker;
  TickerBloc(this._ticker) : super(InitialState()) {
    on<TickerStart>(_mapTickerStart);
    on<TickerTick>(_mapOnTickerTickedEvent);
  }

  FutureOr<void> _mapTickerStart(
      TickerStart event, Emitter<TickerState> emit) async {
    /* Normal way
    await _ticker.tick().forEach((tick)=>add(TickerTick(tick: tick)));
    emit(TickerCompleted()); */

//By Emitter
    await emit.onEach<int>(_ticker.tick(),
        onData: (tick) => add(TickerTick(tick: tick)));

    emit(TickerCompleted());
  }

  FutureOr<void> _mapOnTickerTickedEvent(
      TickerTick event, Emitter<TickerState> emit) {
    emit(TickSuccess(tickValue: event.tick));
  }
}
