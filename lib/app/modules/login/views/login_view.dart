import 'dart:ui';

import 'package:ecgold/app/modules/home/views/navigate_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  ButtonStyle TextButtonStyle = TextButton.styleFrom(
    backgroundColor: Color(0xFFBFC4C9).withOpacity(0.7),
    minimumSize: Size(70, 70),
    maximumSize: Size(100, 100),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: CircleBorder(side: BorderSide(color: Color(0xFFE9E9E9))),
  );

  ButtonStyle TextButtonStyle2 = TextButton.styleFrom(
    backgroundColor: Color(0xFFFFFFF),
    minimumSize: Size(70, 70),
    maximumSize: Size(100, 100),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: CircleBorder(side: BorderSide(color: Color(0xFFE9E9E9))),
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/baclpic.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/backgroundcolor.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: _card(width, height, context),
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Color(0xFF214475),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 10,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: width / 2.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => NavigateView());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          'Skip Login',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Color(0xFF2E70CC),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "ELEGANCE DEV TEAM",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Color(0xFF5A7DAE),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "V 3.01",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Color(0xFF5A7DAE),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(double width, double height, context) {
    return Card(
      elevation: 10,
      color: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF4F6FB),
              Color(0xFFDAEBFB),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      scale: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EC GOLD",
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF407FD6),
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          "TRADING",
                          style: GoogleFonts.montserrat(
                            color: Color(0xFF8B92A1),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Username",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Color(0xFF8B92A1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Color(0xFF2E70CC),
                ),
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Color(0xFF2E70CC),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8B92A1)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  hintText: 'Enter Username',
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Password",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Color(0xFF8B92A1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Obx(() => TextField(
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Color(0xFF2E70CC),
                    ),
                    obscureText: loginController.isObscure.value,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Color(0xFF2E70CC),
                      ),
                      suffixIcon: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // added line
                        mainAxisSize: MainAxisSize.min, // added line
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              loginController.isob();
                            },
                            child: Icon(
                                loginController.isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xFF8B92A1)),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.lock,
                            color: Color(0xFF083F95),
                          )
                        ],
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF8B92A1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      hintText: 'Enter Password',
                    ),
                  )),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Obx(() => Column(
                        children: [
                          InkWell(
                            onTap: () {
                              loginController.ontapKey();
                            },
                            child: loginController.activeKey.isTrue
                                ? Image.asset(
                                    "assets/images/activekey.png",
                                    scale: 3,
                                  )
                                : Image.asset(
                                    "assets/images/key.png",
                                    scale: 3,
                                  ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Password",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFFBDC3D1), fontSize: 10),
                          ),
                        ],
                      )),
                  Obx(() => Column(
                        children: [
                          InkWell(
                            onTap: () {
                              loginController.ontapPin();
                              pinbottomsheet(context);
                            },
                            child: loginController.activeKPin.isTrue
                                ? Image.asset(
                                    "assets/images/activepin.png",
                                    scale: 3,
                                  )
                                : Image.asset(
                                    "assets/images/pin.png",
                                    scale: 3,
                                  ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Pin",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFFBDC3D1), fontSize: 10),
                          ),
                        ],
                      )),
                  Obx(() => Column(
                        children: [
                          InkWell(
                              onTap: () {
                                loginController.ontapRegis();
                              },
                              child: loginController.activeRegis.isTrue
                                  ? Image.asset(
                                      "assets/images/activeregis.png",
                                      scale: 3,
                                    )
                                  : Image.asset(
                                      "assets/images/regis.png",
                                      scale: 3,
                                    )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            " Register",
                            style: GoogleFonts.montserrat(
                                color: Color(0xFFBDC3D1), fontSize: 10),
                          ),
                        ],
                      )),
                  Text(""),
                ],
              ),
              SizedBox(height: 40),
              Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Color(0xFF2E70CC),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    //Get.to(() => NavigatorBar());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Log In',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
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
                                  selectedIndex: loginController.count.value,
                                  code: loginController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 1,
                                  selectedIndex: loginController.count.value,
                                  code: loginController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 2,
                                  selectedIndex: loginController.count
                                      .value, //loginController.count.value,
                                  code: loginController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 3,
                                  selectedIndex: loginController.count
                                      .value, //loginController.count.value,
                                  code: loginController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 4,
                                  selectedIndex: loginController.count
                                      .value, //loginController.count.value,
                                  code: loginController.pinNumber,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => DigitHolder(
                                  width: 70,
                                  index: 5,
                                  selectedIndex: loginController.count
                                      .value, //loginController.count.value,
                                  code: loginController.pinNumber,
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
                                    loginController.addDigit(1);
                                  },
                                  child: Text('1',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    loginController.addDigit(2);
                                  },
                                  child: Text('2',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    loginController.addDigit(3);
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
                                    loginController.addDigit(4);
                                  },
                                  child: Text(
                                    '4',
                                    style: GoogleFonts.notoSans(
                                        color: Color(0xFFFFFFFF), fontSize: 23),
                                  )),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    loginController.addDigit(5);
                                  },
                                  child: Text('5',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    loginController.addDigit(6);
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
                                    loginController.addDigit(7);
                                  },
                                  child: Text('7',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    loginController.addDigit(8);
                                  },
                                  child: Text('8',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  style: TextButtonStyle,
                                  onPressed: () {
                                    loginController.addDigit(9);
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
                                    loginController.addDigit(0);
                                  },
                                  child: Text('0',
                                      style: GoogleFonts.notoSans(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 23))),
                              TextButton(
                                  onPressed: () {
                                    loginController.backspace();
                                  },
                                  child: Icon(
                                    Icons.backspace_outlined,
                                    color: Colors.white,
                                    size: 37,
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
