import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import 'EventBusPlugin1.dart';
import 'SingleEventBus.dart';

final String EXTRA_DATA = "EXTRA_DATA";

class EventBusPlugin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventBusPluginState();
  }
}

class EventBusPluginState extends State<EventBusPlugin> {
  String content;
  StreamSubscription streamSubscription;

  @override
  void initState() {
    streamSubscription =SingleEventBus.instance().on().listen((event) {
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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(
              builder: (ctx) => FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>EventBusPlugin1()));
                  },
                  child: Text("跳转"))),
          Expanded(child: Text(content == null ? "还没有接受数据" : content))
        ],
      ),
    );
  }
}
