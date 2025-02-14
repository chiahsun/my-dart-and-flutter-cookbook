import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:timer/ticker.dart';
import 'package:timer/timer/bloc/timer_bloc.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: Ticker(60)),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer')),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              Actions(),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);

    return Text('$duration');
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ...switch (state) {
          TimerInitial() => [
              _buildStartButton(context),
            ],
          TimerRunning() => [
              _buildPauseButton(context), _buildResetButton(context)
            ],
          TimerPause() => [
              _buildResumeButton(context), _buildResetButton(context)
            ],
          TimerComplete() => [
              _buildResetButton(context),
            ],
        }
      ]);
    });
  }

  static Widget _buildStartButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: () =>
          context.read<TimerBloc>().add(const StartTimer(duration: 60)),
    );
  }

  static Widget _buildPauseButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.pause),
      onPressed: () => context.read<TimerBloc>().add(const PauseTimer()),
    );
  }

  static Widget _buildResetButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.replay),
      onPressed: () => context.read<TimerBloc>().add(const ResetTimer()),
    );
  }

  static Widget _buildResumeButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: () => context.read<TimerBloc>().add(const ResumeTimer()),
    );
  }
}
