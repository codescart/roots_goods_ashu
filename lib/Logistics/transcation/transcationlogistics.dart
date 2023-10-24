import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Buyer/buyer_model/logistic_transction.dart';
import 'package:roots_goods/Logistics/transcation/detailtranscationlogistics.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class LogisticsTranscation extends StatefulWidget {
  const LogisticsTranscation({super.key});

  @override
  State<LogisticsTranscation> createState() => _OfferState();
}

class _OfferState extends State<LogisticsTranscation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,

        title:  Text(
          "Transactions",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 35.sp,
          ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35.h,

                  child:

                  FutureBuilder<List<logistictransection>>(
                    future: rvh(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 200.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/cart.png'),
                                    )
                                ),
                              ),
                              Text(
                                "transaction's are not available",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.sp,
                                ),
                              ),

                            ],
                          ),
                        );
                      }
                      else {
                        return  ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return  InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  DetailTrancationLogistics(
                                            detail: snapshot.data![index],
                                          )));
                                },
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 10.r, right: 10.r),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      elevation: 5.r,
                                      child: Padding(
                                        padding:  EdgeInsets.only(
                                          left: 15.r,
                                          top: 15.r,
                                          right: 15.r,
                                          bottom: 15.r,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Transaction ID : "+'${snapshot.data![index].transactionid}',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 30.sp,
                                              ),
                                            ),
                                            Divider(
                                              thickness: 2.r,
                                            ),
                                            SizedBox(
                                              height: 10.r,
                                            ),
                                            Row(
                                              children:  [
                                                Text(
                                                  "Crop : ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30.sp,
                                                    color: Color(0xffD88A63),
                                                  ),
                                                ),
                                                Text(
                                                  '${snapshot.data![index].cropname}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25.sp,
                                                    color: Color(0xff747474),
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
                                                  "Quantity In Ton : ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30.sp,
                                                    color: Color(0xffD88A63),
                                                  ),
                                                ),
                                                Text(
                                                  '${snapshot.data![index].quantityinton}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25.sp,
                                                    color: Color(0xff747474),
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
                                                  "Price Per k/m : ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30.sp,
                                                    color: Color(0xffD88A63),
                                                  ),
                                                ),
                                                Text(
                                                  '${snapshot.data![index].priceperkm}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25.sp,
                                                    color: Color(0xff747474),
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
                                                  "buyer Name : ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30.sp,
                                                    color: Color(0xffD88A63),
                                                  ),
                                                ),
                                                Text(
                                                  '${snapshot.data![index].buyername}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25.sp,
                                                    color: Color(0xff747474),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10.r,
                                            ),
                                            Divider(
                                              thickness: 2.r,
                                            ),
                                            Row(
                                              children:  [
                                                Text(
                                                  "Total Amount : ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 35.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '${snapshot.data![index].buyertotalamount}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30.sp,
                                                    color: Colors.black,
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
                              );
                            });
                      }
                    },
                  ),



                ),

              ],
            ),
          ],
        ),
      ),
    );
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





