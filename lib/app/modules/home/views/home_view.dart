import 'package:ecgold/app/common/dialog.dart';
import 'package:ecgold/app/modules/history/views/history_view.dart';
import 'package:ecgold/app/modules/home/controllers/minigraph99_controller.dart';
import 'package:ecgold/app/modules/home/controllers/nav_controller.dart';
import 'package:ecgold/app/modules/notification/views/notification_view.dart';
import 'package:ecgold/app/modules/tradingchart/views/tradingchart_view.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  NavController navController = Get.put(NavController());
  Minigraph99Controller minigraph99controller =
      Get.put(Minigraph99Controller());

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
            top: 20,
          ),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
              child: Column(children: [
            Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: picSlide()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Gold Broker Price",
                style: GoogleFonts.montserrat(
                    color: Color(0xFFE58F4E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFEBEEF6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    print("Go To Page Trade");
                    navController.gopage1();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF2E70CC), fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "96.50 %",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFFE4BE00),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "ทองคำแท่ง 96.50 %",
                              style: GoogleFonts.kanit(
                                  color: Color(0xFF8B92A1), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              width: width / 3,
                              height: 50,
                              child: WebViewWidget(
                                  controller: homeController.controller1),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "00.00  00.00 %",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF21AC3D), fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "30,650",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF407FD6), fontSize: 24),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: height / 35,
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
                                // border: Border.all(color: Color(0xFF707070)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  navController.gopage1();
                                  // Get.to(() => NavigateView());
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: Text(
                                  'Trade',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFEBEEF6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    print("Goto TradePage");
                    navController.gopage1();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF2E70CC), fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "99.99 %",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF8F7151),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "ทองคำแท่ง 99.99 %",
                              style: GoogleFonts.kanit(
                                  color: Color(0xFF8B92A1), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              width: width / 3,
                              height: 50,
                              child: WebViewWidget(
                                  controller:
                                      minigraph99controller.controller1),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "00.00  00.00 %",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF21AC3D), fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "30,650",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF407FD6), fontSize: 24),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: height / 35,
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
                                // border: Border.all(color: Color(0xFF707070)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  print("object");
                                  navController.gopage1();
                                  // Get.to(() => NavigateView());
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: Text(
                                  'Trade',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logoworld.png",
                    scale: 3.5,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Realtime Market Price",
                    style: GoogleFonts.montserrat(
                        color: Color(0xFF2E70CC),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFEBEEF6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Open",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF2E70CC), fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "ราคาสมาคม",
                            style: GoogleFonts.kanit(
                                color: Color(0xFF214475), fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "ทองคำแท่ง 96.50 %",
                            style: GoogleFonts.kanit(
                                color: Color(0xFF8B92A1), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "00.00  00.00 %",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF21AC3D), fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "30,650",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF407FD6), fontSize: 24),
                          ),
                          SizedBox(height: 5),
                          Text("")
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFEBEEF6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Open",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF2E70CC), fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "XAUUSD",
                            style: GoogleFonts.kanit(
                                color: Color(0xFF214475), fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "ทองคำ/ดอลลาร์สหรัฐ",
                            style: GoogleFonts.kanit(
                                color: Color(0xFF8B92A1), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "6.31  0.30 %",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF21AC3D), fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "1,932.53",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF407FD6), fontSize: 24),
                          ),
                          SizedBox(height: 5),
                          Text("")
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFEBEEF6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Open",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF2E70CC), fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "USDTHB",
                            style: GoogleFonts.kanit(
                                color: Color(0xFF214475), fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "U.S. Dollar/Thai Baht",
                            style: GoogleFonts.kanit(
                                color: Color(0xFF8B92A1), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "00.00  00.00 %",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF21AC3D), fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "32.718",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF407FD6), fontSize: 24),
                          ),
                          SizedBox(height: 5),
                          Text("")
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    )
                  ],
                ),
                child: Image.asset("assets/images/banner2.png")),
            SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    )
                  ],
                ),
                child: Image.asset("assets/images/banner3.png")),
            Center(
              child: GridView.extent(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
                maxCrossAxisExtent: 300.0,
                children: [
                  Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/tech.png",
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Technical",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF214475), fontSize: 18),
                            ),
                            Text(
                              "Content ...",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF8B92A1), fontSize: 14),
                            )
                          ],
                        ),
                      )),
                  Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/invest.png",
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Technical",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF214475), fontSize: 18),
                            ),
                            Text(
                              "Content ...",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF8B92A1), fontSize: 14),
                            )
                          ],
                        ),
                      )),
                  Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/invest2.png",
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Technical",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF214475), fontSize: 18),
                            ),
                            Text(
                              "Content ...",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF8B92A1), fontSize: 14),
                            )
                          ],
                        ),
                      )),
                  Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/tech2.png",
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Technical",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF214475), fontSize: 18),
                            ),
                            Text(
                              "Content ...",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF8B92A1), fontSize: 14),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 1,
                  )
                ],
              ),
            ),
          ]))),
    );
  }

  Widget picSlide() {
    return Container(
      child: ImageSlideshow(
        indicatorRadius: 4,

        /// Width of the [ImageSlideshow].
        width: double.infinity,

        /// The page to show when first creating the [ImageSlideshow].
        initialPage: 0,

        /// The color to paint the indicator.
        indicatorColor: Color(0xFF88B9FC),

        /// The color to paint behind th indicator.
        indicatorBackgroundColor: Color(0xFFE8EDF5),

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(child: Image.asset("assets/images/banner.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(child: Image.asset("assets/images/banner.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(child: Image.asset("assets/images/banner.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(child: Image.asset("assets/images/banner.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(child: Image.asset("assets/images/banner.png")),
          ),
        ],
        autoPlayInterval: 4500,
        isLoop: true,
      ),
    );
  }
}
