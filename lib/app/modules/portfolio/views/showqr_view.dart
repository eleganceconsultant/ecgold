import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowqrView extends GetView {
  const ShowqrView({Key? key}) : super(key: key);
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

  Widget appBar(double width,double height){
    return Positioned(
      top: 0,
      child:  Container(
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
            ),);
  }
  Widget content(double width,double height,context){
    return Positioned(
      top: 130,
      child:   Container(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      width: width,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                   padding:  EdgeInsets.only(left: 20,right: width/4,top: 10),
                                child: InkWell(
                                    onTap: () => Get.back(),
                                    child: Icon(Icons.arrow_back_ios_new_sharp)),
                              ),
                              Text(
                                "",
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
                            padding:
                                const EdgeInsets.only(left: 40, right: 40, top: 30),
                            child: Image.asset("assets/images/qr.png"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Please scan QR Code with your mobile\n  by using Mobile Banking Application",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFF407FD6), fontSize: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
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
                                  dialog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: Text(
                                  'Save QR',
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 22,
                                      color: Color(0xFFF1F7FF),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              width: width / 2.5,
                              height: height / 25,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF2E70CC)),
                                borderRadius: BorderRadius.all(Radius.circular(17)),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.notoSansThai(
                                      fontSize: 22,
                                      color: Color(0xFF2E70CC),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),);
  }

  dialog(BuildContext context) {
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
                    Text("บันทึก QR Code สำเร็จ",
                        style: GoogleFonts.kanit(
                            color: Color(0xFF0A9276), fontSize: 16)),
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
                            'กลับสู่หน้าพอร์ทโฟลิโอ',
                            style: GoogleFonts.kanit(
                                fontSize: 16, color: Color(0xFF707070)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
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
                            'ไปที่หน้าประวัติการทำรายการ',
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
