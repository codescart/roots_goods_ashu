import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roots_goods/Buyer/buyer_model/logistic_transction.dart';
import 'package:roots_goods/Logistics/logistic_logistic_status.dart';
import 'package:roots_goods/Logistics/transcation/livelocationn.dart';
import 'package:roots_goods/Logistics/transcation/transcationlogistics.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../constant/Constat_file.dart';


class DetailTrancationLogistics extends StatefulWidget {
  final logistictransection detail;
  DetailTrancationLogistics({required this.detail});



  @override
  State<DetailTrancationLogistics> createState() => _DetailTrancationState();
}

class _DetailTrancationState extends State<DetailTrancationLogistics> {





  @override
  void initState() {
    rating_view();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {Navigator.pop(context);  },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        title: const Text(
          "Transcations",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1), () {

            setState(() {
              rvh();
            });
          },
          );
        },
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding:  EdgeInsets.all(16.r),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5.r,
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left: 15.r,
                      right: 15.r,
                      top: 10.r,
                      bottom: 10.r,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TranscationId :  ${widget.detail.transactionid}",
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 35.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.r,
                        ),
                        Divider(
                          thickness: 4.r,
                        ),
                        SizedBox(
                          height: 5.r,
                        ),
                        Text(
                          '${widget.detail.cropname}'+" Crop",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(

                          children: [
                            Text(
                              "Quantity In Tons : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Text(
                              '${widget.detail.quantityinton}',
                              style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          children: [
                            Text(
                              "Buyer Name : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Text(
                              '${widget.detail.buyername}',
                              style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),


                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              "Buyer Location : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Container(
                              width: 350.w,
                              child: Text(

                                '${widget.detail.buyerlocation}',
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          children:  [
                            Text(
                              "Buyer Contact : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Text(
                              '${widget.detail.buyercontact}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          children:  [
                            Text(
                              "Farmer Name : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Text(
                              '${widget.detail.farmername}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          children:  [
                            Text(
                              "Farmer Contact : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Text(
                              '${widget.detail.farmercontact}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              "Farmer Location : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Container(
                              width: 350.w,
                              child: Text(

                                '${widget.detail.farmerlocation}',
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          children:  [
                            Text(
                              "Logistics Name : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Text(
                             '${widget.detail.logisticsname}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          children:  [
                            Text(
                              "Logistics Contact : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Text(
                              '${widget.detail.logisticsContact}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          children:  [
                            Text(
                              "Payment Recieved Date : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Color(0xffD88A63),
                              ),
                            ),
                            Text(
                              "${widget.detail.paymentrecivedDate}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Row(
                          children:  [
                            Text(
                              "Payment Status : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              widget.detail.logisticspaystatus=='0'
                                  ?'Pending':
                              widget.detail.logisticspaystatus==null?'Pending':
                              "Recieved",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: widget.detail.logisticspaystatus=='0'
                                    ?Colors.red:
                                widget.detail.logisticspaystatus==null?
                                Colors.red:
                                Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Divider(
                          thickness: 4.r,
                        ),
                        Center(
                          child: Text(
                            "TOTAL AMOUNT :   ₹"+'${widget.detail.buyertotalamount}',
                            style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.sp,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 4.r,
                        ),
                        SizedBox(
                          height: 20.r,
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>logistic_tranction_status(
                                loc:widget.detail
                            )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  widget.detail.logisticstatus=='0'?"Logisitics Status : At Source ":
                                  widget.detail.logisticstatus=='1'?"Logisitics Status : Loaded":
                                  widget.detail.logisticstatus=='2'?"Logisitics Status : On Road":
                                  widget.detail.logisticstatus=='3'?"Logisitics Status : Deliverd":
                                  "Logisitics Status : Payment Recived",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: (){}, icon:Icon(Icons.edit))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.r,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  LiiveLocation(
                                    loc:widget.detail
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Container(
                              height: 15.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                color: const Color(0xffA1D567),
                                border: Border.all(
                                  color: const Color(0xffA1D567),
                                ),
                                borderRadius:  BorderRadius.all(
                                  Radius.circular(
                                    10.r,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("assets/gps.png"),
                                  const Text(
                                    "View Live Location",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.r,
                        ),
                        Center(
                          child: RatingBar.builder(
                            initialRating:  map==null?0.0:map[0]['ratings']=='0.0'?0.0:
                            double.parse(map[0]['ratings'].toString()),
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 40.0,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              update_rating( rating: rating);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  var map;
  Future rating_view() async {
    var t_id = widget.detail.transactionid;
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.rating_view+'userid=$userid&transactionid=$t_id'),
    );
    var data = jsonDecode(response.body);
    print(data);
    print("mmmmmmmmmmmm");
    if (data['status'] == '200') {
      setState(() {
        map =data['data'];
      });
    }
  }

  Future<void>update_rating({required double rating}) async {
    var t_id = widget.detail.transactionid;
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    final url = Uri.parse(Apiconst.update_rating);
    final request = http.MultipartRequest('POST', url);
    request.fields['ratingsnumber'] = '${rating.toString()}';
    request.fields['userid'] = '${userid}';
    request.fields['transactionid'] = '${t_id}';
    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);

      print(data);
      print("ffffffffffffffff");

      if (data["status"] == "200") {
        print("--------##########");

        // showSnakbar(context, 'Offer has Disliked');


      }
      else {


        print("Error");
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
Future<List<logistictransection>> rvh() async {
  final prefs = await SharedPreferences.getInstance();
  final userid = prefs.getString("userId");
  print(userid);
  final response = await http
      .get(Uri.parse(Apiconst.logistic_trtansction+'$userid'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body)['data'] as List<dynamic>;
    print(response);
    print('wwwwwwwwwwwwwwwwwwwwwwwwwww');

    return jsonData.map((item) => logistictransection.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}