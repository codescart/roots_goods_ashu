import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roots_goods/Buyer/bottombuyer/bottombuyer.dart';
import 'package:roots_goods/Logistics/Logisticsbotto.dart';
import 'package:roots_goods/bottomnavi/bottomnavi.dart';

class Selectt extends StatefulWidget {
  const Selectt({super.key});

  @override
  State<Selectt> createState() => _SelecttState();
}

class _SelecttState extends State<Selectt> {
  bool _hasBeenPressed = false;
  bool _hasBeenPresseds = false;
  bool _hasBeenPressedss = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  MyStatefulWidget(),
                  ),
                );

                setState(() {
                  _hasBeenPressed = !_hasBeenPressed;
                });
              },
              child: Container(
                color: _hasBeenPressed
                    ? Colors.white.withOpacity(0.3)
                    : Colors.green.withOpacity(0.3),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/farmer.gif",
                      height: 200.r,
                      width: 200.r,
                    ),
                     Padding(
                      padding: EdgeInsets.only(
                        left: 14.r,
                      ),
                      child: Text(
                        "Farmers",
                        style: GoogleFonts.alike(
                      textStyle:  TextStyle(
                      fontSize: 35.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,

                      ),
                     ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const buyerrbotto(),
                  ),
                );
                setState(() {
                  _hasBeenPresseds = !_hasBeenPresseds;
                });
              },
              child: Container(

                color: _hasBeenPresseds
                    ? Colors.white.withOpacity(0.3)
                    : Colors.blue.withOpacity(0.3),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/buyer.gif",
                      height: 200.r,
                      width: 200.r,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 14.r),
                      child: Text(
                        "Buyer",
                        style: GoogleFonts.alike(
                          textStyle:  TextStyle(
                            fontSize: 35.sp,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        // style: TextStyle(
                        //   fontSize: 20,
                        //   color: Colors.black.withOpacity(0.6),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Logisticsbotto(),
                  ),
                );
                setState(() {
                  _hasBeenPressedss = !_hasBeenPressedss;
                });
              },
              child: Container(
                color: _hasBeenPressedss
                    ? Colors.white.withOpacity(0.3)
                    : Colors.orange.withOpacity(0.3),
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/logitics.gif",
                      height: 200.r,
                      width: 200.r,
                    ),
                     Padding(
                      padding: EdgeInsets.only(left:14.r),
                      child: Text(
                        "Logitics",
                        style: GoogleFonts.alike(
                          textStyle:  TextStyle(
                            fontSize: 35.sp,
                            color:  Colors.orange,
                            fontWeight: FontWeight.bold,

                          ),
                        ),

                        // style: TextStyle(
                        //   fontSize: 20,
                        //   color: Colors.orange,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: 50,
        color: Colors.green.withOpacity(0.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Roots Goods",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
