import 'package:ecgold/app/common/dialog.dart';
import 'package:ecgold/app/modules/checkoutmoney/views/checkoutmoney_view.dart';
import 'package:ecgold/app/modules/history/controllers/history_controller.dart';
import 'package:ecgold/app/modules/history/views/history_view.dart';
import 'package:ecgold/app/modules/notification/views/notification_view.dart';
import 'package:ecgold/app/modules/portfolio/views/addmoney_view.dart';
import 'package:ecgold/app/modules/portfolio/views/savegoldformcustomer_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/portfolio_controller.dart';

class PortfolioView extends GetView<PortfolioController> {
  PortfolioView({Key? key}) : super(key: key);

  PortfolioController portfolioController = Get.put(PortfolioController());
  HistoryController historyController = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [appBar(width, height, context), content(width, height)],
    ));
  }

  Widget appBar(double width, double height, context) {
    return Positioned(
      top: 0,
      child: Container(
        width: width,
        height: 150,
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
                        Icon(
                          Icons.bar_chart,
                          color: Color(0xFFFFFFFF),
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
                        Text(
                          DateTime.now().toString(),
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFFFFFFF), fontSize: 12),
                        )
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
          child: Column(
            children: [
              Text(
                "เงินหลักประกัน",
                style: GoogleFonts.notoSansThai(
                  fontSize: 18,
                  color: Color(0xFF5899F2),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "800,000",
                      style: GoogleFonts.montserrat(
                        fontSize: 36,
                        color: Color(0xFF20C441),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "THB",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Color(0xFF8B92A1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE8EDF5),
                      Color(0xFFFFFFFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Card(
                            elevation: 5,
                            color: portfolioController.active.isTrue
                                ? Color(0xFF5899F2)
                                : Color(0xFF88B9FC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  portfolioController.tab1();
                                  Get.to(AddmoneyView());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Text(
                                  'ฝากเงินหลักประกัน',
                                  style: GoogleFonts.notoSansThai(
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Card(
                            elevation: 5,
                            color: portfolioController.active.isFalse
                                ? Color(0xFF5899F2)
                                : Color(0xFF88B9FC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  portfolioController.tab2();
                                  Get.to(() => CheckoutmoneyView());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Text(
                                  'ถอนเงินหลักประกัน',
                                  style: GoogleFonts.notoSansThai(
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        top: 4,
                        right: 5,
                        child: InkWell(
                            onTap: () {
                              Get.to(() => HistoryView());
                              historyController.setDefault();
                            },
                            child: Icon(
                              Icons.history,
                              size: 30,
                              color: Color(0xFF407FD6),
                            )))
                  ],
                ),
              ),
              Container(
                height: 250,
                child: TabBarView(
                  controller: portfolioController.tabController,
                  children: [
                    chart96(height),
                    chart99(),
                  ],
                ),
              ),
              tabbar(width, height),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last update",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 10, color: Color(0xFF363535)),
                    ),
                    Text(
                      "30/12/2023  09:00:35 (UTC+7)",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 10, color: Color(0xFF363535)),
                    )
                  ],
                ),
              ),
              Container(
                height: 690,
                child: TabBarView(
                  controller: portfolioController.tabController,
                  children: [tab96(height), tab96(height)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chart96(double height) {
    return Stack(
      children: [
        Container(
          child: SfCircularChart(
            palette: const <Color>[
              Color(0xFFD9A52C),
            ],
            margin: EdgeInsets.zero,
            tooltipBehavior: portfolioController.tooltipBehavior,
            annotations: [
              CircularChartAnnotation(
                radius: '0%',
              ),
            ],
            series: <CircularSeries>[
              DoughnutSeries<GoldData, String>(
                animationDuration: 0,
                dataSource: portfolioController.chartData,
                pointColorMapper: (GoldData data, _) => data.color,
                xValueMapper: (GoldData data, _) => data.x,
                yValueMapper: (GoldData data, _) => data.y,
              )
            ],
          ),
        ),
        Positioned(
            top: 60,
            right: 15,
            child: Column(
              children: [
                Text(
                  "20 Bg\n(57.14 %)",
                  style: GoogleFonts.montserrat(
                      fontSize: 12, color: Color(0xFF407FD6)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "10 Bg\n(28.57 %)",
                  style: GoogleFonts.montserrat(
                      fontSize: 12, color: Color(0xFF407FD6)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "5 Bg\n(14.29 %)",
                  style: GoogleFonts.montserrat(
                      fontSize: 12, color: Color(0xFF407FD6)),
                ),
              ],
            ))
      ],
    );
  }

  Widget chart99() {
    return Stack(
      children: [
        Container(
          child: SfCircularChart(
            palette: const <Color>[
              Color(0xFFD9A52C),
            ],
            margin: EdgeInsets.zero,
            tooltipBehavior: portfolioController.tooltipBehavior99,
            annotations: [
              CircularChartAnnotation(
                radius: '0%',
              ),
            ],
            series: <CircularSeries>[
              DoughnutSeries<GoldData99, String>(
                animationDuration: 0,
                dataSource: portfolioController.chartData99,
                pointColorMapper: (GoldData99 data, _) => data.color,
                xValueMapper: (GoldData99 data, _) => data.x,
                yValueMapper: (GoldData99 data, _) => data.y,
              )
            ],
          ),
        ),
        Positioned(
            bottom: 50,
            right: 15,
            child: Column(
              children: [
                Text(
                  "20 Bg\n(57.14 %)",
                  style: GoogleFonts.montserrat(
                      fontSize: 12, color: Color(0xFF407FD6)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "10 Bg\n(28.57 %)",
                  style: GoogleFonts.montserrat(
                      fontSize: 12, color: Color(0xFF407FD6)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "5 Bg\n(14.29 %)",
                  style: GoogleFonts.montserrat(
                      fontSize: 12, color: Color(0xFF407FD6)),
                ),
              ],
            ))
      ],
    );
  }

  Widget tabbar(double width, double height) {
    return Container(
      width: width / 1.5,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF5899F2)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Obx(() => TabBar(
              labelStyle: GoogleFonts.montserrat(
                fontSize: 18,
              ),
              onTap: (value) {
                //print(value);
                portfolioController.setIndexValue(value);
              },
              unselectedLabelStyle: GoogleFonts.montserrat(
                  fontSize: 18, color: Color(0xFF8B92A1)),
              controller: portfolioController.tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF5899F2), Color(0xFF083F95)]),
              ),
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    "96.50%",
                    style: GoogleFonts.montserrat(
                        color: portfolioController.indexValue.value == 0
                            ? Color(0xFFFFFFFF)
                            : Color(0xFF8B92A1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "99.99%",
                    style: GoogleFonts.montserrat(
                        color: portfolioController.indexValue.value == 1
                            ? Color(0xFFFFFFFF)
                            : Color(0xFF8B92A1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ])),
    );
  }

  tab96(double height) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE8EDF5),
                      Color(0xFFFFFFFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/Ellipse61.png"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ทองที่ลูกค้าฝากขาย",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "20 Bg",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Ellipse61.png",
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ต้นทุนเฉลี่ย",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "30,250 Bath",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Ellipse61.png",
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "มูลค่า ณ ปัจจุบัน",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "605,000 Bath",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: height / 37,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFA0C7FE),
                                Color(0xFF406AA1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            // border: Border.all(color: Color(0xFF707070)),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(SavegoldformcustomerView());
                              // Get.to(() => NavigateView());
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: Text(
                              'รับทอง',
                              style: GoogleFonts.notoSansThai(
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF88B9FC),
                      Color(0xFFFFFFFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/Ellipse62.png"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ทองที่รอชำระเงิน",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "10 Bg",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Ellipse62.png",
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ต้นทุนเฉลี่ย",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "30,550 Bath",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Ellipse62.png",
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "มูลค่า ณ ปัจจุบัน",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "305,000 Bath",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: height / 35,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFA0C7FE),
                                Color(0xFF0367EB),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            // border: Border.all(color: Color(0xFF707070)),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Get.to(() => NavigateView());
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: Text(
                              'ชำระเงิน',
                              style: GoogleFonts.notoSansThai(
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF407FD6),
                      Color(0xFFFFFFFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/Ellipse63.png"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ทองที่รอส่งมอบ",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "5 Bg",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Ellipse63.png",
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ต้นทุนเฉลี่ย",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "30,650 Bath",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Ellipse63.png",
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "มูลค่า ณ ปัจจุบัน",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                        Spacer(),
                        Text(
                          "153,250 Bath",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF407FD6)),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
