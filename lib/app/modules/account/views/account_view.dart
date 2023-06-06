import 'package:ecgold/app/common/dialog.dart';
import 'package:ecgold/app/modules/history/views/history_view.dart';
import 'package:ecgold/app/modules/notification/views/notification_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  AccountView({Key? key}) : super(key: key);
  AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        appBar(width, height, context),
        content(width, height)
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
              "บัญชี",
              style: GoogleFonts.notoSansThai(
                fontSize: 18,
                color: Color(0xFF5899F2),
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF88B9FC),
                    radius: 30,
                    child: CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage('assets/images/3048127.png'),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(Icons.camera_alt,color: Color(0xFF8B92A1),),
                  Spacer(),
                  Text("ID #01234567890",style: GoogleFonts.montserrat(
                    color: Color(0xFF2E70CC),
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ชื่อ",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 14, color: Color(0xFF707070)),
                      ),
                      Text(
                        "Mr.EC_Gold",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Color(0xFF707070)),
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
                        "นามสกุล",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 14, color: Color(0xFF707070)),
                      ),
                      Text(
                        "Test Acc",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Color(0xFF707070)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("หมายเลขบัตรประชาชน",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF707070))),
                      Text(
                        "1-2345-67890-12-3",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Color(0xFF707070)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("การยืนยันตัวตน E-KYC",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF707070))),
                      Text("สำเร็จ",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF5899F2)))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Password",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: Color(0xFF707070)),
                          ),
                          accountController.changeData.isTrue
                              ? changePasswordBTN(width, height)
                              : Text(
                                  "********",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14, color: Color(0xFF707070)),
                                ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mobile",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: Color(0xFF707070)),
                          ),
                          accountController.changeData.isTrue
                              ? changePhonenumberBTN(width, height)
                              : Text(
                                  "099-999-9999",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14, color: Color(0xFF707070)),
                                ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, color: Color(0xFF707070))),
                          accountController.changeData.isTrue
                              ? changeEmailBTN(width, height)
                              : Text(
                                  "Ec_Gold@gmail.com",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14, color: Color(0xFF707070)),
                                ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pin code",
                              style: GoogleFonts.notoSansThai(
                                  fontSize: 14, color: Color(0xFF707070))),
                          accountController.changeData.isTrue
                              ? changePinBTN(width, height)
                              : Text("******",
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 14, color: Color(0xFF707070)))
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() => Container(
                            height: height / 37,
                            width: width / 5,
                            decoration: BoxDecoration(
                              gradient: accountController.changeData.isFalse
                                  ? LinearGradient(
                                      colors: [
                                        Color(0xFFA0C7FE),
                                        Color(0xFF406AA1),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        Color(0xFFF2A0FE),
                                        Color(0xFFD69A40),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                              // border: Border.all(color: Color(0xFF707070)),
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                accountController.ontapchangeData();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: accountController.changeData.isFalse
                                  ? Text(
                                      'Edit',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Text(
                                      'Cancel',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400),
                                    ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "บัญชีธนาคาร",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 14, color: Color(0xFF707070)),
                      ),
                      Text(
                        "K-Bank",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Color(0xFF707070)),
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
                        "เลขที่บัญชีธนาคาร",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 14, color: Color(0xFF707070)),
                      ),
                      Text(
                        "123-456-7890",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Color(0xFF707070)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("การยืนยันบัญชีธนาคาร",
                          style: GoogleFonts.notoSansThai(
                              fontSize: 14, color: Color(0xFF707070))),
                      Text(
                        "รอการยืนยัน",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 14, color: Color(0xFFE4A700)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
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
                            // Get.to(() => NavigateView());
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'Edit',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Text(
              "",
              style: GoogleFonts.notoSans(fontSize: 100),
            ),
            Text(
              "",
              style: GoogleFonts.notoSans(fontSize: 60),
            ),
          ],
        )),
      ),
    );
  }

  Widget changePasswordBTN(double width, double height) {
    return Container(
      width: width / 5,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFF5899F2)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, shadowColor: Colors.transparent),
        child: Text('Change',
            style:
                GoogleFonts.montserrat(fontSize: 10, color: Color(0XFF5899F2))),
      ),
    );
  }

  Widget changePhonenumberBTN(double width, double height) {
    return Container(
      width: width / 5,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFF5899F2)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, shadowColor: Colors.transparent),
        child: Text('Change',
            style:
                GoogleFonts.montserrat(fontSize: 10, color: Color(0XFF5899F2))),
      ),
    );
  }

  Widget changeEmailBTN(double width, double height) {
    return Container(
      width: width / 5,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFF5899F2)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, shadowColor: Colors.transparent),
        child: Text('Change',
            style:
                GoogleFonts.montserrat(fontSize: 10, color: Color(0XFF5899F2))),
      ),
    );
  }

  Widget changePinBTN(double width, double height) {
    return Container(
      width: width / 5,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFF5899F2)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, shadowColor: Colors.transparent),
        child: Text('Change',
            style:
                GoogleFonts.montserrat(fontSize: 10, color: Color(0XFF5899F2))),
      ),
    );
  }
}
