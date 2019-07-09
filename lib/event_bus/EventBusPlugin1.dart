import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import 'SingleEventBus.dart';

final String EXTRA_DATA = "EXTRA_DATA";

class EventBusPlugin1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventBusPlugin1State();
  }
}

class EventBusPlugin1State extends State<EventBusPlugin1> {
  String content;
  StreamSubscription streamSubscription;

  @override
  void initState() {
    streamSubscription = SingleEventBus.instance().on().listen((event) {
      if (event is String) {
        print(event);
        setState(() {
          content = event;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.white),
      home: Scaffold(
        body:Padding(padding: EdgeInsets.only(top: 50),child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  SingleEventBus.instance().fire("这是传递给首页的数据");
                  Navigator.pop(context);
                },
                child: Text("返回")),
            Expanded(child: Text(content == null ? "还没有接受数据" : content))
          ],
        ),),
      ),
    );
  }
}
