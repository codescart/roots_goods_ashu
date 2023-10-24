import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Logistics/utils/Farmerviewdetailoffer.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/farmer/uploadproducts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdatePrics extends StatefulWidget {
  const UpdatePrics({super.key});

  @override
  State<UpdatePrics> createState() => _UpdatePricsState();
}

class _UpdatePricsState extends State<UpdatePrics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
           SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:  EdgeInsets.only(
              left: 10.r,
              right: 10.r,
            ),
            child: Row(
              children: [
                 Text(
                  "Your offers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UploadProduct(),
                      ),
                    );
                  },
                  child: Card(
                    color:  Color(
                      0xffA1D567,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Padding(
                            padding: EdgeInsets.all(2.r),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 25.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              "Add New Offer",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
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
           SizedBox(
            height: 10.h,
          ),
          FutureBuilder<List<offer>>(
              future: khc(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding:  EdgeInsets.all(8.0.r),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 5.r,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,

                          ),
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(
                                  left: 12.r,
                                  top: 10.r,
                                  bottom: 10.r,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                     SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children:  [
                                        Text(
                                          "Crop Name : ",
                                          style: TextStyle(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffD88A63),
                                          ),
                                        ),
                                        Text(
                                         snapshot.data![index].cropname,
                                          style: TextStyle(
                                            fontSize: 25.sp,
                                            color: Color(0xff747474),
                                          ),
                                        ),
                                      ],
                                    ),
                                     SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children:  [
                                        Text(
                                          "Quantity In Ton : ",
                                          style: TextStyle(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffD88A63),
                                          ),
                                        ),
                                        Text(
                                          "₹ "+snapshot.data![index].quantity,
                                          style: TextStyle(
                                            fontSize: 25.sp,
                                            color: Color(0xff747474),
                                          ),
                                        ),
                                      ],
                                    ),
                                     SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children:  [
                                        Text(
                                          "Price Per Ton : ",
                                          style: TextStyle(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffD88A63),
                                          ),
                                        ),
                                        Text(
                                          "₹ "+snapshot.data![index].price,
                                          style: TextStyle(
                                            fontSize: 25.sp,
                                            color: Color(0xff747474),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:  EdgeInsets.only(left: 8.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                             Farmer_View_offer_Detail(snapshot.data![index]),
                                          ),
                                        );
                                      },
                                      child:  Card(
                                        color: Color(0xffA1D567),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0.r),
                                            child: Text(
                                              "View Details",
                                              style: TextStyle(
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.bold,
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
                    );
                  }):Center(child: CircularProgressIndicator());
            }
          ),
           SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Future<List<offer>> khc() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    print(userid);
    print('1111111111111111111111111');
    final response = await http.get(
      Uri.parse(Apiconst.offer_view+'$userid'),
    );
    var jsond = json.decode(response.body)["data"];
    print('wwwwwwwwwwwwwwwwwwww');
    print(jsond);


    List<offer> allround = [];
    for (var o in jsond)  {
      offer al = offer(
        o["id"],
        o['cropname'],
        o["quantity"],
        o["price"],
        o["totalamount"],
        o["offerdate"],
        o["pickuplocation"],
        o["farmer_id"],
        o["offerstatus"],
        o["certificateid"],
      );

      allround.add(al);
    }
    return allround;
  }
}


class offer {
  int id;
  String cropname;
  String quantity;
  String price;
  String totalamount;
  String offerdate;
  String pickuplocation;
  String farmer_id;
  String offerstatus;
  String certificateid;



  offer(
      this.id,
      this.cropname,
      this.quantity,
      this.price,
      this.totalamount,
      this.offerdate,
      this.pickuplocation,
      this.farmer_id,
      this.offerstatus,
      this.certificateid,
      );

}
