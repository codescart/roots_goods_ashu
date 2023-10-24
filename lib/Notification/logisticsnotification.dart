import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roots_goods/Logistics/logistic_model/logistic_notification_model.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class Logisticslocalnotification extends StatefulWidget {
  const Logisticslocalnotification({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Logisticslocalnotification> {





  @override
  Widget build(BuildContext context) {
    //create a CardController


    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(
        0.3,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 12,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<logistic_notification_model>>(
        future: qwe(),
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
                    width: 700.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/cart.png'),
                        )
                    ),
                  ),
                  Text(
                    "Notification's are not available",
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
            return  PageView.builder(
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
                        Boid: '${snapshot.data![index].buyerofferid}',
                        loid: '${snapshot.data![index].logisticsofferid}',
                        id: '${snapshot.data![index].notificationid}',
                      );


                    } else if (direction == DismissDirection.startToEnd) {
                      like(
                        id: '${snapshot.data![index].notificationid}',
                        Boid: '${snapshot.data![index].buyerofferid}',
                        Bid: '${snapshot.data![index].buyerid}',
                        foid: '${snapshot.data![index].farmerofferid}',
                        fid: '${snapshot.data![index].farmerid}',
                        loid: '${snapshot.data![index].logisticsofferid}',
                        lid: '${snapshot.data![index].logisticsid}',
                      );

                    }
                  },
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(50.0.r),
                        child: Container(
                          height: 100.r,
                          width: 100.r,
                          child: FloatingActionButton(
                            backgroundColor:  Color(0xffA1D567),
                            onPressed: () {
                              qwe();
                            },
                            child:  Icon(
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
                        padding:  EdgeInsets.all(50.0.h),
                        child: Container(
                          height: 100.r,
                          width: 100.r,
                          child: FloatingActionButton(
                            backgroundColor:  Color(0xffD88A63),
                            onPressed: () {
                              qwe();
                            },
                            child:  Icon(
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
                  child:Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:  BorderSide(
                          color: Color(0xffD88A63),
                        ),
                        borderRadius: BorderRadius.circular(
                          20.0.r,
                        ),
                      ),
                      elevation: 12.r,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 18.0.r,
                            right: 18.0.r,
                            top: 18.0.r
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.r,
                                top: 7.r,
                              ),
                              child: Text(
                                " Farmer Offer Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 20.r,
                              ),
                              child: Row(
                                children:  [
                                  Text(
                                    "farmer Name :",
                                    style: TextStyle(
                                      fontSize: 35.sp,
                                      color: Color(0xffD88A63),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 3.r,
                                      top: 2.r,
                                    ),
                                    child: Text(
                                      '${snapshot.data![index].farmername}',
                                      style: TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),



                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 5.r,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    "Location : ",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(

                                    width: 400.w,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 3.r,
                                        top: 2.r,
                                      ),
                                      child: Text(
                                        '${snapshot.data![index].farmerlocation}',
                                        maxLines: 3 ,
                                        style: TextStyle(
                                          color: Color(0xff747474),
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Divider(
                              thickness: 4.r,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.r,
                                top: 7.r,
                              ),
                              child: Text(
                                "Buyer Offer Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.sp,
                                ),
                              ),
                            ),

                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 5.r,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Crop Name :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      left: 3.r,
                                      top: 2.r,
                                    ),
                                    child: Text(
                                     '${snapshot.data![index].name}',
                                      // contents[index].quantity,
                                      style:  TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 5.r,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Buyer Name :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      left: 3.r,
                                      top: 2.r,
                                    ),
                                    child: Text(
                                      '${snapshot.data![index].buyername}',
                                      // contents[index].quantity,
                                      style:  TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 10.r,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Ouantity in Ton :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      left: 3.r,
                                      top: 2.r,
                                    ),
                                    child: Text('${snapshot.data![index].buyerquantity}',
                                      // contents[index].price,
                                      style:  TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 5.r,
                                bottom: 10.r,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Loaction :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize:35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 370.w,
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                        left: 3.r,
                                        top: 2.r,
                                      ),
                                      child: Text(
                                        '${snapshot.data![index].buyerlocation}',
                                        //  contents[index].location,
                                        maxLines: 3,
                                        style:  TextStyle(
                                          color: Color(0xff747474),
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),

                            Divider(
                              thickness: 4.r,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10.r,
                                top: 7.r,
                              ),
                              child: Text(
                                "Your Offer Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 5.r,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Price Per km :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      left: 3.r,
                                      top: 2.r,
                                    ),
                                    child: Text(
                                      '${snapshot.data![index].logisticsprice}',
                                      // contents[index].quantity,
                                      style:  TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 5.r,

                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Source :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize:35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 370.w,
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                        left: 3.r,
                                        top: 2.r,
                                      ),
                                      child: Text(
                                        '${snapshot.data![index].logisticsource}',
                                        //  contents[index].location,
                                        maxLines: 3,
                                        style:  TextStyle(
                                          color: Color(0xff747474),
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 5.r,

                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Destination :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize:35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 370.w,
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                        left: 3.r,
                                        top: 2.r,
                                      ),
                                      child: Text(
                                        '${snapshot.data![index].logisticdestination}',
                                        //  contents[index].location,
                                        maxLines: 3,
                                        style:  TextStyle(
                                          color: Color(0xff747474),
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),

                            Padding(
                              padding:  EdgeInsets.only(
                                left: 10.r,
                                top: 4.r,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Distance b/t farmer & logistic :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      left: 3.r,
                                      top: 2.r,
                                    ),
                                    child: Text('${snapshot.data![index].dist}',
                                      // contents[index].price,
                                      style:  TextStyle(
                                        color: Color(0xff747474),
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: Container(
                                height: 20.h,
                                width: 600.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/new.gif'
                                        )
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }


/// logistic notification

  Future<List<logistic_notification_model>> qwe() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http
        .get(Uri.parse(Apiconst.logistic_notification + '$userid'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      return jsonData.map((item) => logistic_notification_model.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }




  /// dislike buyer logistic offer list
  Future<void>dislike( {
    required String Boid,
    required String loid,
    required String id,
  })async  {
    final url = Uri.parse(Apiconst.logistic_notification_reject);
    final request = http.MultipartRequest('POST', url);

    request.fields['notificationid'] = id;
    request.fields['buyerofferid'] = Boid;
    request.fields['logisticsofferid'] = loid;
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

        // showSnakbar(context, 'Offer has Disliked');


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
  Future<void>like({
    required String Boid,
    required String id,
    required String Bid,
    required String foid,
    required String fid,
    required String loid,
    required String lid
  }
      ) async {
    final url = Uri.parse(Apiconst.logistic_notification_accept);
    final request = http.MultipartRequest('POST', url);
    request.fields['notificationid'] = id;


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
      }
      else {
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
