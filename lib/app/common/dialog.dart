import 'package:ecgold/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogMe {
  static logoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              titlePadding: EdgeInsets.zero,
              title: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("คุณต้องการ",
                            style: GoogleFonts.kanit(
                                color: Color(0xFF1A1818), fontSize: 16)),
                        Text("ออกจากระบบ",
                            style: GoogleFonts.kanit(
                                color: Color(0xFF1A1818), fontSize: 16)),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
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
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20))),
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
                          Get.offAll(LoginView());
                        },
                        child: Container(
                          height: 50,
                          width: 142,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              border: Border.all(color: Color(0xFFBDC3D1)),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
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
            ));
  }
}
