import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecgold/app/common/dialog.dart';
import 'package:ecgold/app/modules/history/controllers/history_controller.dart';
import 'package:ecgold/app/modules/history/views/history_view.dart';
import 'package:ecgold/app/modules/notification/views/notification_view.dart';
import 'package:ecgold/app/modules/portfolio/views/showqr_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  OrderView({Key? key}) : super(key: key);
  OrderController orderController = Get.put(OrderController());
  HistoryController historyController = Get.put(HistoryController());
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
          child: Stack(
            children: [
              Obx(() => Positioned(
                  right: 20,
                  child: orderController.indexValue.value == 0
                      ? InkWell(
                          onTap: () {
                            Get.to(() => HistoryView());
                            historyController.setVallist();
                          },
                          child: Icon(
                            Icons.history,
                            size: 30,
                            color: Color(0xFF3E72BC),
                          ))
                      : InkWell(
                          onTap: () {
                            Get.to(() => HistoryView());
                            historyController.setValClearing();
                          },
                          child: Icon(
                            Icons.history,
                            size: 30,
                            color: Color(0xFF3E72BC),
                          )))),
              Column(
                children: [
                  tabbar(width, height),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    //physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              width: width,
                              height: 40,
                              color: Color(0xFFBDC3D1),
                              child: orderController.indexValue == 1
                                  ? Row(
                                      children: [
                                        toggle(),
                                        Text(
                                          "ชำระเงิน",
                                          style: GoogleFonts.notoSansThai(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  : null,
                            )),
                        Container(
                          height: height / 0.5,
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: orderController.tabController,
                            children: [
                              tabView1(width, height, context),
                              Obx(() => tabView2(width, height,context))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
              labelStyle: GoogleFonts.montserrat(
                fontSize: 18,
              ),
              onTap: (value) {
                //print(value);
                orderController.setIndexValue(value);
              },
              unselectedLabelStyle: GoogleFonts.montserrat(
                  fontSize: 18, color: Color(0xFF8B92A1)),
              controller: orderController.tabController,
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
                    "Order",
                    style: GoogleFonts.montserrat(
                        color: orderController.indexValue.value == 0
                            ? Color(0xFFFFFFFF)
                            : Color(0xFF8B92A1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "Clearing",
                    style: GoogleFonts.montserrat(
                        color: orderController.indexValue.value == 1
                            ? Color(0xFFFFFFFF)
                            : Color(0xFF8B92A1),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ])),
    );
  }

  Widget tabView1(double width, double height, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  bottomsheetType(context);
                },
                child: Obx(() => Text(
                      "Type : ${orderController.type.value}  ",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xFF707070),
                          fontWeight: FontWeight.w500),
                    )),
              ),
              // dropdownType(),
              InkWell(
                onTap: () {
                  bottomsheetGoldType(context);
                },
                child: Obx(() => Text(
                      "Gold Type : ${orderController.goldType.value} ",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xFF777070),
                          fontWeight: FontWeight.w500),
                    )),
              ),
              //dropdownGoldType(),
              InkWell(
                onTap: () {
                  bottomsheetStatus(context);
                },
                child: Obx(() => Container(
                  width: 120,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                        "Status : ${orderController.status.value}",
                        style: GoogleFonts.montserrat(
                          
                            fontSize: 12,
                            color: Color(0xFF777070),
                            fontWeight: FontWeight.w500),
                      ),
                )),
              ),
              // dropdownStatus()
            ],
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Obx(() => Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0xFF707070).withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(
                      0,
                      5,
                    ),
                  )
                ], color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      height: height / 25,
                      color: Color(0xFFE8EDF5),
                      child: Row(children: [
                        Text(
                          "DD/MM/YYYY  09:45:35 (UTC+7)",
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Color(0xFF777070),
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#BG9623013000002",
                            style: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: Color(0xFF1A1818),
                                fontWeight: FontWeight.w500),
                          ),
                          Text("Matched",
                              style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Color(0xFF0A80F6),
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      color: Color(0xFFD9DFEB),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Buy",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Color(0xFF12C28C),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "1 Bg",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Color(0xFF1A1818),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ราคา",
                                  style: GoogleFonts.notoSansThai(
                                    fontSize: 13,
                                    color: Color(0xFF1A1818),
                                  )),
                              Text("30,650",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Color(0xFF2E70CC),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("รูปแบบ",
                                  style: GoogleFonts.notoSansThai(
                                    fontSize: 13,
                                    color: Color(0xFF1A1818),
                                  )),
                              Text("Market price",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Color(0xFF1A1818),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ยอดรวมราคา",
                                  style: GoogleFonts.notoSansThai(
                                    fontSize: 13,
                                    color: Color(0xFF1A1818),
                                  )),
                              Text("30,650",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Color(0xFF2E70CC),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    if (orderController.more.isFalse)
                      Container(
                        height: 2,
                        color: Color(0xFFD9DFEB),
                      ),
                    if (orderController.more.isFalse)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                orderController.setMore();
                              },
                              icon: Icon(Icons.keyboard_arrow_right)),
                        ],
                      ),
                    if (orderController.more.isTrue)
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ผู้ส่งคำสั่ง",
                                    style: GoogleFonts.notoSansThai(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    )),
                                Text("USER #01234567890",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("วันครบกำหนดชำระ",
                                    style: GoogleFonts.notoSansThai(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    )),
                                Text("DD/MM/YYYY (T+2)",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    if (orderController.more.isTrue)
                      SizedBox(
                        height: 10,
                      ),
                    Container(
                      height: 2,
                      color: Color(0xFFD9DFEB),
                    ),
                    if (orderController.more.isTrue)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                orderController.setMore();
                              },
                              icon: Icon(Icons.keyboard_arrow_up)),
                        ],
                      ),
                  ],
                ))),
          ),
        ),
      ],
    );
  }

  Widget tabView2(double width, double height, BuildContext context) {
    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  bottomsheetType(context);
                },
                child: Obx(() => Text(
                      "Type : ${orderController.type.value}  ",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xFF707070),
                          fontWeight: FontWeight.w500),
                    )),
              ),
              // dropdownType(),
              InkWell(
                onTap: () {
                  bottomsheetGoldType(context);
                },
                child: Obx(() => Text(
                      "Gold Type : ${orderController.goldType.value} ",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xFF777070),
                          fontWeight: FontWeight.w500),
                    )),
              ),
              //dropdownGoldType(),
              InkWell(
                onTap: () {
                  bottomsheetStatus(context);
                },
                child: Obx(() => Container(
                  width: 120,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                        "Status : ${orderController.status.value}",
                        style: GoogleFonts.montserrat(
                          
                            fontSize: 12,
                            color: Color(0xFF777070),
                            fontWeight: FontWeight.w500),
                      ),
                )),
              ),
              // dropdownStatus()
            ],
          ),
        ),
        if (orderController.switchValue.isFalse)
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Obx(() => Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        0,
                        5,
                      ),
                    )
                  ], color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        height: height / 25,
                        color: Color(0xFFE8EDF5),
                        child: Row(children: [
                          Text(
                            "DD/MM/YYYY  09:45:35 (UTC+7)",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Color(0xFF777070),
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "#BG9623013000002",
                              style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Color(0xFF1A1818),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("Waiting for payment",
                                style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Color(0xFFE4BE00),
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        color: Color(0xFFD9DFEB),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Buy",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color: Color(0xFF12C28C),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "1 Bg",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Color(0xFF1A1818),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ราคา",
                                    style: GoogleFonts.notoSansThai(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    )),
                                Text("30,650",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Color(0xFF2E70CC),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("รูปแบบ",
                                    style: GoogleFonts.notoSansThai(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    )),
                                Text("Market price",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ยอดรวมราคา",
                                    style: GoogleFonts.notoSansThai(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    )),
                                Text("30,650",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Color(0xFF2E70CC),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      if (orderController.more.isFalse)
                        Container(
                          height: 2,
                          color: Color(0xFFD9DFEB),
                        ),
                      if (orderController.more.isFalse)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  orderController.setMore();
                                },
                                icon: Icon(Icons.keyboard_arrow_right)),
                          ],
                        ),
                      if (orderController.more.isTrue)
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("ผู้ส่งคำสั่ง",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("USER #01234567890",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("วันครบกำหนดชำระ",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("DD/MM/YYYY (T+2)",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      if (orderController.more.isTrue)
                        SizedBox(
                          height: 10,
                        ),
                      if (orderController.more.isTrue)
                        Container(
                          height: 2,
                          color: Color(0xFFD9DFEB),
                        ),
                      if (orderController.more.isTrue)
                        SizedBox(
                          height: 10,
                        ),
                      if (orderController.more.isTrue)
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("วันที่ทำรายการชำระสำเร็จ",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("-",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("เวลาทำรายการชำระสำเร็จ",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("-",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("ธนาคาร",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("-",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("ช่องทางการชำระ",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("QR Payment",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ref No.",
                                      style: GoogleFonts.notoSans(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("T01234567890",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      if (orderController.more.isTrue)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  orderController.setMore();
                                },
                                icon: Icon(Icons.keyboard_arrow_up)),
                          ],
                        ),
                    ],
                  ))),
            ),
          ),
        if (orderController.switchValue.isTrue)
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xFF707070).withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(
                          0,
                          5,
                        ),
                      )
                    ], color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          height: height / 25,
                          color: Color(0xFFE8EDF5),
                          child: Row(children: [
                            Text(
                              "DD/MM/YYYY  09:45:35 (UTC+7)",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Color(0xFF777070),
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 18, right: 15),
                          child: Row(
                            children: [
                              Obx(() => Checkbox(
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    value: orderController.check.value,
                                    onChanged: (value) {
                                      orderController.setcheckBox();
                                    },
                                  )),
                              //   Image.asset("assets/images/check.png",scale: 3,),
                              //  Image.asset("assets/images/nocheck.png",scale: 3,),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "#BG9623013000002",
                                style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Color(0xFF1A1818),
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Text("Waiting for payment",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Color(0xFFE4BE00),
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: Color(0xFFD9DFEB),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Buy",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        color: Color(0xFF12C28C),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "1 Bg",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Color(0xFF1A1818),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("ราคา",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("30,650",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF2E70CC),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("รูปแบบ",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("Market price",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("ยอดรวมราคา",
                                      style: GoogleFonts.notoSansThai(
                                        fontSize: 13,
                                        color: Color(0xFF1A1818),
                                      )),
                                  Text("30,650",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Color(0xFF2E70CC),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 2,
                                color: Color(0xFFD9DFEB),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.to(ShowqrView());
                                      },
                                      icon: Icon(Icons.keyboard_arrow_right)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        SizedBox(
          height: 30,
        ),
        if (orderController.switchValue.isTrue)
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                decoration: BoxDecoration(color: Color(0xFFE8EDF5)),
                child: Row(
                  children: [
                    Text(
                      "ช่องทางการชำระเงิน",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 16, color: Color(0xFF3E72BC)),
                    ),
                    Spacer(),
                    Text(
                      "QR Payment",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Color(0xFF3E72BC)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                decoration: BoxDecoration(color: Color(0xFF407FD6)),
                child: Row(
                  children: [
                    Text(
                      "ยอดรวมที่ต้องชำระ",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 16, color: Color(0xFFFFFFFF)),
                    ),
                    Spacer(),
                    Text(
                      "73,000 บาท",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 16, color: Color(0xFFFFFFFF)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Color(0xFF407FD6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  width: 110,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF5899F2),
                          Color(0xFF083F95),
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(ShowqrView());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: Text(
                      'ยืนยัน',
                      style: GoogleFonts.notoSansThai(
                          fontSize: 16,
                          color: Color(0xFFF1F7FF),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          )
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: ImageIcon(
                        AssetImage(
                          "assets/images/closecircle.png",
                        ),
                        size: 30,
                        color: Color(0xFFBFBDB8),
                      ))),
            ],
          ),
          Text(
            "คุณต้องการ",
            style: TextStyle(
              color: Color(0xFF1A1818),
              fontSize: 24,
            ),
          ),
          Text(
            "ขายทองคำรูปพรรณ 96.50%",
            style: TextStyle(fontSize: 20, color: Color(0xFFBE3F50)),
          ),
          Text(
            "ขายที่ราคาตลาด",
            style: TextStyle(fontSize: 20, color: Color(0xFF82726D)),
          ),
          Text(
            "30,000 บาท",
            style: TextStyle(fontSize: 20, color: Color(0xFF82726D)),
          ),
          Text(
            "จำนวน 5 Bg",
            style: TextStyle(fontSize: 20, color: Color(0xFF82726D)),
          ),
          Text("ยอดเงินที่คุณจะได้รับ",
              style: TextStyle(fontSize: 20, color: Color(0xFF82726D))),
          Text("150,000 บาท",
              style: TextStyle(fontSize: 20, color: Color(0xFF1A1818))),
          SizedBox(
            height: 20,
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
                      color: Color(0xFFBFBDB8),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      'ยกเลิก',
                      style: GoogleFonts.notoSansThai(
                          fontSize: 20, color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  // showDialog(
                  //   barrierDismissible: true,
                  //   context: context,
                  //   builder: (context) => successDialog(context),
                  // );
                },
                child: Container(
                  height: 50,
                  width: 142,
                  decoration: BoxDecoration(
                      color: Color(0xFFD9A52C),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      'ตกลง',
                      style: GoogleFonts.notoSansThai(
                          fontSize: 20, color: Color(0xFFFFFFFF)),
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

  Widget toggle() {
    return Obx(() => Transform.scale(
        scale: 0.6,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE8EDF5),

            borderRadius: BorderRadius.circular(30),
            // border: Border.all(
            //     color: //orderController.switchValue.isTrue
            //         // ? Color.fromARGB(255, 103, 106, 113)
            //          Color(0xFFFFFFFF),
            //     width: 2)
          ),
          child: CupertinoSwitch(
            thumbColor: orderController.switchValue.isTrue
                ? Color(0xFF5899F2)
                : Color(0xFFE8EDF5),
            trackColor: Color(0xFFBDC3D1),
            activeColor: Color(0xFFBDC3D1),
            value: orderController.switchValue.value,
            onChanged: (value) {
              orderController.ontap();
            },
          ),
        )));
  }

  bottomsheetType(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: new Text(orderController.typeList[index]),
                    onTap: () {
                      Navigator.pop(context);
                      orderController.setType(orderController.typeList[index]);
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        });
  }

  bottomsheetGoldType(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: new Text(orderController.goldTypeList[index]),
                    onTap: () {
                      Navigator.pop(context);
                      orderController
                          .setGoldType(orderController.goldTypeList[index]);
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        });
  }

  bottomsheetStatus(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: new Text(orderController.statusList[index]),
                    onTap: () {
                      Navigator.pop(context);
                      orderController
                          .setStatus(orderController.statusList[index]);
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        });
  }
}
