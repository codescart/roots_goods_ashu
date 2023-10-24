import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Buyer/adress.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/video/videoss.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class buyercertificateupload extends StatefulWidget {
 final quality para;
 buyercertificateupload(this.para);


  @override
  State<buyercertificateupload> createState() => _CertificateuploadState();
}



class _CertificateuploadState extends State<buyercertificateupload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        centerTitle: true,
        title: const Text(
          "Certificate",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          "Farmer Name :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xffD88A63),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            "${widget.para.farmername }",
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xff747474),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          "Location :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xffD88A63),
                          ),
                        ),
                        Container(
                          width: 220,
                          child: Text(
                            "${widget.para.location}",
                            maxLines: 4,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xff747474),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Row(
                      children:  [
                        Text(
                          "Certificate ID:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xffD88A63),
                          ),
                        ),
                        Container(
                      width: 200,
                          child: Text(
                           // "${widget.para.farrmerid}",
                             "${widget.para.Certificateid}",
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xff747474),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 Container(
                   height: 100.h,
                     width: 250.w,
                     decoration: BoxDecoration(

                       image:
                       widget.para.images==''?  DecorationImage(
                         fit: BoxFit.contain,

                         image: AssetImage(
                           'assets/placeholder.png',
                         ),
                       ):
                       DecorationImage(
                         fit: BoxFit.fill,
                         image: NetworkImage(
                             Apiconst.imgurl+"${widget.para.images}"
                         )
                       )
                     ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "Images",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
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
                                    borderRadius: BorderRadius.circular(10),
                                 image:
                                 offer_data==[0]?  DecorationImage(
                                   fit: BoxFit.contain,

                                   image: AssetImage(
                                     'assets/placeholder.png',
                                   ),
                                 ):
                                 DecorationImage(
                                   fit: BoxFit.fill,
                                   image: NetworkImage( Apiconst.imgurl+i['certificateimage']),
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
          )
        ],
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
    var certificateid = widget.para.Certificateid;
    var farmerid = widget.para.farrmerid;
    print(farmerid);
    print(certificateid);
    print('mmmmmmmmmmmmmmmm');
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    final res = await http.get(
        Uri.parse(Apiconst.buyer_certi_img+'userid=$userid&certificateid=$certificateid')
    );
    print(Apiconst.buyer_certi_img+'userid=$farmerid&certificateid=$certificateid');
    final resBody = json.decode(res.body);
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      offer_data = resBody;
    });



    return "Sucess";
  }
}
