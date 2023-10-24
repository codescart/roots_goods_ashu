import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roots_goods/Logistics/home/acceptoffer.dart';
import 'package:roots_goods/Logistics/home/logisticshome.dart';
import 'package:roots_goods/Logistics/transcation/transcationlogistics.dart';
import 'package:roots_goods/Notification/logisticsnotification.dart';
import 'package:roots_goods/Profile/Profile.dart';

class Logisticsbotto extends StatefulWidget {
  const Logisticsbotto({super.key});

  @override
  State<Logisticsbotto> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<Logisticsbotto> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final List<Widget> _widgetOptions = <Widget>[
    const logisticshome(),
    const logisticsOffer(),
    const LogisticsTranscation(),
    const Logisticslocalnotification(),
     Profile()
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
              backgroundColor: const Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/black-shop-tag1.png",
                height: 20,
                width: 20,
              ),
              label: 'offers',
              backgroundColor: const Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/transaction.png",
                height: 25,
                width: 25,
              ),
              label: 'Transcations',
              backgroundColor: const Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/notification.png",
                  height: 25,
                  width: 25,
                ),
                label: 'Notifications',
                backgroundColor: const Color(0xffA1D567)),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/gear.png",
                height: 25,
                width: 25,
              ),
              label: 'Profile',
              backgroundColor: const Color(
                0xffA1D567,
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
