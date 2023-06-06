import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecgold/app/modules/portfolio/views/showqr_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({Key? key}) : super(key: key);
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
                        Icon(
                          Icons.history,
                          color: Color(0xFFFFFFFF),
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
                        Icon(
                          Icons.notifications,
                          color: Color(0xFFFFFFFF),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
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
            top: 10,
          ),
          width: width,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Obx(
            () => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: width / 9,
                      ),
                      child: InkWell(
                          onTap: () => Get.back(),
                          child: Icon(Icons.arrow_back_ios_new_sharp)),
                    ),
                    DropdownButton2(
                      alignment: Alignment.center,
                      iconStyleData: IconStyleData(iconSize: 0),
                      underline: const SizedBox(),
                      onChanged: (newValue) {
                        historyController.setSelected(newValue.toString());
                      },
                      value: historyController.selected.value,
                      items: historyController.listType.map((selectedType) {
                        return DropdownMenuItem(
                          alignment: Alignment.center,
                          child: Text(
                            selectedType,
                            style: GoogleFonts.notoSansThai(
                              color: Color(0xFF5899F2),
                              fontSize: 16,
                            ),
                          ),
                          value: selectedType,
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30,
                      ),
                      child: InkWell(
                        child: Icon(Icons.keyboard_arrow_down_sharp),
                      ),
                    )
                  ],
                ),
                if (historyController.selected.value ==
                    "ประวัติ ฝาก-ถอน เงินหลักประกัน")
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "ฝาก",
                              style: GoogleFonts.notoSansThai(
                                  color: Color(0xFF21AC3D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("")
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "30",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFF21AC3D),
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: width / 5,
                        ),
                        Column(
                          children: [
                            Text(
                              "ถอน",
                              style: GoogleFonts.notoSansThai(
                                  color: Color(0xFFD85D5D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("")
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "25",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFD85D5D),
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(""),
                            Text(
                              "Order",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF8B92A1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (historyController.selected.value == "ประวัติการรับทองคำ")
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "99.99%",
                              style: GoogleFonts.notoSansThai(
                                  color: Color(0xFFC2AC95),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("")
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "1",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFC2AC95),
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(""),
                            Text(
                              "Kg",
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF8B92A1),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              "96.50%",
                              style: GoogleFonts.notoSansThai(
                                  color: Color(0xFFE4A700),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("")
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "50",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFE4A700),
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(""),
                            Text(
                              "Bg",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF8B92A1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (historyController.selected.value ==
                        "ประวัติการทำรายการซื้อ-ขาย" ||
                    historyController.selected.value ==
                        "ประวัติการทำรายการเคลียริ่ง")
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Buy",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF21AC3D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("")
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "30",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFF21AC3D),
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              "Sell",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFFD85D5D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("")
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "25",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFD85D5D),
                              fontSize: 36,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(""),
                            Text(
                              "Order",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF8B92A1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
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
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  showIOS_DatePicker(context, height);
                                },
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFF707070),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Obx(() => InkWell(
                                    onTap: () {
                                      showIOS_DatePicker(context, height);
                                    },
                                    child: Text(
                                      historyController.month.value,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: Color(0xFF707070)),
                                    ),
                                  ))
                            ],
                          )),
                        ),
                        Obx(() => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (historyController.selected.value ==
                                          "ประวัติ ฝาก-ถอน เงินหลักประกัน") {
                                        return bottomsheetMarginType(context);
                                      }
                                      if (historyController.selected.value ==
                                          "ประวัติการรับทองคำ") {
                                        return bottomsheetRedeemType(context);
                                      }
                                      if (historyController.selected.value ==
                                          "ประวัติการทำรายการซื้อ-ขาย") {
                                        return bottomsheetBuySellType(context);
                                      }
                                      if (historyController.selected.value ==
                                          "ประวัติการทำรายการเคลียริ่ง") {
                                        return bottomsheetClearingType(context);
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        if (historyController.selected.value ==
                                            "ประวัติ ฝาก-ถอน เงินหลักประกัน")
                                          Text(
                                            "Type: ${historyController.margin.value} ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Color(0xFF777070)),
                                          ),
                                        if (historyController.selected.value ==
                                            "ประวัติการรับทองคำ")
                                          Text(
                                            "Type: ${historyController.redeemGoldType.value} ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Color(0xFF777070)),
                                          ),
                                        if (historyController.selected.value ==
                                            "ประวัติการทำรายการซื้อ-ขาย")
                                          Text(
                                            "Type: ${historyController.buySellType.value} ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Color(0xFF777070)),
                                          ),
                                        if (historyController.selected.value ==
                                            "ประวัติการทำรายการเคลียริ่ง")
                                          Text(
                                            "Type: ${historyController.clearingType.value} ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Color(0xFF777070)),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (historyController.selected.value ==
                                          "ประวัติการทำรายการซื้อ-ขาย" ||
                                      historyController.selected.value ==
                                          "ประวัติการทำรายการเคลียริ่ง")
                                    InkWell(
                                      onTap: () {
                                        if (historyController.selected.value ==
                                            "ประวัติการทำรายการซื้อ-ขาย") {
                                          return bottomsheetBuySellGoldType(
                                              context);
                                        }
                                        if (historyController.selected.value ==
                                            "ประวัติการทำรายการเคลียริ่ง") {
                                          return bottomsheetClearingGoldType(
                                              context);
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          if (historyController
                                                  .selected.value ==
                                              "ประวัติการทำรายการซื้อ-ขาย")
                                            Text(
                                              "Gold Type: ${historyController.buySellGoldType.value} ",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12,
                                                  color: Color(0xFF777070)),
                                            ),
                                          if (historyController
                                                  .selected.value ==
                                              "ประวัติการทำรายการเคลียริ่ง")
                                            Text(
                                              "Gold Type: ${historyController.clearingGoldType.value} ",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12,
                                                  color: Color(0xFF777070)),
                                            ),
                                        ],
                                      ),
                                    ),
                                  InkWell(
                                    onTap: () {
                                      if (historyController.selected.value ==
                                          "ประวัติ ฝาก-ถอน เงินหลักประกัน") {
                                        return bottomsheetMarginStatus(context);
                                      }
                                      if (historyController.selected.value ==
                                          "ประวัติการรับทองคำ") {
                                        return bottomsheetRedeemStatus(context);
                                      }
                                      if (historyController.selected.value ==
                                          "ประวัติการทำรายการซื้อ-ขาย") {
                                        return bottomsheetBuySellStatus(
                                            context);
                                      }
                                      if (historyController.selected.value ==
                                          "ประวัติการทำรายการเคลียริ่ง") {
                                        return bottomsheetClearingStatus(
                                            context);
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        if (historyController.selected.value ==
                                            "ประวัติ ฝาก-ถอน เงินหลักประกัน")
                                          Text(
                                            "Status: ${historyController.marginStatus.value} ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Color(0xFF777070)),
                                          ),
                                        if (historyController.selected.value ==
                                            "ประวัติการรับทองคำ")
                                          Text(
                                            "Status: ${historyController.redeemStatus.value} ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Color(0xFF777070)),
                                          ),
                                        if (historyController.selected.value ==
                                            "ประวัติการทำรายการซื้อ-ขาย")
                                          Text(
                                            "Status: ${historyController.buySellStatus.value} ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Color(0xFF777070)),
                                          ),
                                           if (historyController.selected.value ==
                                          "ประวัติการทำรายการเคลียริ่ง")
                                          Text(
                                            "Status: ${historyController.clearingStatus.value} ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: Color(0xFF777070)),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        if (historyController.selected.value ==
                            "ประวัติ ฝาก-ถอน เงินหลักประกัน")
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
                                        padding: EdgeInsets.only(
                                            left: 30, right: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "#BG9623013000002",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 13,
                                                  color: Color(0xFF1A1818),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text("Waiting",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 13,
                                                    color: Color(0xFFE58F4E),
                                                    fontWeight:
                                                        FontWeight.w500)),
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
                                        padding: EdgeInsets.only(
                                            left: 30, right: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Deposit",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 15,
                                                      color: Color(0xFF12C28C),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "",
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("จำนวนเงิน",
                                                    style: GoogleFonts
                                                        .notoSansThai(
                                                      fontSize: 13,
                                                      color: Color(0xFF1A1818),
                                                    )),
                                                Text("30,650 Bath",
                                                    style:
                                                        GoogleFonts.montserrat(
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("ช่องทาง",
                                                    style: GoogleFonts
                                                        .notoSansThai(
                                                      fontSize: 13,
                                                      color: Color(0xFF1A1818),
                                                    )),
                                                Text("QR-Code",
                                                    style:
                                                        GoogleFonts.montserrat(
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Ref No :",
                                                    style: GoogleFonts
                                                        .notoSansThai(
                                                      fontSize: 13,
                                                      color: Color(0xFF1A1818),
                                                    )),
                                                Text("#0123456789012345",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 13,
                                                      color: Color(0xFF002458),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.delete_rounded,
                                                  color: Color(0xFF6B605D),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (historyController.more.isFalse)
                                        Container(
                                          height: 2,
                                          color: Color(0xFFD9DFEB),
                                        ),
                                      if (historyController.more.isFalse)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  historyController.setMore();
                                                },
                                                icon: Icon(Icons
                                                    .keyboard_arrow_right)),
                                          ],
                                        ),
                                      if (historyController.more.isTrue)
                                        SizedBox(
                                          height: 10,
                                        ),
                                      if (historyController.more.isTrue)
                                        Container(
                                          height: 2,
                                          color: Color(0xFFD9DFEB),
                                        ),
                                      if (historyController.more.isTrue)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  historyController.setMore();
                                                },
                                                icon: Icon(
                                                    Icons.keyboard_arrow_up)),
                                          ],
                                        ),
                                    ],
                                  ))),
                            ),
                          ),
                        if (historyController.selected.value ==
                            "ประวัติการรับทองคำ")
                          redeem(height),
                        if (historyController.selected.value ==
                            "ประวัติการทำรายการซื้อ-ขาย")
                          buySellHistory(height),
                        if (historyController.selected.value ==
                            "ประวัติการทำรายการเคลียริ่ง")
                          clearingHistory(height)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget redeem(double height) {
    return ListView.builder(
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
                      Text("Finish",
                          style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: Color(0xFF5899F2),
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
                            "Redeem",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Color(0xFFE4A700),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "",
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
                          Text("จำนวน",
                              style: GoogleFonts.notoSansThai(
                                fontSize: 13,
                                color: Color(0xFF1A1818),
                              )),
                          Text("10 Bg",
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
                          Text("ช่องทาง",
                              style: GoogleFonts.notoSansThai(
                                fontSize: 13,
                                color: Color(0xFF1A1818),
                              )),
                          Text("สาขา 1",
                              style: GoogleFonts.notoSansThai(
                                fontSize: 13,
                                color: Color(0xFF1A1818),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (historyController.more.isFalse)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete_rounded,
                              color: Color(0xFF6B605D),
                            )
                          ],
                        ),
                      if (historyController.more.isFalse)
                        SizedBox(
                          height: 10,
                        ),
                    ],
                  ),
                ),
                if (historyController.more.isFalse)
                  Container(
                    height: 2,
                    color: Color(0xFFD9DFEB),
                  ),
                if (historyController.more.isFalse)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            historyController.setMore();
                          },
                          icon: Icon(Icons.keyboard_arrow_right)),
                    ],
                  ),
                if (historyController.more.isTrue)
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ref No :",
                                style: GoogleFonts.notoSansThai(
                                  fontSize: 13,
                                  color: Color(0xFF1A1818),
                                )),
                            Text("#0123456789012345",
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
                            Text("วันที่รับทองสำเร็จ",
                                style: GoogleFonts.notoSansThai(
                                  fontSize: 13,
                                  color: Color(0xFF1A1818),
                                )),
                            Text("DD/MM/YYYY",
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
                            Text("เวลาที่รับทองสำเร็จ",
                                style: GoogleFonts.notoSansThai(
                                  fontSize: 13,
                                  color: Color(0xFF1A1818),
                                )),
                            Text("10:30:35",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Color(0xFF1A1818),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (historyController.more.isTrue)
                  SizedBox(
                    height: 10,
                  ),
                if (historyController.more.isTrue)
                  Container(
                    height: 2,
                    color: Color(0xFFD9DFEB),
                  ),
                if (historyController.more.isTrue)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            historyController.setMore();
                          },
                          icon: Icon(Icons.keyboard_arrow_up)),
                    ],
                  ),
              ],
            ))),
      ),
    );
  }

  bottomsheetMarginType(context) {
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
                    title: new Text(historyController.listMarginType[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedMarginType(
                          historyController.listMarginType[index]);
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

  bottomsheetMarginStatus(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: new Text(historyController.listMarginStatus[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedMarginStatus(
                          historyController.listMarginStatus[index]);
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

  bottomsheetRedeemType(context) {
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
                    title:
                        new Text(historyController.listRedeemGoldType[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedRedeemGoldType(
                          historyController.listRedeemGoldType[index]);
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

  bottomsheetRedeemStatus(context) {
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
                    title: new Text(historyController.listRedeemStatus[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedRedeemStatus(
                          historyController.listRedeemStatus[index]);
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

  bottomsheetBuySellType(context) {
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
                    title: new Text(historyController.listBuySellType[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedBuySellType(
                          historyController.listBuySellType[index]);
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

  bottomsheetBuySellGoldType(context) {
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
                    title:
                        new Text(historyController.listBuySellGoldType[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedBuySellGoldType(
                          historyController.listBuySellGoldType[index]);
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

  bottomsheetBuySellStatus(context) {
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
                    title: new Text(historyController.listBuySellStatus[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedBuySellStatus(
                          historyController.listBuySellStatus[index]);
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

  bottomsheetClearingType(context) {
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
                    title: new Text(historyController.listClearingType[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedClearingType(
                          historyController.listClearingType[index]);
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

  bottomsheetClearingGoldType(context) {
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
                    title:
                        new Text(historyController.listClearingGoldType[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedClearingGoldType(
                          historyController.listClearingGoldType[index]);
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

  bottomsheetClearingStatus(context) {
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
                    title:
                        new Text(historyController.listClearingStatus[index]),
                    onTap: () {
                      Navigator.pop(context);
                      historyController.setSelectedClearingStatus(
                          historyController.listClearingStatus[index]);
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

  Widget buySellHistory(double height) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 3,
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
                if (historyController.more.isFalse)
                  Container(
                    height: 2,
                    color: Color(0xFFD9DFEB),
                  ),
                if (historyController.more.isFalse)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            historyController.setMore();
                          },
                          icon: Icon(Icons.keyboard_arrow_right)),
                    ],
                  ),
                if (historyController.more.isTrue)
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
                if (historyController.more.isTrue)
                  SizedBox(
                    height: 10,
                  ),
                Container(
                  height: 2,
                  color: Color(0xFFD9DFEB),
                ),
                if (historyController.more.isTrue)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            historyController.setMore();
                          },
                          icon: Icon(Icons.keyboard_arrow_up)),
                    ],
                  ),
              ],
            ))),
      ),
    );
  }

  Widget clearingHistory(double height) {
    return ListView.builder(
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
                      Text("Paid",
                          style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: Color(0xFF12C28C),
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
                if (historyController.more.isFalse)
                  Container(
                    height: 2,
                    color: Color(0xFFD9DFEB),
                  ),
                if (historyController.more.isFalse)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            historyController.setMore();
                          },
                          icon: Icon(Icons.keyboard_arrow_right)),
                    ],
                  ),
                if (historyController.more.isTrue)
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
                if (historyController.more.isTrue)
                  SizedBox(
                    height: 10,
                  ),
                Container(
                  height: 2,
                  color: Color(0xFFD9DFEB),
                ),
                if (historyController.more.isTrue)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            historyController.setMore();
                          },
                          icon: Icon(Icons.keyboard_arrow_up)),
                    ],
                  ),
              ],
            ))),
      ),
    );
  }

  showIOS_DatePicker(context, double height) {
    return showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 300,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "เสร็จสิ้น",
                              ))
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    height: 200,
                    child: CupertinoPicker(
                      useMagnifier: true,
                      looping: true,
                      children: [
                        Text("January"),
                        Text("February"),
                        Text("March"),
                        Text("April"),
                        Text("May"),
                        Text("June"),
                        Text("July"),
                        Text("August"),
                        Text("September"),
                        Text("October"),
                        Text("November"),
                        Text("December"),
                      ],
                      itemExtent: 30,
                      onSelectedItemChanged: (value) {
                        historyController.setMonth(value);
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
