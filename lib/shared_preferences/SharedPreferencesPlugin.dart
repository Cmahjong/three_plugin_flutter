import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_plugin_flutter/serialization/banner_bean.dart';

final String EXTRA_DATA = "EXTRA_DATA";

class SharedPreferencesPlugin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SharedPreferencesPluginState();
  }
}

class SharedPreferencesPluginState extends State<SharedPreferencesPlugin> {
  BannerBean _bannerBean;
  String saveTitle;
  int index=0;
  @override
  void initState() {
    doBanner();
    getSaveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Builder(
              builder: (ctx) => FlatButton(
                  onPressed: () {
                    save();
                  },
                  child: Text(
                      _bannerBean?.data[0]?.title ?? "JsonPluginWidgetState"))),
          Text(saveTitle??"没有取到")
        ],
      ),
    );
  }

  void doBanner() async {
    HttpClient httpClient = HttpClient();
    var clientRequest = await httpClient
        .getUrl(Uri.parse("https://www.wanandroid.com/banner/json"));
    //等待服务器返回
    var response = await clientRequest.close();
    var result = await response.transform(utf8.decoder).join();
    print(result);
    setState(() {
      _bannerBean = BannerBean.fromJson(json.decode(result));
    });
  }

  void save() async {

    if (index<_bannerBean.data.length-1) {
      index++;
    }else{
      index=0;
    }
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(EXTRA_DATA, _bannerBean.data[index].title);
  }
  void getSaveData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    saveTitle=sharedPreferences.getString(EXTRA_DATA);
    if((saveTitle??"").isNotEmpty) {
      setState(() {
      });
    }

  }
}
