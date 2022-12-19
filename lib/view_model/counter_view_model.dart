import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_in_action/data/stream_generator.dart';

class CounterViewModel extends ChangeNotifier {
  CounterViewModel() {
    listenNumbers(number: 0);
  }

  int? counter;
  late StreamSubscription subscription;


  listenNumbers({required int number}) {
    Stream<int?> stream = StreamGenerator.getMyNumbers(number: number);
    subscription = stream.listen((event) {
      counter = event ?? 0;
      notifyListeners();
    });
  }

  pauseCounterStream() => subscription.pause();

  resumeCounterStream() => subscription.resume();

  cancelCounterStream() => subscription.cancel();

}
