import 'dart:async';

import 'package:flutter/material.dart';

class TimeModel extends ChangeNotifier{
  int _second = 0;
  Timer? timer;
  int get second => _second;

  TimeModel(){
    timer = Timer.periodic(Duration(seconds: 1), (time){
      _second++;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}