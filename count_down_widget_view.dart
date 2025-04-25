import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:intl/intl.dart';
import '../../../export.dart';

class QrGeneratorView extends ChangeNotifier {
  //Ekranimin diger view yonetimi kodlarini cikardim. CountDown için viewda yonetim oalrak bu metodu cağırıyorum. 

  void restartTimer(int totalTime, CountDownController controller) {
    controller.reset();
    controller.start();
    notifyListeners();
  }
}
