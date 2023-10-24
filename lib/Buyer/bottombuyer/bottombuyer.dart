import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roots_goods/Buyer/adress.dart';
import 'package:roots_goods/Buyer/buyerhomepage.dart';
import 'package:roots_goods/Buyer/cart/caarts.dart';
import 'package:roots_goods/Logistics/Profile/Buyerprofile.dart';
import 'package:roots_goods/Notification/buyernotification.dart';
import 'package:roots_goods/farmer/boxes.dart';

class buyerrbotto extends StatefulWidget {
  const buyerrbotto({super.key});

  @override
  State<buyerrbotto> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<buyerrbotto> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Byuer(),
    const Cartt(),
    const Adress(),
    const offerBuyerpage(),
    const Buyerlocalnotification(),
    const BuyerProfile(),
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
              label: 'Offers',
              backgroundColor: const Color(0xffA1D567),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/quality.png",
                height: 25,
                width: 25,
              ),
              label: 'Upload data',
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
              backgroundColor: const Color(0xffA1D567),
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
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
