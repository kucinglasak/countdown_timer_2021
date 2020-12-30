import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CountdownTimerController controller;
  @override
  void initState() {
    super.initState();
    int endTime = DateTime.parse("2021-01-01").millisecondsSinceEpoch;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Countdown to 2021 by KucingLasak'),
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // CountdownTimer(
                  //   controller: controller,
                  // ),
                  CountdownTimer(
                    controller: controller,
                    widgetBuilder: (_, CurrentRemainingTime time) {
                      if (time == null) {
                        return Text(
                          'HAPPY NEW YEAR 2021!!!\n\nMay this year bring Health and Prosperity to us\n\nFollow @kucinglasak.id to see more like this',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      return Column(
                        children: [
                          Text(
                            '${time.days == null ? 0 : time.days} days ${time.hours == null ? 0 : time.hours} hours ${time.min == null ? 0 : time.min} min',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text('${time.sec}', style: TextStyle(fontSize: 108)),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.stop),
            onPressed: () {
              onEnd();
              controller.disposeTimer();
            },
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
