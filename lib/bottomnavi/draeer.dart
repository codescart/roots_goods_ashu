import 'package:flutter/material.dart';
import 'dart:math';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
              child: Container(
            width: 200.0,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage(
                        'assets/profile.png',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Chandan Chauhan',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                )),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),

          //
          TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: value,
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text('3D Drawer Menu'),
                      ),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Swipe right to open the menu"),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Press Me'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },

            // onTap: (){
            //   setState(() {
            //     value==0? value=1 : value=0;
            //   });
            // },
          )
        ],
      ),
    );
  }
}
