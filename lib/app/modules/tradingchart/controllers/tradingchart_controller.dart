

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class TradingchartController extends GetxController {
  //TODO: Implement TradingchartController

  final count = 0.obs;
  late final WebViewController controller1;
 

  @override
  void onInit() {
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
     
      params =  PlatformWebViewControllerCreationParams();
    
    // final String contentBase64 = base64Encode(
    //   const Utf8Encoder().convert(chartex),
    // );
    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);
  
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..platform
      ..loadRequest(
        Uri.parse("https://www.tradingview.com/widgetembed/?frameElementId=tradingview_5c680&symbol=OANDA%3AXAUUSD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=0&toolbarbg=f1f3f6&theme=dark&style=1&timezone=exchange&withdateranges=1&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=th_TH&utm_source=th.tradingview.com&utm_medium=widget_new&utm_campaign=chart&utm_term=OANDA%3AXAUUSD#%7B%22page-uri%22%3A%22www.tradingview.com%2Fwidget%2Fadvanced-chart%2F%22%7D")
    //  Uri.parse("https://www.tradingview.com/widgetembed/?frameElementId=tradingview_494d2&symbol=OANDA%3AXAUUSD&interval=D&hidesidetoolbar=0&symboledit=1&saveimage=0&toolbarbg=f1f3f6&theme=dark&style=1&timezone=exchange&withdateranges=1&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=th_TH&utm_source=th.tradingview.com&utm_medium=widget_new&utm_campaign=chart&utm_term=OANDA%3AXAUUSD#%7B%22page-uri%22%3A%22th.tradingview.com%2Fwidget%2Fadvanced-chart%2F%22%7D")
        //Uri.parse('data:text/html;base64,$contentBase64'),
      );

    controller1 = controller;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
