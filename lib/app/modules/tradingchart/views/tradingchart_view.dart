import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/tradingchart_controller.dart';

import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class TradingchartView extends GetView<TradingchartController> {
  TradingchartView({Key? key}) : super(key: key);
 TradingchartController tradingchartController = Get.put(TradingchartController());

  late InAppWebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trading Chart",style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),),
        backgroundColor: Color(0xFF131722),

      ),
      body: Container(
        color: Color(0xFF131722),
        child: SafeArea( 
         
          child: Center(
              child: Container(
                width: width,
                height: height,
                child: 
                WebViewWidget(                  
                  controller: tradingchartController.controller1
                ),
              ),
              ),
        ),
      ),
    );
  }
}
