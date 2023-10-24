import 'package:flutter/material.dart';
import 'package:roots_goods/Buyer/cart/caarts.dart';

class Buyer_View_offer_Detail extends StatefulWidget {
final offer view;
Buyer_View_offer_Detail(this.view);

  @override
  State<Buyer_View_offer_Detail> createState() => _View_offer_DetailState();
}

class _View_offer_DetailState extends State<Buyer_View_offer_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        title: const Text(
          "Offer Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 40,
                    bottom: 10,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:  [
                          Text(
                            "Crop Name : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                           widget.view.cropname,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff747474),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children:  [
                          Text(
                            "Quantity in Tons : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                           widget.view.quantity,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff747474),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children:  [
                          Text(
                            "Price per Ton : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "₹ "+widget.view.price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff747474),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children:  [
                          Text(
                            "Total Amount : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "₹ "+widget.view.totalamount,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff747474),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 10,
                      ),
                      Row(
                        children:  [
                          Text(
                            "Selling Date : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                           widget.view.offerdate,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff747474),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "Location : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              widget.view.delivery_location,
                              maxLines: 5,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff747474),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
