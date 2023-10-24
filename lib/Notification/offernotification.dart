import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/farmer/farmer_model/farmer_notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;


class localnotification extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<localnotification> {


  @override
  Widget build(BuildContext context) {
    //create a CardController
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(
        0.3,
      ),
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 40.sp,
          ),
        ),
        elevation: 12,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body:  RefreshIndicator(
        onRefresh: () async  {
          setState(() {
            qwe();
            //error
          });
        },
        child: FutureBuilder<List<farmer_page_notification>>(
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

                        dislike(Fid:snapshot.data![index].farmer_id,
                            Boid: "${snapshot.data![index].buyerofferid}", );


                      } else if (direction == DismissDirection.startToEnd) {
                        like( Boid: '${snapshot.data![index].buyerofferid}',
                          Fid:'${snapshot.data![index].farmer_id}',
                          foid:'${snapshot.data![index].farmer_offerid}',
                          id:'${snapshot.data![index].id}',
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
                      padding:  EdgeInsets.all(18.0.r),
                      child:  Card(
                        shape: RoundedRectangleBorder(
                          side:  BorderSide(
                            color: Color(0xffD88A63),
                          ),
                          borderRadius: BorderRadius.circular(
                            20.0.r,
                          ),
                        ),
                        elevation: 12.r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                              padding: EdgeInsets.only(
                                left: 20.r,
                              right: 20.r,
                                top: 40.r
                              ),
                              child: Text(
                                "Offer Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                left: 20.r,
                              right: 20.r,
                                top: 25.r,
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                   Text(
                                    "Crop Name :",
                                    style: TextStyle(
                                      fontSize: 35.sp,
                                      color: Color(0xffD88A63),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                     left: 20.r,
                              right: 20.r,

                                    ),
                                    child: Text(
                                    snapshot.data![index].cropname,
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
                               left: 20.r,
                              right: 20.r,
                              top: 15.r,
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                   Text(
                                    "Buyer Name :",
                                    style: TextStyle(
                                      fontSize: 35.sp,
                                      color: Color(0xffD88A63),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                     left: 20.r,
                              right: 20.r,

                                    ),
                                    child: Text(
                                        snapshot.data![index].buyername,
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
                               left: 20.r,
                              right: 20.r,
                              top: 15.r,
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                   Text(
                                    "Price Per Ton :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                     left: 20.r,
                              right: 20.r,

                                    ),
                                    child: Text(
                                        snapshot.data![index].buyer_priceperton,
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
                               left: 20.r,
                              right: 20.r,
                              top: 15.r,
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                   Text(
                                    "Quantity Per Ton :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                     left: 20.r,
                              right: 20.r,

                                    ),
                                    child: Text(
                                        snapshot.data![index].buyer_quantity,
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
                               left: 20.r,
                              right: 20.r,
                              top: 15.r,
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                   Text(
                                    "Location :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      left: 3,
                                      top: 2,
                                    ),
                                    child: Container(
                                      width: 420.w,
                                      child: Text(snapshot.data![index].buyer_location,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
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
                             SizedBox(
                              height: 7.h,
                            ),
                             Divider(
                              thickness: 3.r,
                            ),
                             SizedBox(
                              height: 7.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.r,
                              right: 20.r,
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
                              padding:  EdgeInsets.only(
                               left: 20.r,
                              right: 20.r,
                                top: 15.r,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    "Price Per Ton :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                     left: 20.r,
                              right: 20.r,
                                    ),
                                    child: Text(
                                        snapshot.data![index].farmer_priceperton,
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
                               left: 20.r,
                              right: 20.r,
                              top: 15.r,
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                   Text(
                                    "Quantity In Tons :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                     left: 20.r,
                              right: 20.r,

                                    ),
                                    child: Text(
                                      snapshot.data![index].farmer_quantity,
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
                               left: 20.r,
                              right: 20.r,


                              top: 15.r,
                              ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                   Text(
                                    "Location :",
                                    style: TextStyle(
                                      color: Color(0xffD88A63),
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                     left: 20.r,
                                    ),
                                    child: Container(
                                      width: 420.w,
                                      child: Text(
                                          snapshot.data![index].farmer_location,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
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
                            Spacer(),
                            Center(
                              child: Container(
                                height: 30.h,
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
                  );
                },
              );
            }
          },
        ),
      )
    );
  }
  /// farmer list notification
  Future<List<farmer_page_notification>> qwe() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    print(userid);
    print('1111111111111111111111111');
    final response = await http.get(
      Uri.parse(Apiconst.notification_offer_view+'$userid'),
    );
    var jsond = json.decode(response.body)["data"];
    print('wwwwwwwwwwwwwwwwwwww');
    print(jsond);

    List<farmer_page_notification> allround = [];


    for (var o in jsond)  {
      farmer_page_notification al = farmer_page_notification(
        o["id"],
        o["buyerofferid"],
        o['buyer_priceperton'],
        o["buyer_quantity"],
        o["buyer_location"],
        o["farmer_priceperton"],
        o["farmer_location"],
        o["farmer_quantity"],
        o["farmer_offerid"],
        o["farmer_id"],
        o["buyername"],
        o["cropname"],

      );

      allround.add(al);
    }
    return allround;
  }


  /// dislike  farmer notification list
  Future<void>dislike( {required String Fid,required String Boid})async{
    // final prefs = await SharedPreferences.getInstance();
    // final userid=prefs.getString("userId");
    final url = Uri.parse(Apiconst.farmer_notification_reject);
    final request = http.MultipartRequest('POST', url);
    request.fields['farmerid'] = Fid;
    request.fields['buyerofferid'] = Boid;
    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);
      print(data);
      print("eeeeeeeeeeeeeeeeee");
      if (data["status"] == "200") {
        qwe();
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



  ///  like buyer farmer offer list
  Future<void>like({
    required String Boid,
    required String Fid,
    required String foid,
    required String id}) async {
    final url = Uri.parse(Apiconst.farmer_notification_accept);
    final request = http.MultipartRequest('POST', url);
    request.fields['buyerofferid'] = Boid;
    request.fields['farmerid'] = Fid;
    request.fields['farmerofferid'] = foid;
    request.fields['id'] = id;
    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);
      print("kkkkkkkkkkkkkkk");
      print(data);
      print("ffffffffffffffff");

      if (data["status"] == "200") {
        qwe();
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
