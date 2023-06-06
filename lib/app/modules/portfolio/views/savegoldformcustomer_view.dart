import 'package:ecgold/app/modules/portfolio/controllers/portfolio_controller.dart';
import 'package:ecgold/app/modules/portfolio/controllers/savegold_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SavegoldformcustomerView extends GetView {
  SavegoldformcustomerView({Key? key}) : super(key: key);

  PortfolioController portfolioController = Get.put(PortfolioController());
  SaveGoldController saveGoldController = Get.put(SaveGoldController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [appBar(width, height), content(width, height)],
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
                        StreamBuilder(
                            stream: Stream.periodic(Duration(seconds: 1)),
                            builder: (context, snapshot) {
                              return Text(
                                DateTime.now().toString(),
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
                  padding:
                      EdgeInsets.only(left: 20, right: width / 4.4, top: 10),
                  child: InkWell(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back_ios_new_sharp)),
                ),
                Text(
                  "ทองที่ลูกค้าฝากไว้",
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
                children: [
                  Spacer(),
                  Text(
                    "5",
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      color: Color(0xFFC2AC95),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Kg",
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: Color(0xFF8B92A1),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "50",
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      color: Color(0xFFE4A700),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Bg",
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: Color(0xFF8B92A1),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: width,
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
                    "ทำรายการรับทองคำ",
                    style: GoogleFonts.notoSansThai(
                        color: Color(0xFF5899F2), fontSize: 16),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("ประเภททองคำ",
                            style: GoogleFonts.notoSansThai(
                                color: Color(0xFF002458), fontSize: 12)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        height: 39,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFE8EDF5)),
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  width: width / 1.3,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  child: Center(
                                    child: DropdownButton(
                                      dropdownColor: Color(0xFFFFFFFF),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xFF2E70CC),
                                      ),
                                      elevation: 2,
                                      underline: const SizedBox(),
                                      onChanged: (newValue) {
                                        saveGoldController
                                            .setSelected(newValue.toString());
                                      },
                                      value: saveGoldController.selected.value,
                                      items: saveGoldController.listType
                                          .map((selectedType) {
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
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("สาขา",
                            style: GoogleFonts.notoSansThai(
                                color: Color(0xFF002458), fontSize: 12)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        height: 39,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFE8EDF5)),
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  width: width / 1.3,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  child: Center(
                                    child: DropdownButton(
                                      dropdownColor: Color(0xFFFFFFFF),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xFF2E70CC),
                                      ),
                                      elevation: 2,
                                      underline: const SizedBox(),
                                      onChanged: (newValue) {
                                        saveGoldController.setSelectedSaka(
                                            newValue.toString());
                                      },
                                      value:
                                          saveGoldController.selectedSaka.value,
                                      items: saveGoldController.listTypeSaka
                                          .map((selectedType) {
                                        return DropdownMenuItem(
                                          child: new Text(
                                            selectedType,
                                            style: GoogleFonts.notoSansThai(
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
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("จำนวนทองที่ต้องการรับ",
                            style: GoogleFonts.notoSansThai(
                                color: Color(0xFF002458), fontSize: 12)),
                      ),
                      TextField(
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.montserrat(
                            fontSize: 16, color: Color(0xFF2E70CC)),
                        decoration: InputDecoration(
                            // suffixIcon: Image.asset(
                            //   "assets/images/Bg.png",
                            //   scale: 3,
                            // ),
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 16, color: Color(0xFF2E70CC)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF8B92A1)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF8B92A1)),
                            ),
                            hintText: '1'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("*หมายเหตุ สามารถรับทองคำหลังจากทำรายการ T+2",
                              style: GoogleFonts.notoSansThai(
                                  color: Color(0xFF002458), fontSize: 12)),
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
                      onPressed: () {},
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
      ),
    );
  }
}
