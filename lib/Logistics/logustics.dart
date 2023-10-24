import 'package:flutter/material.dart';

class Logistics extends StatefulWidget {
  const Logistics({super.key});

  @override
  State<Logistics> createState() => _LogisticsState();
}

class _LogisticsState extends State<Logistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text("This is logistics"),
        ],
      ),
    );
  }
}
