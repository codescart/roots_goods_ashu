import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Logistics/utils/buyeraddoffer.dart';
import 'package:roots_goods/Logistics/viewdetailoffer.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/video/videoss.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cartt extends StatefulWidget {
  const Cartt({super.key});

  @override
  State<Cartt> createState() => _UpdatePricsState();
}

class _UpdatePricsState extends State<Cartt> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Your Offers",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BuyerUploadProduct(),
                ),
              );
            },
            child: Padding(
              padding:  EdgeInsets.only(top: 15.0.r,bottom: 15.r),
              child: Card(
                color: const Color(0xffA1D567),
                child: Container(
                  height: 5.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 13,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
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
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          setState(() {
            khc();//error
          });
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            FutureBuilder<List<offer>>(
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
                          "Offer's are not available\n First add new offer",
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
                    shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children:  [
                                              Text(
                                                "Crop Name : ",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffD88A63),
                                                ),
                                              ),
                                              Text(
                                                "${snapshot.data![index].cropname}",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xff747474),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children:  [
                                              Text(
                                                "Quantity In Ton : ",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffD88A63),
                                                ),
                                              ),
                                              Text(
                                                "${snapshot.data![index].quantity}",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xff747474),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children:  [
                                              Text(
                                                "Price Per Ton: ",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffD88A63),
                                                ),
                                              ),
                                              Text(
                                                "${snapshot.data![index].price}",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xff747474),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Buyer_View_offer_Detail(snapshot.data![index]),
                                              ),
                                            );
                                          },
                                          child: const Card(
                                            color: Color(0xffA1D567),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "View details",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
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
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  Future<List<offer>> khc() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.buyer_getoffer+'$userid'),
    );
    var jsond = json.decode(response.body)['data'];
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
        o["delivery_location"],
        o["buyername"],
        o["offerstatus"],


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
  String delivery_location;
  String buyername;
  String offerstatus;




  offer(
      this.id,
      this.cropname,
      this.quantity,
      this.price,
      this.totalamount,
      this.offerdate,
      this.delivery_location,
      this.buyername,
      this.offerstatus,
      );

}