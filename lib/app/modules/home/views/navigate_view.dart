import 'package:ecgold/app/modules/account/views/account_view.dart';
import 'package:ecgold/app/modules/home/controllers/nav_controller.dart';
import 'package:ecgold/app/modules/home/views/home_view.dart';
import 'package:ecgold/app/modules/order/views/order_view.dart';
import 'package:ecgold/app/modules/portfolio/views/portfolio_view.dart';
import 'package:ecgold/app/modules/trade/controllers/trade_controller.dart';
import 'package:ecgold/app/modules/trade/views/trade_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigateView extends GetView {
  NavigateView({Key? key}) : super(key: key);
  NavController navController = Get.put(NavController());
  TradeController tradeController = Get.put(TradeController());

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
   
      body: Stack(
        children: [
          Obx(
            () => getActiveTabPage(),
          ),
          Obx(() => Positioned(
              bottom: 0,
              width: width,
              child: navController.currentIndexPage.value == 1
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Color(0xFF8B92A1),
                      height: 30,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "จำนวนทองที่สามารถขายได้",
                            style: GoogleFonts.notoSansThai(
                                color: Color(0xFFF1F7FF), fontSize: 16),
                          ),
                          tradeController.valueTap.value == 0
                          ?Text(
                            "50 Bg",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFFF1F7FF), fontSize: 16),
                          )
                          :Text(
                            "50 Kg",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFFF1F7FF), fontSize: 16),
                          )
                        ],
                      )))
                  : Text(""))),
          Obx(() => Positioned(
              bottom: 30,
              width: width,
              child: navController.currentIndexPage.value == 1
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Color(0xFFD9DFEB),
                      height: 30,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "จำนวนทองที่สามารถซื้อได้",
                            style: GoogleFonts.notoSansThai(
                                color: Color(0xFF214475), fontSize: 16),
                          ),
                           tradeController.valueTap.value == 0
                         ? Text(
                            "50 Bg",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF214475), fontSize: 16),
                          )
                         : Text(
                            "50 Kg",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF214475), fontSize: 16),
                          )
                        ],
                      )))
                  : Text(""))
            ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => CupertinoTabBar(
          height: 70,
          backgroundColor: const Color(0xFF002458),
          activeColor: Colors.white,
          currentIndex: navController.currentIndexPage.value,
          onTap: (value) {
            navController.ontapPage(value);
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
              padding: EdgeInsets.only(top: 10),
              height: height,
              width: width / 5,
              decoration: navController.currentIndexPage.value == 0
                  ? BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF3E72BC),
                            Color(0xFF08367A),
                          ]),
                    )
                  : null,
              child: Column(
                children: [
                  ImageIcon(AssetImage("assets/images/home.png")),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Home")
                ],
              ),
            )),
            BottomNavigationBarItem(
                icon: Container(
              padding: EdgeInsets.only(top: 10),
              height: height,
              width: width / 5,
              decoration: navController.currentIndexPage.value == 1
                  ? BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF3E72BC),
                            Color(0xFF08367A),
                          ]),
                    )
                  : null,
              child: Column(
                children: [
                  ImageIcon(AssetImage("assets/images/trade.png")),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Trade")
                ],
              ),
            )),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.only(top: 10),
                height: height,
                width: width / 5,
                decoration: navController.currentIndexPage.value == 2
                    ? BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF3E72BC),
                              Color(0xFF08367A),
                            ]),
                      )
                    : null,
                child: Column(
                  children: [
                    ImageIcon(AssetImage("assets/images/order.png")),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Order")
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
                icon: Container(
              padding: EdgeInsets.only(top: 10),
              height: height,
              width: width / 5,
              decoration: navController.currentIndexPage.value == 3
                  ? BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF3E72BC),
                            Color(0xFF08367A),
                          ]),
                    )
                  : null,
              child: Column(
                children: [
                  ImageIcon(AssetImage("assets/images/port.png")),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Portfolio")
                ],
              ),
            )),
            BottomNavigationBarItem(
                icon: Container(
              padding: EdgeInsets.only(top: 10),
              height: height,
              width: width / 5,
              decoration: navController.currentIndexPage.value == 4
                  ? BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF3E72BC),
                            Color(0xFF08367A),
                          ]),
                    )
                  : null,
              child: Column(
                children: [
                  ImageIcon(AssetImage("assets/images/acc.png")),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Account")
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget getActiveTabPage() {
    switch (navController.currentIndexPage.value) {
      case 0:
        return HomeView();
      case 1:
        return TradeView();
      case 2:
        return OrderView();
      case 3:
        return PortfolioView();
      case 4:
        return AccountView();
      default:
        return SizedBox.shrink();
    }
  }
}
