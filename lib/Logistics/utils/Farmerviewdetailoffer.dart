import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/farmer/productpage.dart';
import 'package:roots_goods/video/videoss.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class Farmer_View_offer_Detail extends StatefulWidget {
final offer view;
Farmer_View_offer_Detail(this.view);

  @override
  State<Farmer_View_offer_Detail> createState() => _View_offer_DetailState();
}

class _View_offer_DetailState extends State<Farmer_View_offer_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),

        ),
        title: const Text(
          "Offer Details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 12,
                    bottom: 8,
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
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            widget.view.cropname,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 17,
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
                            "Quantity In Tons : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            widget.view.quantity,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 17,
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
                            "Price Per Ton : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                           '₹ '+ widget.view.price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 17,
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
                            "Total Amount : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "₹ "+ widget.view.totalamount,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 17,
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
                              fontSize: 17,
                            ),
                          ),
                          Text(
                             widget.view.offerdate,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 17,
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
                            "Quality Certificate ID : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD88A63),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            widget.view.certificateid,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
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
                              fontSize: 17,
                            ),
                          ),
                          Container(
                           width: 200,
                            child: Text(
                               widget.view.pickuplocation,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Images",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:  EdgeInsets.all(18.0.r),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: 100.0.h,
                            aspectRatio: 16/9,
                            viewportFraction: 0.9,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                           // onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: offer_data.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.sp),

                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage( Apiconst.imgurl+i['certificateimage'].toString()),
                                      )
                                  ),

                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );


  }

  @override
  void initState() {
    offer();
    // TODO: implement initState
    super.initState();
  }

  List offer_data = [];

  Future<String> offer() async {
    var certificateid = widget.view.certificateid;
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    final res = await http.get(
        Uri.parse(Apiconst.offer_view_img+'userid=$userid&certificateid=$certificateid')
    );
    final resBody = json.decode(res.body);
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      offer_data = resBody;
    });



    return "Sucess";
  }
}
