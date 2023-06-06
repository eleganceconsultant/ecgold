import 'package:ecgold/app/modules/portfolio/views/showqr_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/checkoutmoney_controller.dart';

class CheckoutmoneyView extends GetView<CheckoutmoneyController> {
  const CheckoutmoneyView({Key? key}) : super(key: key);
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: width / 5, top: 10),
                  child: InkWell(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back_ios_new_sharp)),
                ),
                Text(
                  "ถอนเงินหลักประกัน",
                  style: GoogleFonts.notoSansThai(
                    fontSize: 18,
                    color: Color(0xFF5899F2),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("     ")
              ],
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
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                        child: Text(
                          "ถอนเงินหลักประกัน",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 16, color: Color(0xFF5899F2)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Account ID : ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Color(0xFF214475)),
                              ),
                              Text(
                                "#01234567890",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Color(0xFF214475)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name : ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Color(0xFF214475)),
                              ),
                              Text(
                                "Mr.EC_Gold",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Color(0xFF214475)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Last name : ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Color(0xFF214475)),
                              ),
                              Text(
                                "Test Deposit",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Color(0xFF214475)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "จำนวนเงินที่ต้องการถอน",
                            style: GoogleFonts.notoSansThai(
                                fontSize: 14, color: Color(0xFF002458)),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("           "),
                              Text(
                                "50,000",
                                style: GoogleFonts.montserrat(
                                    fontSize: 26, color: Color(0xFF5899F2)),
                              ),
                              Text(
                                "THB",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Color(0xFF8B92A1)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Container(
                        width: width / 2.5,
                        height: height / 25,
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
                            // pinbottomsheet(context);
                            Get.to(ShowqrView());
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'ยืนยัน',
                            style: GoogleFonts.notoSansThai(
                                fontSize: 22,
                                color: Color(0xFFF1F7FF),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
