import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:three_plugin_flutter/serialization/banner_bean.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPlugin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebViewPluginState();
  }
}

class WebViewPluginState extends State<WebViewPlugin> {
  BannerBean _bannerBean;

  @override
  void initState() {
    doBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(builder: (ctx) =>
          FlatButton(onPressed: () {
            Navigator.push(ctx, MaterialPageRoute(builder: (ctx) =>
                WebviewScaffold(
                  url: _bannerBean?.data[0]?.url ?? "http://www.baidu,com",
                  appBar: AppBar(
                    title: Text(_bannerBean?.data[0]?.title ?? "JsonPluginWidgetState") ,
                    centerTitle: true,
                  ),
                  withZoom: true,
                  withLocalStorage: true,
                  hidden: true,
                  initialChild:Container(
                    color: Colors.redAccent,
                    child: const Center(
                      child: Text('Waiting.....'),
                    ),
                  ),
                )));
          },
              child: Text(
                  _bannerBean?.data[0]?.title ?? "JsonPluginWidgetState"))),
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
