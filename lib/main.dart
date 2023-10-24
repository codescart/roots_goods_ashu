import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Otp_screen.dart';
import 'package:roots_goods/Register_screen.dart';
import 'package:roots_goods/Splash_screen.dart';
import 'package:roots_goods/offer/offer.dart';
import 'package:roots_goods/selecting/Select.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var channel = const MethodChannel('updatappinapp');
  updateapp(){
    print('bbbbbbbbbbbbbbbbbbb');
    channel.invokeMapMethod('updatemyapp');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateapp();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(690, 360),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Roots Goods',
          theme: ThemeData(primarySwatch: Colors.green),

          home: SplashScreen(),
        );
      },
    );

    //   MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   //home: const Selectt(),
    //    home:  register(number: "8988888888",),
    //   // home: const Logisticsbotto(),
    //    //home:  SplashScreen(),
    // );
  }
}
