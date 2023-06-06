import 'package:ecgold/app/common/dialog.dart';
import 'package:ecgold/app/modules/history/views/history_view.dart';
import 'package:ecgold/app/modules/tradingchart/views/tradingchart_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [appBar(width, context), content(width, height)],
    ));
  }

  Widget appBar(double width, context) {
    return Positioned(
      top: 0,
      child: Container(
        height: 150,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5A7DAE),
              Color(0xFF77B1FF),
              Color(0xFF77B1FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/eclogo.png",
                      scale: 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0xFFFFFFFF),
                        ),
                        Text(
                          "EC_Demo Account",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFFFFFFF), fontSize: 16),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(() => HistoryView());
                          },
                          child: Icon(
                            Icons.history,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => TradingchartView());
                          },
                          child: Icon(
                            Icons.bar_chart,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => NotificationView());
                          },
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            DialogMe.logoutDialog(context);
                          },
                          child: Icon(
                            Icons.logout,
                            color: Color(0xFFFFFFFF),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Realtime Price",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFFFFFFF), fontSize: 12),
                        ),
                        Spacer(),
                        StreamBuilder(
                            stream: Stream.periodic(Duration(seconds: 1)),
                            builder: (context, snapshot) {
                              return Text(
                                DateFormat('dd/MM/yyyy HH:mm:ss')
                                        .format(DateTime.now()) +
                                    ' (UTC+7)',
                                style: GoogleFonts.montserrat(
                                    color: Color(0xFFFFFFFF), fontSize: 12),
                              );
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget content(double width, double height) {
    return Positioned(
      top: 130,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
            child: Column(children: [
          Stack(
            children: [
              Positioned(
                  left: 20,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "การแจ้งเตือน",
                    style: GoogleFonts.notoSansThai(
                      fontSize: 18,
                      color: Color(0xFF5899F2),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
              height: height / 1.3,
            child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "10:00:35  16:01:2022",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: Color(0xFF000000)),
                          ),
                          Text(
                            "Order # S0000001  คุณได้ทำรายการขายทองคำแท่ง 99.99% จำนวน 1 Kg ที่ราคาตลาด 30,000 บาท สำเร็จ.",
                            style:
                                TextStyle(fontSize: 14, color: Color(0xFF8B92A1)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Color(0xFFB29891),
                    )
                  ],
                ),
              );
            },
                  ),
          )
        ])),
      ),
    );
  }
}
