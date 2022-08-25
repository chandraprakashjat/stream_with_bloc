import 'package:flutter/material.dart';
import 'package:stream_bloc/ticker/bloc/ticker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickerView extends StatelessWidget {
  const TickerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticker Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              BlocBuilder<TickerBloc, TickerState>(builder: (context, state) {
            if (state is InitialState) {
              return const Text(
                  'Please press on floating button to Start Ticker');
            } else if (state is TickerCompleted) {
              return const Text(
                  'Please Press on floating button to Resume Ticker again');
            } else {
              int value = (state as TickSuccess).tickValue;
              return Text('Your current ticker Value $value');
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<TickerBloc>().add(TickerStart()),
        child: const Icon(Icons.send),
      ),
    );
  }
}
