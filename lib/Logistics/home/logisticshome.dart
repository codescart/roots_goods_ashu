import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Login_screen.dart';
import 'package:roots_goods/Logistics/logistic_model/logistic_matchedoffer_model.dart';
import 'package:roots_goods/Logistics/model/model.dart';
import 'package:roots_goods/aboutus.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/farmer/utils/tinder_card.dart';
import 'package:roots_goods/feedback.dart';
import 'package:roots_goods/privecy_policies.dart';
import 'package:roots_goods/term&condition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logisticshome extends StatefulWidget {
  const logisticshome({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<logisticshome> {

  void initState() {
    viewprofile();
    super.initState();
  }


  var map;
  Future viewprofile() async {
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.farmer_profile+'userid=$userid'),
    );
    var data = jsonDecode(response.body);
    print(data);
    print("mmmmmmmmmmmm");
    if (data['status'] == '200') {
      setState(() {
        map =data['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(
        0.3,
      ),
      drawer: Drawer(
        width: 500.w,
        child:
            map ==null?Container():
        Column(

          children: [

            Center(
              child: map['profileimage']==null?CircleAvatar(
                radius: 80.r,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/coloruser.png'),
              ):
              CircleAvatar(
                radius: 80.r,
                backgroundImage: NetworkImage(
                    map['profileimage']==null?'':Apiconst.imgurl+map['profileimage'].toString()),
              ),
            ),
            SizedBox(height: 2.h),
            Text(map['name']==null?'Fill name':map['name'].toString(),
                style: TextStyle(fontSize: 30.sp, color: Colors.black,fontWeight: FontWeight.w900)),
            Text(map['email']==null?'':map['email'].toString(),
                style: TextStyle(fontSize: 30.sp, color: Colors.black,fontWeight: FontWeight.w900)),
            SizedBox(height: 2.h),
            Divider(thickness: 4.r,),
            SizedBox(
              height: 40.h,
            ),

            ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>term_condition()));
              },
              leading: Image.asset("assets/t&c.png",scale: 2,),
              title: Text("Terms & Condition",style: TextStyle(fontSize: 25.sp,
                  fontWeight: FontWeight.w900),),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>privecy_policies()));
              },
              leading:Image.asset("assets/policy.png",scale: 2,),
              title: Text("Privacy Policy",style: TextStyle(
                  fontSize: 25.sp,fontWeight: FontWeight.w900),),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>aboutus()));
              },
              leading: Image.asset("assets/about_US.png",height: 60.r,width: 60.r,),
              title: Text("About Us",style: TextStyle(
                  fontSize: 25.sp,fontWeight: FontWeight.w900),),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>feedback()));
              },
              leading: Image.asset("assets/feedback.png",height: 70.r,width: 70.r,),
              title: Text("Feedback",style: TextStyle(
                  fontSize: 25.sp,fontWeight: FontWeight.w900),),
            ),
            Spacer(),
            Container(
              width: 300.w,
              child: ListTile(

                onTap: (){
                  showDialog(

                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.white,

                        content:  Container(
                          height: 300.r,

                          child: Column(
                            children: [

                              Container(
                                height: 200.r,
                                width: 200.r,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          "assets/logout.png",

                                        )
                                    )
                                ),

                              ),

                              Text('Are you Sure?',style: TextStyle(fontSize: 40.sp,fontWeight: FontWeight.w900),),
                              Spacer(),


                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0.r),

                                  ),

                                  primary: Colors.redAccent,
                                  elevation: 10,
                                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
                              child: Text('Cancle')),
                          ElevatedButton(onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.remove('userId');
                            SharedPreferences prefs1 = await SharedPreferences.getInstance();
                            prefs1.remove("role");
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (BuildContext ctx) =>loginscreen()));
                          },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:  BorderRadius.circular(10.0.r),
                                  ),
                                  primary: Colors.green,
                                  elevation: 10,
                                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
                              child: Text('Logout')),
                        ],



                      );
                    },
                  );
                },
                leading: Image.asset("assets/logout.png",scale: 2,),
                trailing: Text("Log Out",style: TextStyle(
                    fontSize: 30.sp,fontWeight: FontWeight.w900),),
              ),
            )
          ],
        ),


      ),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,color: Colors.black,size: 40,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title:  Text(
          "Matched Offers",
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
      body: RefreshIndicator(
        onRefresh: () async  {
          setState(() {
            qwe();
            //error
          });
        },
        child: FutureBuilder<List<logistic_matchedoffer_model>>(
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
                      width: double.infinity,
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
                  return Padding(
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
                                        '${snapshot.data![index].farmerpickuplocation}',
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
                                      '${snapshot.data![index].cropname}',
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
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<logistic_matchedoffer_model>> qwe() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http
        .get(Uri.parse(Apiconst.logistic_matched_offer +'$userid'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      print(response);
      print('ttttttttttttttttt');
      return jsonData.map((item) => logistic_matchedoffer_model.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
