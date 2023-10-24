import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Buyer/buyer_model/buyer_logistic_offer_model.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class buyer_logistic_offer extends StatefulWidget {
  const buyer_logistic_offer({Key? key}) : super(key: key);

  @override
  State<buyer_logistic_offer> createState() => _buyer_logistic_offerState();
}

class _buyer_logistic_offerState extends State<buyer_logistic_offer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<logistic_offer>>(
      future: qwe(),
      builder:
          (BuildContext context, AsyncSnapshot<List<logistic_offer>> snapshot) {
        if (snapshot.hasData) {
          // Data loaded successfully
          List<logistic_offer> data = snapshot.data!;
          if (data.isNotEmpty) {
            return PageView.builder(
              physics:
                  //NeverScrollableScrollPhysics(),
                  BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              //shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      dislike(
                          bid: '${snapshot.data![index].buyerid}',
                          loid: '${snapshot.data![index].logisticsofferid}',
                          foid: '${snapshot.data![index].farmerofferid}',
                      );

                    } else if (direction == DismissDirection.startToEnd) {
                       like( Bid: '${snapshot.data![index].buyerid}',
                              boid: '${snapshot.data![index].buyerofferid}',
                              fid: '${snapshot.data![index].farmerid}',
                              foid: '${snapshot.data![index].farmerofferid}',
                              lid: '${snapshot.data![index].logisticsid}',
                              loid: '${snapshot.data![index].logisticsofferid}',



                       );
                    }
                  },
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(50.0.r),
                        child: Container(
                          height: 100.r,
                          width: 100.r,
                          child: FloatingActionButton(
                            backgroundColor: Color(0xffA1D567),
                            onPressed: () {
                              qwe();
                            },
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Pull to refresh",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  secondaryBackground: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(50.0.h),
                        child: Container(
                          height: 100.r,
                          width: 100.r,
                          child: FloatingActionButton(
                            backgroundColor: Color(0xffD88A63),
                            onPressed: () {
                              qwe();
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Pull to refresh",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.r),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xffD88A63),
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0.r), //<-- SEE HERE
                      ),
                      elevation: 24.r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 20.r,
                            ),
                            child: Text(
                              "Logistic Offer Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 10.r,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Logistic Name :",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    color: Color(0xffD88A63),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 6.r,
                                    top: 4.r,
                                  ),
                                  child: Text(
                                    '${snapshot.data![index].logisticsName}',
                                    style: TextStyle(
                                      color: Color(0xff747474),
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 10.r,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Price Per km :",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    color: Color(0xffD88A63),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 6.r,
                                    top: 4.r,
                                  ),
                                  child: Text(
                                    "₹ " +
                                        '${snapshot.data![index].logisticsprice}',
                                    style: TextStyle(
                                      color: Color(0xff747474),
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 10.r,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Source:",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    color: Color(0xffD88A63),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 400.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 6.r,
                                      top: 4.r,
                                    ),
                                    child: Text(
                                      '${snapshot.data![index].logisticsSource}',
                                      style: TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 10.r,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Destination:",
                                  style: TextStyle(
                                    color: Color(0xffD88A63),
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 400.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 6.r,
                                      top: 4.r,
                                    ),
                                    child: Text(
                                      '${snapshot.data![index].logisticsDestination}',
                                      style: TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Divider(
                            thickness: 4.r,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 15.r,
                            ),
                            child: Text(
                              "Your Offer Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 10.r,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Price Per Ton :",
                                  style: TextStyle(
                                    color: Color(0xffD88A63),
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 6.r,
                                    top: 4.r,
                                  ),
                                  child: Text(
                                    '₹' +
                                        '${snapshot.data![index].buyerpriceperton}',
                                    style: TextStyle(
                                      color: Color(0xff747474),
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 10.r,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quantity In Tons :",
                                  style: TextStyle(
                                    color: Color(0xffD88A63),
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 6.r,
                                    top: 4.r,
                                  ),
                                  child: Text(
                                    '${snapshot.data![index].buyerquantityinton}',
                                    style: TextStyle(
                                      color: Color(0xff747474),
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.r,
                              top: 10.r,
                              bottom: 60.r,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Loaction :",
                                  style: TextStyle(
                                    color: Color(0xffD88A63),
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 400.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 6.r,
                                      top: 4.r,
                                    ),
                                    child: Text(
                                      '${snapshot.data![index].buyerdeliverylocation}',
                                      style: TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 6.h,
                          // ),
                          // Divider(
                          //   thickness: 4.r,
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //     left: 20.r,
                          //     top: 30.r,
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "Distance b/t farmer & Logistic:",
                          //         style: TextStyle(
                          //           fontSize: 30.sp,
                          //           color: Color(0xffD88A63),
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.only(
                          //           left: 6.r,
                          //           top: 4.r,
                          //         ),
                          //         child: Text(
                          //           '${snapshot.data![index].dist}' + '/KM',
                          //           style: TextStyle(
                          //             color: Color(0xff747474),
                          //             fontSize: 28.sp,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //
                          // ),
                          Spacer(),
                          Center(
                            child: Container(
                              height: 30.h,
                              width: 600.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/new.gif'))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200.h,
                    width: 700.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/cart.png'),
                    )),
                  ),
                  Text(
                    "Offer's are not available",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp,
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (snapshot.hasError) {
          // Error occurred while loading data
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          // Data is still loading
          return Center(
              child: CircularProgressIndicator(

          ));
        }
      },
    );

  }

  /// buyer logistic offer list
  Future<List<logistic_offer>> qwe() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http
        .get(Uri.parse(Apiconst.buyer_matched_offer_logistic + '$userid'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;

      return jsonData.map((item) => logistic_offer.fromJson(item)).toList();

    } else {
      throw Exception('Failed to load data');
    }
  }

  /// dislike buyer logistic offer list
  Future<void> dislike({
    required String bid,
    required String loid,
    required String foid,
  }) async {
    final url = Uri.parse(Apiconst.buyer_Logistic_offer_reject);
    final request = http.MultipartRequest('POST', url);
    request.fields['buyerid'] = bid;
    request.fields['logisticsofferid'] = loid;
    request.fields['farmerofferid'] = foid;
    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);

      print(data);
      print("eeeeeeeeeeeeeeeeee");

      if (data["status"] == "200") {
        setState(() {
          qwe();
        });
        const snackBar = SnackBar(
          content: Text('Offer has Disliked'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        Fluttertoast.showToast(
            msg: data['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 16.0);

        print("Error");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  ///  like buyer logistic offer list
  Future<void> like({
    required String Bid,
    required String boid,
    required String fid,
    required String foid,
    required String lid,
    required String loid,

  }) async {

    print(fid);
    print('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');

    final url = Uri.parse(Apiconst.buyer_Logistic_offer_accept);
    final request = http.MultipartRequest('POST', url);
    request.fields['farmerofferid'] = '${foid}';
    request.fields['logisticsofferid'] = '${loid}';
    request.fields['buyer_id'] = '${Bid}';
    request.fields['farmer_id'] = '${fid}';
    request.fields['logisticsid'] = '${lid}';
    request.fields['buyerofferid'] = '${boid}';

    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);

      print(data);
      print("ffffffffffffffff");

      if (data["status"] == "200") {
        setState(() {
          qwe();
        });
        const snackBar = SnackBar(
          content: Text('Offer has liked'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        setState(() {
          qwe();
        });
        Fluttertoast.showToast(
            msg: data['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 16.0);

        print("Error");
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
