import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  bool isTicking = true;
  int seconds = 0;
  late Timer timer;

  /* void initState(){
    super.initState();
    isTicking = true;
    seconds = 0;
    timer = Timer.periodic(
        Duration(seconds: 1),
            _onTick
    );
  }
*/

  void _onTick(Timer time) {
    setState(() {
      ++seconds;
    });
  }

  String _secondsString() => seconds == 1 ? 'second' : 'seconds';

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
    setState(() {
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _resetTimer() {
    //timer.cancel();
    setState(() {
      seconds = 0;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$seconds ${_secondsString()}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () => _startTimer(),
                child: Text('Start'),
              ),
              SizedBox(width: 20),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () => _stopTimer(),
                  child: Text('Stop')),
              SizedBox(width: 20),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () => _resetTimer(),
                  child: Text('Reset'))
            ]),
          ]),
    );
  }
}
