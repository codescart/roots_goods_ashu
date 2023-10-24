import "package:flutter/material.dart";

class ProductDetails extends StatefulWidget {
  final String prod_fullName;
  final String prod_pic;
  final double prod_old_price;
  final double prod_price;

  const ProductDetails(
      {required this.prod_fullName,
      required this.prod_pic,
      required this.prod_old_price,
      required this.prod_price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late double percent;
  @override
  void initState() {
    percent = (widget.prod_old_price - widget.prod_price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 33,
          ),
          Container(
            child: Text("$percent"),
          ),
        ],
      ),
    );
  }
}
