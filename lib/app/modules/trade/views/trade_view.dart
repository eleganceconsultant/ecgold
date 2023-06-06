import 'package:ecgold/app/common/dialog.dart';
import 'package:ecgold/app/modules/history/views/history_view.dart';
import 'package:ecgold/app/modules/home/controllers/nav_controller.dart';
import 'package:ecgold/app/modules/notification/views/notification_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/trade_controller.dart';

class TradeView extends GetView<TradeController> {
  TradeView({Key? key}) : super(key: key);
  TradeController tradeController = Get.put(TradeController());
  NavController navController = Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        appBar(width, height, context),
        content(width, height, context)
      ],
    ));
  }

  Widget appBar(double width, double height, context) {
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
            // stops: [0.1,0.9],
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

  Widget content(double width, double height, context) {
    return Positioned(
      top: 130,
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
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
              tabbar(width, height),
              Container(
                height: 110,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tradeController.tabController,
                  children: [tabView1(width, height), tabView2(width, height)],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Container(
                        width: width / 2.5,
                        height: height / 20,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 161, 160, 159).withOpacity(0.4),
                              blurRadius: 4,
                              offset: Offset(4, 4), // Shadow position
                            ),
                          ],
                          color: tradeController.active.isFalse
                              ? Color(0xffAF1D1D)
                              : Color(0xffBDC3D1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            tradeController.tabSell();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'SELL',
                            style: GoogleFonts.montserrat(
                                fontSize: 22,
                                color: Color(0xFFE8EDF5),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Container(
                        width: width / 2.5,
                        height: height / 20,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 161, 160, 159).withOpacity(0.4),
                              blurRadius: 4,
                              offset: Offset(4, 4), // Shadow position
                            ),
                          ],
                          color: tradeController.active.isTrue
                              ? Color(0xff2E70CC)
                              : Color(0xffBDC3D1),
                          // border: Border.all(color: Color(0xFF707070)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            tradeController.tabBuy();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'BUY',
                            style: GoogleFonts.montserrat(
                                fontSize: 22,
                                color: Color(0xFFF1F7FF),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Obx(() => Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    color: Color(0xFFE8EDF5),
                    child: Container(
                      padding: EdgeInsets.only(left: 30),
                      height: 30,
                      color: Color(0xFFF1F3F6),
                      child: Center(
                        child: DropdownButton(
                          dropdownColor: Color(0xFFFFFFFF),
                          iconSize: 0.0,
                          elevation: 1,
                          underline: const SizedBox(),
                          hint: Text(
                            'Market Price',
                          ),
                          onChanged: (newValue) {
                            tradeController.setSelected(newValue!);
                          },
                          value: tradeController.selected.value,
                          items: tradeController.listType.map((selectedType) {
                            return DropdownMenuItem(
                              child: new Text(
                                selectedType,
                                style: GoogleFonts.montserrat(
                                    color: Color(0xFF2E70CC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              value: selectedType,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Obx(
                    () => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Obx(() => Row(
                                children: [
                                  tradeController.selected.value ==
                                          "Stop Limit Order"
                                      ? Text("Limit Price",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Color(0xFF707070),
                                              fontWeight: FontWeight.w500))
                                      : Text("Price",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Color(0xFF707070),
                                              fontWeight: FontWeight.w500)),
                                ],
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: width / 1.5,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 25, color: Color(0xFF2E70CC)),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(top: 20),
                                        border: InputBorder.none,
                                        hintStyle: GoogleFonts.montserrat(
                                            fontSize: 25,
                                            color: Color(0xFF2E70CC)),
                                        hintText: '0'),
                                  ),
                                ),
                                Positioned(
                                    top: 25,
                                    right: 0,
                                    child: Text(
                                      "THB",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: Color(0xFF8B92A1)),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: width / 1.5,
                          color: Color(0xFF8B92A1),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text("Amount",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Color(0xFF707070),
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: width / 1.5,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 25, color: Color(0xFF2E70CC)),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(top: 20),
                                        // suffixIcon: Image.asset(
                                        //   "assets/images/Bg.png",
                                        //   scale: 3,
                                        // ),
                                        hintStyle: GoogleFonts.montserrat(
                                            fontSize: 25,
                                            color: Color(0xFF2E70CC)),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF8B92A1)),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF8B92A1)),
                                        ),
                                        hintText: '1'),
                                  ),
                                ),
                                Positioned(
                                    top: 25,
                                    right: 0,
                                    child: Text(
                                      "Bg",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: Color(0xFF8B92A1)),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        if (tradeController.selected == "Stop Limit Order")
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Text("Stop Price",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            color: Color(0xFF707070),
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: width / 1.5,
                                        child: TextField(
                                          textInputAction: TextInputAction.next,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 25,
                                              color: Color(0xFF2E70CC)),
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 20),
                                              // suffixIcon: Image.asset(
                                              //   "assets/images/Bg.png",
                                              //   scale: 3,
                                              // ),
                                              hintStyle: GoogleFonts.montserrat(
                                                  fontSize: 25,
                                                  color: Color(0xFF2E70CC)),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF8B92A1)),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF8B92A1)),
                                              ),
                                              hintText: '1'),
                                        ),
                                      ),
                                      Positioned(
                                          top: 25,
                                          right: 0,
                                          child: Text(
                                            "THB",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                color: Color(0xFF8B92A1)),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: Text("Pin",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Color(0xFF707070),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border(bottom: BorderSide(width: 1.0))),
                                width: width / 2.8,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16, color: Color(0xFF2E70CC)),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Icon(
                                  Icons.lock_open_sharp,
                                  color: Color(0xFF8B92A1),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Container(
                            width: width / 2.5,
                            height: height / 20,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFA0C7FE),
                                    Color(0xFF406AA1),
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => dialog(context),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: Text(
                                'SUBMIT',
                                style: GoogleFonts.montserrat(
                                    fontSize: 22,
                                    color: Color(0xFFF1F7FF),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Text(
                "",
                style: GoogleFonts.notoSans(fontSize: 100),
              ),
              Text(
                "",
                style: GoogleFonts.notoSans(fontSize: 100),
              ),
            ],
          ),
        ),
      ),
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
              onTap: (value) {
                tradeController.setTap(value);
              },
              labelStyle: GoogleFonts.montserrat(
                fontSize: 18,
              ),
              unselectedLabelStyle:
                  GoogleFonts.notoSans(fontSize: 18, color: Color(0xFF8B92A1)),
              controller: tradeController.tabController,
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
                        color: tradeController.valueTap.value == 0
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
                        color: tradeController.valueTap.value == 1
                            ? Color(0xFFFFFFFF)
                            : Color(0xFF8B92A1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ])),
    );
  }

  Widget tabView1(double width, double height) {
    return Column(
      children: [
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
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/dot.png"),
                            size: 10,
                            color: Color(0xFF2E70CC),
                          ),
                          Text(
                            "Open",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF2E70CC), fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        "30,550",
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF5899F2), fontSize: 36),
                      ),
                      Text("")
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 35),
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
                            color: Color(0xFF2E70CC), fontSize: 36),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "THB",
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF8B92A1), fontSize: 10),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget tabView2(double width, double height) {
    return Column(
      children: [
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
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/dot.png"),
                            size: 10,
                            color: Color(0xFF2E70CC),
                          ),
                          Text(
                            "Open",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF2E70CC), fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        "31,868",
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF5899F2), fontSize: 36),
                      ),
                      Text("")
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 35),
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
                        "32,718",
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF5899F2), fontSize: 36),
                      ),
                      SizedBox(height: 5),
                      Text("THB")
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }

  dialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titlePadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text("คุณต้องการซื้อ",
              style: GoogleFonts.kanit(color: Color(0xFF1A1818), fontSize: 16)),
          SizedBox(
            height: 5,
          ),
          Text("ทองคำแท่ง 96.50%",
              style: GoogleFonts.kanit(color: Color(0xFF12C28C), fontSize: 16)),
          SizedBox(
            height: 5,
          ),
          Text("จำนวน 5 Bg",
              style: GoogleFonts.kanit(color: Color(0xFF82726D), fontSize: 16)),
          SizedBox(
            height: 5,
          ),
          Text("ยอดเงินที่คุณจะต้องชำระ",
              style: GoogleFonts.kanit(color: Color(0xFF82726D), fontSize: 16)),
          SizedBox(
            height: 5,
          ),
          Text("153,250 บาท",
              style: GoogleFonts.kanit(color: Color(0xFF407FD6), fontSize: 16)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ยืนยันคำสั่งภายใน",
                    style: GoogleFonts.kanit(
                        color: Color(0xFFAF1D1D), fontSize: 16)),
                Text("5 S",
                    style: GoogleFonts.kanit(
                        color: Color(0xFFAF1D1D), fontSize: 16))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: 142,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFBDC3D1)),
                      color: Color(0xFFFFFFFF),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      'ยกเลิก',
                      style: GoogleFonts.kanit(
                          fontSize: 16, color: Color(0xFF707070)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  dialogSuccess(context);
                },
                child: Container(
                  height: 50,
                  width: 142,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Color(0xFFBDC3D1)),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      'ยืนยัน',
                      style: GoogleFonts.kanit(
                          fontSize: 16, color: Color(0xFF707070)),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
    );
  }

  dialogSuccess(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              titlePadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("ทำรายการซื้อสำเร็จ",
                        style: GoogleFonts.kanit(
                            color: Color(0xFF12C28C), fontSize: 16)),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFBDC3D1)),
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            'กลับสู่หน้าซื้อ-ขาย',
                            style: GoogleFonts.kanit(
                                fontSize: 16, color: Color(0xFF707070)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        navController.goOrderPage();
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border.all(color: Color(0xFFBDC3D1)),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            'ไปที่หน้าออเดอร์',
                            style: GoogleFonts.kanit(
                                fontSize: 16, color: Color(0xFF707070)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              contentPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
            ));
  }
}
