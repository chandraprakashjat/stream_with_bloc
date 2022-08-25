import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/ticker/bloc/ticker_bloc.dart';
import 'package:stream_bloc/ticker/ui/view.dart';
import 'package:stream_bloc/ticker/util/ticker.dart';

class TickerPage extends StatelessWidget {
  const TickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TickerBloc(MyTicker()),
      child: const TickerView(),
    );
  }
}
