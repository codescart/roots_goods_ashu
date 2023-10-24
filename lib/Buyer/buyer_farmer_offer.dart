import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Buyer/buyer_model/buyer_farmer_model.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';


class buyer_farmer_offer extends StatefulWidget {
  const buyer_farmer_offer({Key? key}) : super(key: key);

  @override
  State<buyer_farmer_offer> createState() => _buyer_farmer_offerState();
}

class _buyer_farmer_offerState extends State<buyer_farmer_offer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<buyer_offer>>(
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

                   dislike(Foid:'${snapshot.data![index].farmerofferid}');
                    // setState(() {
                    //   mails.removeAt(index);
                    // });

                  } else if (direction == DismissDirection.startToEnd) {
                    like( Bid: snapshot.data![index].buyerofferid,
                      foid:'${snapshot.data![index].farmerofferid}',
                      cid:'${snapshot.data![index].cropid}',
                      bid:'${snapshot.data![index].buyerid}',
                      fid:'${snapshot.data![index].farmerid}',
                      fq:'${snapshot.data![index].farmerquantityperton}',
                      floc:'${snapshot.data![index].farmerlocation}',
                      fppt:'${snapshot.data![index].farmerpriceperton}',
                      bloc:'${snapshot.data![index].buyerlocation}',
                      bq:'${snapshot.data![index].buyerquantityinton}',
                      bppt:'${snapshot.data![index].buyerpriveperton}',
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
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  snapshot.data![index].cropname,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  snapshot.data![index].farmername,
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
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "₹ "+snapshot.data![index].farmerpriceperton,
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
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  snapshot.data![index].farmerquantityperton,
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
                          child:Row(
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
                                    snapshot.data![index].farmerlocation,
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
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  snapshot.data![index].buyerpriveperton,
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
                          child:Row(
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
                                  snapshot.data![index].buyerquantityinton,
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
                                    snapshot.data![index].buyerlocation,
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
  Future<List<buyer_offer>> qwe() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    print(userid);
    print('1111111111111111111111111');
    final response = await http.get(
      Uri.parse(Apiconst.buyer_matched_offer_farmer+'$userid'),
    );
    var jsond = json.decode(response.body)["data"];
    print('wwwwwwwwwwwwwwwwwwww');
    print(jsond);

    List<buyer_offer> allround = [];


    for (var o in jsond)  {
      buyer_offer al = buyer_offer(
        o["buyerofferid"],
        o["buyerquantityinton"],
        o["buyerpriveperton"],
        o["buyerlocation"],
        o["farmerquantityperton"],
        o["farmerofferid"],
        o["farmerlocation"],
        o["farmerpriceperton"],
        o["cropname"],
        o["farmername"],
        o["farmerid"],
        o["cropid"],
        o["buyerid"],
      );
      allround.add(al);
    }
    return allround;
  }
/// dislike buyer farmer offer list
  Future<void>dislike( {required String Foid,})async  {
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    final url = Uri.parse(Apiconst.buyer_farmer_offer_reject);
    final request = http.MultipartRequest('POST', url);
    request.fields['farmerofferid'] = Foid;
    request.fields['buyerid'] = '$userid';
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



///  like buyer farmer offer list
  Future<void>like({
    required int Bid,
    required String foid,
    required String cid,
    required String bid,
    required String fid,
    required String fq,
    required String floc,
    required String fppt,
    required String bloc,
    required String bq,
    required String bppt
  }) async {
    final url = Uri.parse(Apiconst.buyer_farmer_offer_accept);
    final request = http.MultipartRequest('POST', url);
    request.fields['buyerofferid'] = '${Bid}';
    request.fields['farmerofferid'] = '${foid}';
    request.fields['buyerid'] = '${bid}';
    request.fields['cropid'] = '${cid}';
    request.fields['farmer_id'] = '${fid}';
    request.fields['farmer_quantity'] = '${fq}';
    request.fields['farmer_location'] = '${floc}';
    request.fields['farmer_priceperton'] = '${fppt}';
    request.fields['buyer_location'] = '${bloc}';
    request.fields['buyer_quantity'] = '${bq}';
    request.fields['buyer_priceperton'] = '${bppt}';
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
        setState(() {
          qwe();
        });

        print("Error");
      }
    } catch (e) {
      print('Error: $e');
    }
  }


}

