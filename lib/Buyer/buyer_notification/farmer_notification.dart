import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Buyer/buyer_model/buyer_farmer_model.dart';
import 'package:roots_goods/Buyer/buyer_model/farmer_notification.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';


class buyer_farmer_notification extends StatefulWidget {
  const buyer_farmer_notification({Key? key}) : super(key: key);

  @override
  State<buyer_farmer_notification> createState() => _buyer_farmer_notificationState();
}

class _buyer_farmer_notificationState extends State<buyer_farmer_notification> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<farmer_notification>>(
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
                        Foid:'${snapshot.data![index].farmerOfferid}',
                        Boid: '${snapshot.data![index].buyerofferid}',
                        id: '${snapshot.data![index].id}',
                    );
                    // setState(() {
                    //   mails.removeAt(index);
                    // });

                  } else if (direction == DismissDirection.startToEnd) {
                    like(
                        Boid: '${snapshot.data![index].buyerofferid}',
                        Bid: '${snapshot.data![index].buyerId}',
                        foid: '${snapshot.data![index].farmerOfferid}',
                        fid: '${snapshot.data![index].farmerId}',
                        cid: '${snapshot.data![index].cropid}',
                        id: '${snapshot.data![index].id}',
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
                            "Farmer Offer Details",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                            left: 20.r,
                            top: 10.r,
                          ),
                          child: Row(
                            children:  [
                              Text(
                                "Crop Name :",
                                style: TextStyle(
                                  fontSize: 30.r,
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
                                  '${snapshot.data![index].cropname}',
                                  style: TextStyle(
                                    color: Color(0xff747474),
                                    fontSize: 28.r,
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
                            top: 10.r,
                          ),
                          child: Row(
                            children:  [
                              Text(
                                "Farmer name:",
                                style: TextStyle(
                                  fontSize: 30.r,
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
                                  '${snapshot.data![index].farmername}',
                                  style: TextStyle(
                                    color: Color(0xff747474),
                                    fontSize: 28.r,
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
                            top: 10.r,
                          ),
                          child: Row(
                            children:  [
                              Text(
                                "Price Per Ton:",
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
                                  "₹ "+'${snapshot.data![index].farmerPriceperton}',
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
                          padding:  EdgeInsets.only(
                            left: 20.r,
                            top: 10.r,
                          ),
                          child: Row(
                            children:  [
                              Text(
                                "Quantity In Ton:",
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
                                  "${snapshot.data![index].farmerQuantity}",
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
                          padding:  EdgeInsets.only(
                            left: 20.r,
                            top: 10.r,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                "Location : ",
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
                                    '${snapshot.data![index].farmerLocation}',
                                    maxLines: 3,
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
                          padding:  EdgeInsets.only(
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
                                padding:  EdgeInsets.only(
                                  left: 6.r,
                                  top: 4.r,
                                ),
                                child: Text(
                                  '${snapshot.data![index].buyerPriceperton}',
                                  style:  TextStyle(
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
                          padding:  EdgeInsets.only(
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
                                padding:  EdgeInsets.only(
                                  left: 6.r,
                                  top: 4.r,
                                ),
                                child: Text(
                                  '${snapshot.data![index].buyerQuantity}',
                                  style:  TextStyle(
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
                          padding:  EdgeInsets.only(
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
                                  padding:  EdgeInsets.only(
                                    left: 6.r,
                                    top: 4.r,
                                  ),
                                  child: Text(
                                    '${snapshot.data![index].buyerLocation}',
                                    style:  TextStyle(
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
    );
  }

  /// buyer farmer offer list
  Future<List<farmer_notification>> qwe() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    print(userid);
    print('1111111111111111111111111');
    final response = await http.get(
      Uri.parse(Apiconst.buyer_notification_farmer_offer+'$userid'),
    );
    var jsond = json.decode(response.body)["data"];
    print('wwwwwwwwwwwwwwwwwwww');
    print(jsond);

    List<farmer_notification> allround = [];


    for (var o in jsond)  {
      farmer_notification al = farmer_notification(
        o["id"],
        o["buyerofferid"],
        o["buyer_priceperton"],
        o["buyer_quantity"],
        o["buyer_location"],
        o["farmer_priceperton"],
        o["farmer_location"],
        o["farmer_quantity"],
        o["farmer_offerid"],
        o["farmer_id"],
        o["buyer_id"],
        o["cropid"],
        o["status"],
        o["cropname"],
        o["buyername"],
        o["farmername"],
      );

      allround.add(al);
    }
    return allround;
  }



  /// dislike buyer farmer offer list
  Future<void>dislike( {
    required String Foid,
    required String Boid,
    required String id,
  })async  {
    final url = Uri.parse(Apiconst.buyer_notification_reject_farmer);
    final request = http.MultipartRequest('POST', url);

    request.fields['farmerofferid'] = Foid;
    request.fields['buyerofferid'] = Boid;
    request.fields['notificationid'] = id;

    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);

      print(data);
      print("eeeeeeeeeeeeeeeeee");

      if (data["status"] == "200") {
        qwe();
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



  ///  like buyer farmer offer list
  Future<void>like({
    required String Boid,
    required String Bid,
    required String foid,
    required String fid,
    required String cid,
    required String id,
  }) async {
    final url = Uri.parse(Apiconst.buyer_notification_accept_farmer);
    final request = http.MultipartRequest('POST', url);
    request.fields['notificationid'] =id;
    request.fields['buyerofferid'] = Boid;
    request.fields['farmerofferid'] = foid;
    request.fields['buyerid'] = Bid;
    request.fields['farmerid'] = fid;
    request.fields['cropid'] = cid;


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


