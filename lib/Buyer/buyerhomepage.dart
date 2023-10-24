import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roots_goods/Buyer/buyer_farmer_offer.dart';
import 'package:roots_goods/Buyer/buyer_logistic_offer.dart';
import 'package:roots_goods/Buyer/buyer_model/buyer_farmer_model.dart';
import 'package:roots_goods/Login_screen.dart';
import 'package:roots_goods/aboutus.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/feedback.dart';
import 'package:roots_goods/privecy_policies.dart';
import 'package:roots_goods/term&condition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Byuer extends StatefulWidget {
  const Byuer({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Byuer> with TickerProviderStateMixin {

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



    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(
          0.3,
        ),
        drawer: Drawer(
          width: 500.w,

          child:  map==null?Container():
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
                              child: Text("Offer", style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold)),
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
                              child: Text("Offer", style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold)),
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
                  qwe();
                  //error
                });
              },
              child: buyer_farmer_offer(),
            ),
            RefreshIndicator(
              onRefresh: () async  {
                setState(() {
                  qwe();
                  //error
                });
              },
              child: buyer_logistic_offer(),
            ),
          ],
        ),
      ),
    );
  }
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


}
