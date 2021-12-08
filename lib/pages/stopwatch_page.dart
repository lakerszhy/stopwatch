import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/blocs/page_view/page_view_cubit.dart';
import 'package:stopwatch/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:stopwatch/pages/clock_dial_view.dart';
import 'package:stopwatch/pages/clock_digit_view.dart';
import 'package:stopwatch/widgets/widgets.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  late final StopwatchCubit _stopwatchCubit;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      _stopwatchCubit.elapse(elapsed);
    });

    _stopwatchCubit = StopwatchCubit(ticker: _ticker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PageViewCubit()),
          BlocProvider.value(value: _stopwatchCubit),
        ],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
              ),
              child: AspectRatio(
                aspectRatio: 0.90,
                child: Stack(
                  children: [
                    const _View(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ResetLapButton(),
                          PageViewDots(),
                          StartStopButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 32),
            const Expanded(child: LapsSection()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    _stopwatchCubit.close();
    super.dispose();
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (index) => context.read<PageViewCubit>().select(index),
      children: const [
        ClockDigitView(),
        ClockDialView(),
      ],
    );
  }
}
