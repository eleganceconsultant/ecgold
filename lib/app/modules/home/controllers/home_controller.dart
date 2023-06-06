import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  late final WebViewController controller1;

  final count = 0.obs;
  final chartex = """<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <div class="tradingview-widget-copyright"><a href="https://th.tradingview.com/symbols/XAUUSD/?exchange=OANDA" rel="noopener" target="_blank"><span class="blue-text">XAUUSD ราคา</span></a> โดย TradingView</div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-mini-symbol-overview.js" async>
  {
  "symbol": "OANDA:XAUUSD",
  "width": "550",
  "height": "250",
  "locale": "th_TH",
  "dateRange": "1D",
  "colorTheme": "light",
  "trendLineColor": "rgba(41, 98, 255, 1)",
  "underLineColor": "rgba(41, 98, 255, 0.3)",
  "underLineBottomColor": "rgba(255, 229, 153, 0)",
  "isTransparent": true,
  "autosize": false,
  "largeChartUrl": "",
  "noTimeScale": true,
  "chartOnly": true
}
  </script>
</div>
<!-- TradingView Widget END -->""";


  

  @override
  void onInit() {
    late final PlatformWebViewControllerCreationParams params;

    params = PlatformWebViewControllerCreationParams();

    final String contentBase64 = base64Encode(
      const Utf8Encoder().convert(chartex),
    );
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..platform
      ..loadRequest(
        Uri.parse('data:text/html;base64,$contentBase64'),
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
