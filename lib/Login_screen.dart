import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:roots_goods/Otp_screen.dart';
import 'package:roots_goods/Register_screen.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _Login_screenState();
}
bool _loading = false;




class _Login_screenState extends State<loginscreen> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController phone = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration:  BoxDecoration(color: Colors.white),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding:  EdgeInsets.all(30.r),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: 150.r,
                      // width: 150,
                      // padding: EdgeInsets.all(30),
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      "Login to RootsGoods",
                      style: GoogleFonts.alike(
                        textStyle:  TextStyle(
                          fontSize: 40.sp,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    thickness: 1.r,
                    color: Colors.grey.withOpacity(0.6.r),
                  ),

                   SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Mobile Number',
                    style: GoogleFonts.alike(
                      textStyle:  TextStyle(
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 5.h,
                  ),
                  Form(
                    key: _formkey,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      controller: phone,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 10) {
                          return 'Mobile number cannot be empty';
                        }
                        return null;
                      },
                      style:  TextStyle(
                        color: Colors.black,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black87, width: 1),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black87, width: 1),
                        ),
                        border:  OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        focusedErrorBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFF65054)),
                        ),
                        errorBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFF65054)),
                        ),
                        filled: true,
                        prefixIcon:  Icon(
                          Icons.phone_android,
                          color: Colors.grey,
                        ),
                        hintStyle: GoogleFonts.alike(
                          textStyle:  TextStyle(
                            fontSize: 30.sp,
                          ),
                        ),
                        hintText: "00-00-00-00",

                        // fillColor: kBackgroundColor,
                        contentPadding:  EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                      ),

                    ),
                  ),

                   SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Container(
                      height: 20.h,
                      width: 500.w,
                      decoration:  BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          print('qqqqqqqqqqqqq');

                          if (_formkey.currentState!.validate()) {
                            login(
                              phone.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Color(
                            0xffa1d567,
                          ).withOpacity(0.6),
                        ),
                        child:
                        _loading == false?
                        Text(
                          'Verify',
                          style: GoogleFonts.alike(
                            textStyle:  TextStyle(
                              fontSize: 40.sp,
                            ),
                          ),
                        ):
                        Padding(
                          padding:  EdgeInsets.all(4.0.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)),
                          Text(
                            "Please Wait...",
                            style: GoogleFonts.alike(
                              textStyle:  TextStyle(
                                fontSize: 30.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 15.h,
                  ),
                  Divider(
                    thickness: 1.r,
                    color: Colors.grey.withOpacity(0.6),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'Contact Us',
                      style: GoogleFonts.alike(
                        textStyle:  TextStyle(
                          fontSize: 35.sp,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            _launchCaller();
                          },
                          child: Container(
                            height: 50.r,width: 50.r,

                            child: Image.asset('assets/iphone-14.png',
                              height: 30.r,width: 30.r,),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            _launchEmail();
                          },
                          child: Container(
                            height: 50.r,width: 50.r,

                            child: Image.asset('assets/gmail.png',
                              height: 30.r,width: 30.r,),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            openwhatsapp();
                          },
                          child: Container(
                            height: 50.r,width: 50.r,
                            child: Image.asset('assets/whatsapp.png',
                              height: 30.r,width: 30.r,),
                          ),
                        ),
                      ] ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future<void> login(String phone,)  async {
    setState(() {
      _loading = true;
    });
      print(phone);
      print('ggggggggggggg');
    // Define the endpoint URL
    final url = Uri.parse(Apiconst.login);

    // Create a new multipart request
    final request = http.MultipartRequest('POST', url);
    // Add the form fields
    request.fields['mobile'] = phone;
    try {
      // Send the request and get the response
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);

      print("merasaman");
      // Check if the request was successful
      if (data["status"] == "200") {
        final userId=data['data']['id'];
        final role=data['data']['role'];
        final otp=data['otp'];

        otpfunction(otp:otp,number:phone);
        print(data);
        print(userId);
        print(otp);
        print(role);
        setState(() {
                _loading = false;
              });
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.green,
            fontSize: 16.0);
        Navigator.push(context,
            MaterialPageRoute(builder:
                (context)=>OTPScreens(
                  userid:userId,
                  number:phone,
                  role:role,
                  otp:otp,
                )));
      } else {
        setState(() {
          _loading = false;
        });
        Fluttertoast.showToast(
            msg: data['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 16.0);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder:
                (context)=>register(
              number:phone.toString(),
            )));
        print("Error");
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  otpfunction({required otp, required String number}) async {
      print(phone);
      print('ggggggggggggg');
      // Define the endpoint URL
      final url = Uri.parse( Apiconst.otpurl+'$number&sender=RTSGDS&message=Your Registration / Login OTP is $otp for the RootsGoods Mobile App. <ROOTSGOODS>');
      print(url);
      print('nnnnnnnnnnnnnnnnnnnn');
      await http.get(url);
  }

  openwhatsapp() async{
    var whatsapp ="+919448897472";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

    if( await canLaunch(whatsappURl_android)){
      await launch(whatsappURl_android);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp not installed")));

    }


  }
  _launchCaller() async {
    const url = "tel:+919448897472";
    if (await canLaunch(url)) {
      await launch(url);
    } else    {
      throw 'Could not launch $url';
    }
  }

  String email="general@rootsgoods.com";
  _launchEmail() async {
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Could not launch';
    }
  }



 }





