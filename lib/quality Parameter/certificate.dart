import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/quality%20Parameter/quality_parameter.dart';
import 'package:roots_goods/video/videoss.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class farmercertificateupload extends StatefulWidget {
  final quality certificate;
  farmercertificateupload(this.certificate);

  @override
  State<farmercertificateupload> createState() => _CertificateuploadState();
}

class _CertificateuploadState extends State<farmercertificateupload> {
  @override
  void initState() {
    Cropps();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);  },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        title: const Text(
          "Certificate",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
           SizedBox(
            height: 60.r,
          ),
          Padding(
            padding:  EdgeInsets.all(24.r),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                   SizedBox(
                    height: 40.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [
                      Text(
                        "Certificate ID:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp,
                          color: Color(0xffD88A63),
                        ),
                      ),
                      Text(
                        "${widget.certificate.Certificateid}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                   SizedBox(
                    height: 40.r,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      widget.certificate.images==''?
                      Container(
                        height: 100.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:  AssetImage('assets/noimg.png')
                            )
                        ),
                      ):
                      Container(
                        height: 100.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                Apiconst.imgurl+"${widget.certificate.images}"
                            ),
                          )
                        ),
                      ),
                      Positioned(
                          bottom: -30.r,
                          right: -55.r,
                          child:
                          Container(
                            height: 110.r,
                            width: 110.r,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("${widget.certificate.status}"=='0'?'assets/Verified.png':"${widget.certificate.status}"=='1'?
                                  'assets/pending.png':'assets/reject.png'
                                  ),
                                )
                            ),
                          )
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 40.r,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      left: 20.r,
                    ),
                    child: Row(
                      children:  [
                        Text(
                          "Images",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 10.r,
                  ),
                  Padding(
                    padding:  EdgeInsets.all(28.0.r),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 250.0.r,
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
                      items: crop_data.map((i) {
                        print(crop_data);
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(Apiconst.imgurl+i['certificateimage'].toString())
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
  List crop_data = [];
  Future<String> Cropps() async {
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    print(Apiconst.certificateid+'$userid');
    final cert=widget.certificate.Certificateid;
    final res = await http.get(Uri.parse(
        Apiconst.baseurl+'farmer/get/certificate?userid=$userid&certificateid=$cert'));
    final resBody = json.decode(res.body);
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      crop_data = resBody;
    });
    return "Sucess";
  }
//   Future<List<img>> ert() async{
//     final prefs = await SharedPreferences.getInstance();
//     final userid=prefs.getString("userId");
//     print(Apiconst.certificateid+'$userid');
// final cert=widget.certificate.Certificateid;
//     final response = await http.get(
//       Uri.parse(Apiconst.baseurl+'farmer/get/certificate?userid=$userid&certificateid=$cert'),
//     );
//     final jsond = json.decode(response.body);
//     print('wwwwwwwwwwwwwwwwwwww');
//     print(jsond);
//
//
//     List<img> allround = [];
//     for (var o in jsond)  {
//       img al = img(
//           o["certificateimage"]
//
//       );
//
//       allround.add(al);
//     }
//     return allround;
//   }

}
// class img {
//   String? certificateimage;
//
//   img(
//       this.certificateimage,
//
//       );
//
// }


