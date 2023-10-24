
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:roots_goods/Buyer/bottombuyer/bottombuyer.dart';
import 'package:roots_goods/Logistics/Logisticsbotto.dart';
import 'package:roots_goods/bottomnavi/bottomnavi.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/selecting/Select.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

// import '../constant/constatnt.dart';

class OTPScreens extends StatefulWidget {
  final int userid;
  final String number;
  final int role;
  final String otp;
   OTPScreens({
    required this.userid,
    required this.number,
    required this.role,
    required this.otp,
  });

  @override
  _OTPScreensState createState() => _OTPScreensState();
}

class _OTPScreensState extends State<OTPScreens> {
  bool _isLoadingButton = false;
  bool _isResendEnabled = false;
  bool _activebutton = true;


  int _counter = 20;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }



  TextEditingController textEditingController =
  new TextEditingController(text: "");

  TextEditingController phoneController = TextEditingController();

  otpfunction({required otp, required String number}) async {
    print(number);
    print('ggggggggggggg');
    // Define the endpoint URL
    final url = Uri.parse( Apiconst.otpurl+'$number&sender=RTSGDS&message=Your Registration / Login OTP is $otp for the RootsGoods Mobile App. <ROOTSGOODS>');
    print(url);
    print('nnnnnnnnnnnnnnnnnnnn');
    await http.get(url);





  }

  _verifyOtpCode(String phone) async {
    if (phone == widget.otp) {
      setState(() {
        _isLoadingButton = false;
      });
      final prefs = await SharedPreferences.getInstance();
      final key = 'userId';
      final userId = widget.userid;
      prefs.setString(key, userId.toString());
      print(userId);
      print('qqqqqqqqqqqqqqqq');
      final prefs1 = await SharedPreferences.getInstance();
      final key1 = 'role';
      final role =widget.role;
      prefs1.setString(key1, role.toString());
      print(role);
      print('rrrrrrrrrrrrrr');

       if(role==1){
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) => MyStatefulWidget()));
          }else
       if(role==2){
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) => buyerrbotto()));
       }else
      {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Logisticsbotto()));
      }

    } else {
      Fluttertoast.showToast(
          msg: 'Wrong Otp',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }






  _startTimer() {
    _counter = 60; //time counter
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: ListView(
          children: [
             SizedBox(
              height: 10.h,
            ),
             SizedBox(
              height: 300.r,
              width: 300.r,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/otp.gif"),
              ),
            ),
             SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                Text(
                  'Enter verification OTP',
                  style: GoogleFonts.alike(
                    textStyle:  TextStyle(
                      fontSize: 35.sp,
                    ),
                  ),
                ),
                 SizedBox(
                  height: 10.h,
                ),
                // Text('+91 ${widget.phone}'),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP is sent to ',
                  style: GoogleFonts.alike(
                    textStyle:
                         TextStyle(fontSize: 25.sp, color: Colors.blue),
                  ),
                ),
                Text(
                  '+91 ${widget.number}',
                  style: GoogleFonts.alike(
                    textStyle:  TextStyle(
                      fontSize: 30.sp,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'OTP :    ',
            //       style: GoogleFonts.alike(
            //         textStyle:
            //         TextStyle(fontSize: 25.sp, color: Colors.blue),
            //       ),
            //     ),
            //     Text(
            //       '${widget.otp}',
            //       style: GoogleFonts.alike(
            //         textStyle:  TextStyle(
            //           fontSize: 30.sp,
            //           color: Colors.blue,
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),
             SizedBox(
              height: 40.h,
            ),
            Container(
              height: 40,
              child: Pinput(
                controller: phoneController,
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
              ),
            ),
             SizedBox(
              height: 20.h,
            ),
            _activebutton == true
                ? Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFE0E0E0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 8,
                    color: Colors.green,
                    inset: true,
                  ),
                  BoxShadow(
                    offset: Offset(0, -30),
                    blurRadius: 20,
                    color: Colors.green,
                    inset: true,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  _verifyOtpCode(phoneController.text);
                },
                child: _setUpButtonChild(),
              ),
            )
                : Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 8,
                    color: Colors.grey,
                    inset: true,
                  ),
                  BoxShadow(
                    offset: Offset(0, -30),
                    blurRadius: 20,
                    color: Colors.grey,
                    inset: true,
                  ),
                ],
              ),
              child: _setUpButtonChild(),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('OTP Not Recived ?',
                    style: GoogleFonts.alike(
                      textStyle:
                      TextStyle(fontSize: 30.sp, color: Colors.blue),
                    ),
                  ),

                  _counter<1?TextButton(
                    onPressed: _counter < 1
                        ? () {
                      _startTimer();
                      otpfunction(otp: widget.otp, number: widget.number);
                      // widget.verificationInteractor.verifyNumber();
                    } : null,
                    child: Text("Resend OTP".toUpperCase(),),


                  ):  Text(
                    '0:${_counter.toString().padLeft(2, '0')} ' + "second left",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return const SizedBox(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return  Center(
        child: Text(
          "Verify",
          style: GoogleFonts.alike(
            textStyle:  TextStyle(
              fontSize: 40.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          // style: TextStyle(
          //     color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      );
    }
  }
}
