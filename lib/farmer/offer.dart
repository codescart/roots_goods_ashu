import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/farmer/utils/detailtranction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class Offer extends StatefulWidget {
  const Offer({super.key});

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.r,
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height: 10.h,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35.h,

                child: FutureBuilder<List<tramscation>>(
                    future: khc(),
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
                                "Transction's are not available",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.sp,
                                ),
                              ),

                            ],
                          ),
                        );
                      }
                      else
                        return
                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return

                              snapshot.data![index].logisticsname==null?
                              Padding(
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
                                                "Price Per Ton : ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.sp,
                                                  color: Color(0xffD88A63),
                                                ),
                                              ),
                                              Text(
                                                '${snapshot.data![index].priceperton}',
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
                                                "Buyer Name : ",
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
                                          Center(
                                            child: Text(
                                              "Logistic are not assigned",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40.sp,
                                                color: Color(0xffD88A63),
                                              ),
                                            ),
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
                                                '${snapshot.data![index].totalamount}',
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
                              ):
                              InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  DetailTrancation(
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
                                                "Price Per Ton : ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.sp,
                                                  color: Color(0xffD88A63),
                                                ),
                                              ),
                                              Text(
                                                  '${snapshot.data![index].priceperton}',
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
                                                "Buyer Name : ",
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
                                                '${snapshot.data![index].totalamount}',
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
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }


  Future<List<tramscation>> khc() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    print(userid);
    print('1111111111111111111111111');
    final response = await http.get(
      Uri.parse(Apiconst.Farmer_transaction+'$userid'),
    );
    var jsond = json.decode(response.body)["data"];
    print('wwwwwwwwwwwwwwwwwwww');
    print(jsond);


    List<tramscation> allround = [];
    for (var o in jsond)  {
      tramscation al = tramscation(
        o["id"],
        o['transactionid'],
        o["transactiondate"],
        o["paymentstatus"],
        o["paymentrecived_date"],
        o["logisticstatus"],
        o["cropname"],
        o["quantityinton"],
        o["priceperton"],
        o["totalamount"],
        o["buyerlocation"],
        o["logisticsname"],
        o["logistics_contact"],
        o["buyername"],
        o["buyercontact"],
        o["farmerpaystatus"],


      );

      allround.add(al);
    }
    return allround;
  }
}
class tramscation {
  int? id;
  String? transactionid;
  String? transactiondate;
  String? paymentstatus;
  String? paymentrecived_date;
  String? logisticstatus;
  String? cropname;
  String? quantityinton;
  String? priceperton;
  String? totalamount;
  String? buyerlocation;
  String? logisticsname;
  String? logistics_contact;
  String? buyername;
  String? buyercontact;
  String? farmerpaystatus;





  tramscation(
      this.id,
      this.transactionid,
      this.transactiondate,
      this.paymentstatus,
      this.paymentrecived_date,
      this.logisticstatus,
      this.cropname,
      this.quantityinton,
      this.priceperton,
      this.totalamount,
      this.buyerlocation,
      this.logisticsname,
      this.logistics_contact,
      this.buyername,
      this.buyercontact,
      this.farmerpaystatus,

      );

}