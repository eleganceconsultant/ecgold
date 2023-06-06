import 'dart:ui';

import 'package:ecgold/app/modules/portfolio/controllers/portfolio_controller.dart';
import 'package:ecgold/app/modules/portfolio/views/showqr_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddmoneyView extends GetView {
  AddmoneyView({Key? key}) : super(key: key);
  PortfolioController portfolioController = Get.put(PortfolioController());

  ButtonStyle TextButtonStyle = TextButton.styleFrom(
    backgroundColor: Color(0xFFBFC4C9).withOpacity(0.7),
    minimumSize: Size(70, 70),
    maximumSize: Size(100, 100),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: CircleBorder(side: BorderSide(color: Color(0xFFE9E9E9))),
  );
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            appBar(width, height),
            content(width, height, context)
          ],
        ));
  }

  Widget appBar(double width, double height) {
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
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
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
                        Icon(
                          Icons.bar_chart,
                          color: Color(0xFFFFFFFF),
                        ),
                        Icon(
                          Icons.notifications,
                          color: Color(0xFFFFFFFF),
                        ),
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

  Widget content(double width, double height,context) {
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
                  padding: EdgeInsets.only(left: 20, right: width / 4, top: 10),
                  child: InkWell(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back_ios_new_sharp)),
                ),
                Text(
                  "เงินหลักประกัน",
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
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                          "ฝากเงินหลักประกัน",
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
                            "จำนวนเงินที่ต้องการฝาก",
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
                            pinbottomsheet(context);
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

  pinbottomsheet(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      backgroundColor: Color(0xFF88B9FC).withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 30, 28).withOpacity(0.3),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            height: 500,
            padding: EdgeInsets.only(
              left: 5.0,
              right: 5.0,
              top: 5.0,
              bottom: 5.0,
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 0,
                                  selectedIndex:
                                      portfolioController.count.value,
                                  code: portfolioController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 1,
                                  selectedIndex:
                                      portfolioController.count.value,
                                  code: portfolioController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 2,
                                  selectedIndex: portfolioController.count
                                      .value, //portfolioController.count.value,
                                  code: portfolioController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 3,
                                  selectedIndex: portfolioController.count
                                      .value, //portfolioController.count.value,
                                  code: portfolioController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 4,
                                  selectedIndex: portfolioController.count
                                      .value, //portfolioController.count.value,
                                  code: portfolioController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 5,
                                  selectedIndex: portfolioController.count
                                      .value, //portfolioController.count.value,
                                  code: portfolioController.pinNumber,
                                )),
                          ],
                        )),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 55),
                      width: width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(1);
                                  },
                                  child: Text('1',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(2);
                                  },
                                  child: Text('2',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(3);
                                  },
                                  child: Text('3',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(4);
                                  },
                                  child: Text(
                                    '4',
                                    style: GoogleFonts.notoSans(
                                        color: Color(0xFFFFFFFF), fontSize: 23),
                                  )),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(5);
                                  },
                                  child: Text('5',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(6);
                                  },
                                  child: Text('6',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(7);
                                  },
                                  child: Text('7',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(8);
                                  },
                                  child: Text('8',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(9);
                                  },
                                  child: Text('9',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextButton(
                                  //style: TextButtonStyle2,
                                  onPressed: () {},
                                  child: Text('')),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    portfolioController.addDigit(0);
                                  },
                                  child: Text('0',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                              
                                  onPressed: () {
                                    portfolioController.backspace();
                                  },
                                  child: Icon(
                                    Icons.backspace_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        print("HHHH");
                      },
                      child: Text(
                        "Forget your PIN code",
                        style: GoogleFonts.notoSans(
                            color: Color(0xffffffff), fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // ignore: prefer_ _ ructors
          ),
        );
      },
    );
  }
}

class DigitHolder extends StatefulWidget {
  final int selectedIndex;
  final int index;
  final String code;
  DigitHolder({
    required this.selectedIndex,
    Key? key,
    required this.width,
    required this.index,
    required this.code,
  }) : super(key: key);

  final double width;

  @override
  State<DigitHolder> createState() => _DigitHolderState();
}

class _DigitHolderState extends State<DigitHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.width * 0.17,
      width: widget.width * 0.17,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Color(0xFFBFBDB8),
        shape: BoxShape.circle,
      ),
      child: widget.code.length > widget.index
          ? Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            )
          : Container(),
    );
  }
}
