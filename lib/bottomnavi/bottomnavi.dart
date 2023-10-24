import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roots_goods/Notification/offernotification.dart';
import 'package:roots_goods/Profile/Profile.dart';
import 'package:roots_goods/farmer/farmerpage.dart';
import 'package:roots_goods/farmer/offer.dart';
import 'package:roots_goods/farmer/productpage.dart';
import '../quality Parameter/quality_parameter.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final List<Widget> _widgetOptions = <Widget>[
     MyHomePage(),
     UpdatePrics(),
     QualityParameter(),
     Offer(),
     localnotification(),
     Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/home1.png",
                height: 20,
                width: 20,
              ),
              label: 'Home',
              backgroundColor:  Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/black-shop-tag1.png",
                height: 20,
                width: 20,
              ),
              label: 'Offers',
              backgroundColor:  Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/quality.png",
                height: 25,
                width: 25,
              ),
              label: 'Quality',
              backgroundColor:  Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/transaction.png",
                height: 25,
                width: 25,
              ),
              label: 'Transcations',
              backgroundColor:  Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/notification.png",
                height: 25,
                width: 25,
              ),
              label: 'Notifications',
              backgroundColor:  Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/gear.png",
                height: 25,
                width: 25,
              ),
              label: 'Profile',
              backgroundColor: const Color(0xffA1D567),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          // selectedItemColor:
          //     const Color.fromARGB(255, 13, 90, 16).withOpacity(0.3),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
