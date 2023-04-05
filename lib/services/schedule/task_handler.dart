import 'dart:math' as math;

import 'package:workmanager/workmanager.dart';

class TaskHandler {
  addTask() {
    final randomNum = math.Random().nextInt(9999);
    Workmanager().registerPeriodicTask(
      "checker/$randomNum",
      "BGCheckRefreshLocalStorage/$randomNum",
      frequency: const Duration(hours: 1),
      initialDelay: const Duration(hours: 1),
    );
  }
}
