import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'banner_bean.dart';

class JsonPluginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JsonPluginWidgetState();
  }
}

class JsonPluginWidgetState extends State<JsonPluginWidget> {
  BannerBean _bannerBean;

  @override
  void initState() {
    doBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_bannerBean?.data[0]?.title??"JsonPluginWidgetState"),
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
}
