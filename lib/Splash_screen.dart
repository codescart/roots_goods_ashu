import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Buyer/bottombuyer/bottombuyer.dart';
import 'package:roots_goods/Login_screen.dart';
import 'package:roots_goods/Logistics/Logisticsbotto.dart';
import 'package:roots_goods/bottomnavi/bottomnavi.dart';
import 'package:roots_goods/constant/color_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    harsh();
  }

  harsh()async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId")??'0';
    final prefs1 = await SharedPreferences.getInstance();
    final role=prefs1.getString("role");
    print('nnnnnnnnnnnnnnn');
    print(userid);
    print('mmmmmmmmmmmmmmm');
    print(role);
    print('oooooooooooooo');

    Timer(Duration(seconds: 3),
            ()=>role=="1" && userid !='0'?Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => buyerrbotto()))
                :role=="2"&& userid !='0'?Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => buyerrbotto()))
                :role=="3"&& userid !='0'?Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Logisticsbotto()))
                :Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => loginscreen(),
              ),
            ),
    );






  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xff436f54),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: 100.h,
            ),
            SizedBox(
              height: 250.r,
              width: 250.r,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),
             SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  'Roots ',
                  style: TextStyle(
                    color: green,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp,
                  ),
                ),
                Text(
                  'Goods',
                  style: TextStyle(
                    color: kRed,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(
          bottom: 20.r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'Made in India',
              style: TextStyle(
                color: kBlackColor900,
                fontWeight: FontWeight.bold,
                fontSize: 35.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
