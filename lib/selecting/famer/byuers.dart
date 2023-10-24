import 'package:flutter/material.dart';
import 'package:roots_goods/Login_screen.dart';

class Farmerbuyer extends StatefulWidget {
  const Farmerbuyer({super.key});

  @override
  State<Farmerbuyer> createState() => _SelecttState();
}

class _SelecttState extends State<Farmerbuyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const loginscreen(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Farmers",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.green,
                      size: 60,
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const loginscreen(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.arrow_left,
                      color: Colors.orange,
                      size: 60,
                    ),
                    Text(
                      "Buyers",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
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
