import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Buyer/buyer_notification/farmer_notification.dart';
import 'package:roots_goods/Buyer/buyer_notification/logistic_notification.dart';


class Buyerlocalnotification extends StatefulWidget {
  const Buyerlocalnotification({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Buyerlocalnotification> {

  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(
          0.3,
        ),
        appBar: AppBar(
          centerTitle: true,
          title:  Text(
            "Notification",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 40.sp,
            ),
          ),
          elevation: 12.r,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          bottom:TabBar(
              unselectedLabelColor: Color(0xffA1D567),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Color(0xffA1D567),),
              tabs: [
                Tab(
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20.0.r,right: 20.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/farmer.gif'
                                  )
                              )
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text("Farmer ", style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold)),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text("Notification", style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold)),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20.0.r,right: 20.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/logitics.gif'
                                  )
                              )
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text("Logistic ", style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold)),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text("Notification", style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold)),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ]),
        ),
        body: TabBarView(
          children: [
            RefreshIndicator(
              onRefresh: () async  {
                setState(() {
                 // qwe();
                  //error
                });
              },
              child: buyer_farmer_notification(),
            ),
            RefreshIndicator(
              onRefresh: () async  {
                setState(() {
                  // qwe();
                  //error
                });
              },
              child: buyer_logistic_notification(),
            ),
          ],
        ),


      ),
    );
  }
  // Future<List<buyer_offer>> qwe() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid=prefs.getString("userId");
  //   print(userid);
  //   print('1111111111111111111111111');
  //   final response = await http.get(
  //     Uri.parse('Apiconst.buyer_matched_offer'+'$userid'),
  //   );
  //   var jsond = json.decode(response.body)["data"];
  //   print('wwwwwwwwwwwwwwwwwwww');
  //   print(jsond);
  //
  //   List<buyer_offer> allround = [];
  //
  //
  //   for (var o in jsond)  {
  //     buyer_offer al = buyer_offer(
  //       o["buyerofferid"],
  //       o['buyer_priceperton'],
  //       o["buyer_quantity"],
  //       o["buyer_location"],
  //       o["farmer_priceperton"],
  //       o["farmer_location"],
  //       o["farmer_quantity"],
  //       o["farmer_offerid"],
  //       o["farmer_id"],
  //       o["distance"],
  //       o["farmer_name"],
  //       o["logisticsprice"],
  //       o["logistics_id"],
  //       o["cropname"],
  //       o["logisticssource"],
  //       o["logisticsdestination"],
  //     );
  //
  //     allround.add(al);
  //   }
  //   return allround;
  // }
}
