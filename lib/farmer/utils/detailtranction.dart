import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Buyer/live_tracking.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/farmer/offer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;


class DetailTrancation extends StatefulWidget {

 final tramscation detail;
   DetailTrancation({ required this.detail});

  @override
  State<DetailTrancation> createState() => _DetailTrancationState();
}

class _DetailTrancationState extends State<DetailTrancation> {
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,
            color: Colors.black,
          ),),
        title:  Text(
          "Transactions",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: ListView(
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
                        crossAxisAlignment: CrossAxisAlignment.end,
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

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                           Text(
                            "Price Per Ton : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                              color: Color(0xffD88A63),
                            ),
                          ),
                          Text(
                            '${widget.detail.priceperton}',
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
                            width: 370.w,
                            child: Text(

                              "${widget.detail.buyerlocation}",
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
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                       SizedBox(
                        height: 10.r,
                      ),
                        Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                            '${widget.detail.logistics_contact}',
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
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                            '${widget.detail.paymentrecived_date}',
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
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                            widget.detail.farmerpaystatus=='0'
                                ?'Pending':
                            widget.detail.farmerpaystatus==null
                                ?'Pending':
                            "Completed",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                              color: widget.detail.farmerpaystatus=='0'
                                  ?Colors.red:
                              widget.detail.farmerpaystatus==null
                                  ?Colors.red:
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
                          "TOTAL AMOUNT :     ₹"+'${widget.detail.totalamount}',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.detail.logisticstatus=='0'?"Logisitics Status : At Source ":
                            widget.detail.logisticstatus=='1'?"Logisitics Status : Loaded":
                            widget.detail.logisticstatus=='2'?"Logisitics Status : On Road":
                            widget.detail.logisticstatus=='3'?"Logisitics Status : Delivered":
                            "Logisitics Status : Payment Recived",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            ),
                          ),

                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>buyerlivetracking(
                                tracking:widget.detail.logisticstatus.toString()
                            )));
                          },
                            child: Text('view >',style: TextStyle(color: Colors.orange),),),
                        ],
                      ),
                       SizedBox(
                        height: 20.r,
                      ),
                      Center(
                        child: RatingBar.builder(
                          initialRating: map==null?0.0:map[0]['ratings']=='0.0'?0.0:
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
                            update_rating(rating: rating);
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
    );
  }
  void initState() {
    rating_view();
    super.initState();
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
