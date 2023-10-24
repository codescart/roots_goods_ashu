import 'package:flutter/material.dart';

class oofers extends StatefulWidget {
  final String product;
  final String price;
  const oofers({required this.product, required this.price});

  @override
  State<oofers> createState() => _oofersState();
}

class _oofersState extends State<oofers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [],
      ),
    );
  }
}
