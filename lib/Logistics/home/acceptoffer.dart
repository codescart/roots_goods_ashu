import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Logistics/model/logistic_offermodel.dart';
import 'package:roots_goods/Logistics/uploadnewoffer/uploaddnewoffer.dart';
import 'package:roots_goods/Logistics/utils/logisticsviewdetail.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class logisticsOffer extends StatefulWidget {
  const logisticsOffer({super.key});

  @override
  State<logisticsOffer> createState() => _UpdatePricsState();
}

class _UpdatePricsState extends State<logisticsOffer> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.r,
              right: 10.r,
            ),
            child: Row(
              children: [
                Text(
                  "Your Offers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (
                          context,
                        ) =>
                            logisticsOffers(),
                      ),
                    );
                  },
                  child: Card(
                    color: Color(
                      0xffA1D567,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.r),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 25.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              "Add New offers",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.7153,
              child: FutureBuilder<List<LofferModel>>(
                future: getlogisticoffer(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<LofferModel>> snapshot) {
                  if (snapshot.hasData) {
                    // Data loaded successfully
                    List<LofferModel> data = snapshot.data!;
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0.r),
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Price Per KM : ",
                                                      style: TextStyle(
                                                        fontSize: 25.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffD88A63),
                                                      ),
                                                    ),
                                                    Text(
                                                      data[index].price!,
                                                      // snapshot
                                                      //     .data![index].price,
                                                      style: TextStyle(
                                                        fontSize: 25.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Source : ",
                                                      style: TextStyle(
                                                        fontSize: 25.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffD88A63),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 250.w,
                                                      child: Text(
                                                        maxLines: 2,
                                                        data[index].source_location!,
                                                        // snapshot.data![index]
                                                        //     .source_location,
                                                        style: TextStyle(
                                                          fontSize: 25.sp,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Destination : ",
                                                      style: TextStyle(
                                                        fontSize: 25.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.orange,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 250.w,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Text(
                                                          data[index].destination_location!,
                                                          // snapshot.data![index]
                                                          //     .destination_location,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            fontSize: 25.sp,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 8.r,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Logistics_View_offer_Detail(
                                                                    snapshot.data![
                                                                        index])));
                                                  },
                                                  child: Card(
                                                    color: Color(
                                                      0xffA1D567,
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "View details",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25.sp,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  } else if (snapshot.hasError) {
                    // Error occurred while loading data
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Data is still loading
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.green,
                    ));
                  }
                },
              )
              // FutureBuilder<List<LofferModel>>(
              //     future: getlogisticoffer(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasError) print(snapshot.error);
              //       return snapshot.hasData
              //           ? ListView.builder(
              //           physics: BouncingScrollPhysics(),
              //           itemCount: snapshot.data!.length,
              //           itemBuilder: (context, index) {
              //             return  Column(
              //               children: [
              //
              //                 Padding(
              //                   padding:  EdgeInsets.all(8.0.r),
              //                   child: Card(
              //                     elevation: 5,
              //                     child: Padding(
              //                       padding:  EdgeInsets.all(8.0.r),
              //                       child: Container(
              //                         color: Colors.white,
              //                         alignment: Alignment.bottomLeft,
              //                         child: Row(
              //                           mainAxisAlignment: MainAxisAlignment.start,
              //                           children: [
              //                             Padding(
              //                               padding: const EdgeInsets.only(
              //                                 left: 10,
              //                               ),
              //                               child: Column(
              //                                 crossAxisAlignment: CrossAxisAlignment.start,
              //                                 children: [
              //                                   const SizedBox(
              //                                     height: 5,
              //                                   ),
              //                                   Row(
              //                                     children:[
              //                                       Text(
              //                                         "Price Per KM : ",
              //                                         style: TextStyle(
              //                                           fontSize: 25.sp,
              //                                           fontWeight: FontWeight.bold,
              //                                           color: Color(0xffD88A63),
              //                                         ),
              //                                       ),
              //                                       Text(
              //                                         snapshot.data![index].price,
              //                                         style: TextStyle(
              //                                           fontSize: 25.sp,
              //                                           color: Colors.black,
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                   SizedBox(
              //                                     height: 5.h,
              //                                   ),
              //                                   Row(
              //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                     crossAxisAlignment: CrossAxisAlignment.start,
              //                                     children:  [
              //                                       Text(
              //                                         "Source : ",
              //                                         style: TextStyle(
              //                                           fontSize: 25.sp,
              //                                           fontWeight: FontWeight.bold,
              //                                           color: Color(0xffD88A63),
              //                                         ),
              //                                       ),
              //                                       Container(
              //                                         width: 250.w,
              //                                         child: Text(
              //                                           maxLines: 2 ,
              //                                           snapshot.data![index].source_location,
              //                                           style: TextStyle(
              //                                             fontSize: 25.sp,
              //                                             color: Colors.black,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                   SizedBox(
              //                                     height: 5.h,
              //                                   ),
              //                                   Row(
              //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                     crossAxisAlignment: CrossAxisAlignment.start,
              //                                     children:  [
              //                                       Text(
              //                                         "Destination : ",
              //                                         style: TextStyle(
              //                                           fontSize: 25.sp,
              //                                           fontWeight: FontWeight.bold,
              //                                           color: Colors.orange,
              //                                         ),
              //                                       ),
              //                                       Container(
              //
              //                                         width: 250.w,
              //                                         child: Align(
              //                                           alignment: Alignment.bottomLeft,
              //                                           child: Text(
              //
              //                                              snapshot.data![index].destination_location,
              //                                            maxLines: 2 ,
              //                                             style: TextStyle(
              //                                               fontSize: 25.sp,
              //                                               color: Colors.black,
              //                                             ),
              //                                           ),
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             Spacer(),
              //                             Padding(
              //                               padding:  EdgeInsets.only(
              //                                 left: 8.r,
              //                               ),
              //                               child: Column(
              //                                 crossAxisAlignment: CrossAxisAlignment.start,
              //                                 children: [
              //                                   InkWell(
              //                                     onTap: () {
              //                                       Navigator.push(
              //                                           context,
              //                                           MaterialPageRoute(
              //                                               builder: (context) =>
              //                                                Logistics_View_offer_Detail(snapshot.data![index])));
              //                                     },
              //                                     child:  Card(
              //                                       color: Color(
              //                                         0xffA1D567,
              //                                       ),
              //                                       child: Center(
              //                                         child: Padding(
              //                                           padding: EdgeInsets.all(8.0),
              //                                           child: Text(
              //                                             "View details",
              //                                             style: TextStyle(
              //                                               fontWeight: FontWeight.bold,
              //                                               fontSize: 25.sp,
              //                                               color: Colors.black,
              //                                             ),
              //                                           ),
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             );
              //           }):Center(child: CircularProgressIndicator());
              //     }
              // ),
              ),
        ],
      ),
    );
  }

  // Future<List<offer>> khc() async{
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid=prefs.getString("userId");
  //   final response = await http.get(
  //     Uri.parse(Apiconst.logistic_your_offer+'$userid'),
  //   );
  //   var jsond = json.decode(response.body)['data'];
  //   print('wwwwwwwwwwwwwwwwwwww');
  //   print(jsond);
  //
  //   List<offer> allround = [];
  //   for (var o in jsond)  {
  //     offer al = offer(
  //       o["id"],
  //       o['offerdate'],
  //       o["traveldate"],
  //       o["price"],
  //       o["source_location"],
  //       o["destination_location"],
  //       o["logistics_id"],
  //       o["quantity"],
  //     );
  //
  //     allround.add(al);
  //   }
  //   return allround;
  // }
}

Future<List<LofferModel>> getlogisticoffer() async {
  final prefs = await SharedPreferences.getInstance();
  final userid = prefs.getString("userId");
  final response =
      await http.get(Uri.parse('${Apiconst.logistic_your_offer}$userid'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body)['data'] as List<dynamic>;
    return jsonData.map((item) => LofferModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

// class offer {
//   int id;
//   String offerdate;
//   String traveldate;
//   String price;
//   String source_location;
//   String destination_location;
//   String logistics_id;
//   String quantity;
//
//   offer(
//       this.id,
//       this.offerdate,
//       this.traveldate,
//       this.price,
//       this.source_location,
//       this.destination_location,
//       this.logistics_id,
//       this.quantity,
//       );
//
// }
