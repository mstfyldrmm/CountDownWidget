import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:qr_attendance_project/export.dart';

class CircularTimerWidget extends StatefulWidget {
  const CircularTimerWidget(
      {super.key,
      required this.totalTime,
      required this.onCompleted,
      required this.controller});
  final int totalTime;
  final VoidCallback onCompleted;
  final CountDownController controller;

  @override
  State<CircularTimerWidget> createState() => _CircularTimerWidgetState();
}

class _CircularTimerWidgetState extends State<CircularTimerWidget> {
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: widget.totalTime,
      initialDuration: 0,
      controller: widget.controller,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      fillGradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 10, 25, 166),
          Color.fromARGB(255, 10, 25, 167) // canlı kırmızı
        ],
        begin: Alignment.topCenter,
        end: Alignment.centerRight,
      ),
      ringColor: Theme.of(context).cardColor,
      ringGradient: const LinearGradient(
        colors: [
          Color(0xFFB0BEC5), // açık gri
          Color(0xFFCFD8DC), // çok açık gri
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      fillColor: Theme.of(context).hintColor.withValues(alpha: 1),
      backgroundColor: Theme.of(context).cardColor,
      backgroundGradient: null,
      strokeWidth: 10,
      strokeCap: StrokeCap.round,
      textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 40,
          ),
      textAlign: TextAlign.center,
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      onComplete: () => widget.onCompleted.call(),
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "0";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
