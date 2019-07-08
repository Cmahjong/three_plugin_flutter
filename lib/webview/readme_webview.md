# 依赖

- dependencies:
  #### Your other regular dependencies here
  flutter_webview_plugin: ^0.3.5



#使用方法
#  [点击查看具体用法](https://github.com/fluttercommunity/flutter_webview_plugin "Heading link")
WebView函数
Future<Null> launch(String url, {
   Map<String, String> headers: null,
   bool withJavascript: true,
   bool clearCache: false,
   bool clearCookies: false,
   bool hidden: false,
   bool enableAppScheme: true,
   Rect rect: null,
   String userAgent: null,
   bool withZoom: false,
   bool withLocalStorage: true,
   bool withLocalUrl: true,
   bool scrollBar: true,
   bool supportMultipleWindows: false,
   bool appCacheEnabled: false,
   bool allowFileURLs: false,
});
Webview活动
Stream<Null> 的onDestroy
Stream<String> onUrlChanged
Stream<WebViewStateChanged> onStateChanged
Stream<double> onScrollXChanged
Stream<double> onScrollYChanged
Stream<String> onerror的