import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Login_screen.dart';
import 'package:roots_goods/aboutus.dart';
import 'package:roots_goods/constant/color_resources.dart';
import 'package:roots_goods/feedback.dart';
import 'package:roots_goods/privecy_policies.dart';
import 'package:roots_goods/term&condition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/Constat_file.dart';
void showSnakbar(context, String s) {
  final snackBar = SnackBar(
    content: Text('$s'),
    duration: Duration(milliseconds: 500),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
        map==null?Container():
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
          "Selected Offers",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 35.sp,
          ),
        ),
        elevation: 12.r,
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
        child: FutureBuilder<List<offer>>(
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
                  return Padding(
                    padding:  EdgeInsets.all(28.0.r),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side:  BorderSide(
                          color:titlecolor,
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
                        child: Container(

                          height: 230.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                               Padding(
                                padding: EdgeInsets.only(
                                  left: 10.r,
                                  top: 7.r,
                                ),
                                child: Text(
                                  "Offer Details",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.sp,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(
                                  left: 10.r,
                                  top: 40.r,
                                ),
                                child: Row(
                                  children:  [
                                    Text(
                                      "Crop Name :",
                                      style: TextStyle(
                                        fontSize: 35.sp,
                                        color:titlecolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 3.r,
                                        top: 2.r,
                                      ),
                                      child: Text(
                                       snapshot.data![index].cropname,
                                        style: TextStyle(
                                          color: kBlackColor800,
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
                                  children:  [
                                    Text(
                                      "Buyer name:",
                                      style: TextStyle(
                                        fontSize: 35.sp,
                                        color:titlecolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 3.r,
                                        top: 2.r,
                                      ),
                                      child: Text(
                                        snapshot.data![index].buyer_name,
                                        style: TextStyle(
                                          color: kBlackColor800,
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
                                  children:  [
                                    Text(
                                      "Price Per Ton:",
                                      style: TextStyle(
                                        color:titlecolor,
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 3.r,
                                        top: 5.r,
                                      ),
                                      child: Text(
                                        "₹  "+snapshot.data![index].buyer_priceperton,
                                        style: TextStyle(
                                          color: kBlackColor800,
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
                                  children:  [
                                    Text(
                                      "Quantity In Ton:",
                                      style: TextStyle(
                                        color:titlecolor,
                                        fontSize:35.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 3.r,
                                        top: 2.r,
                                      ),
                                      child: Text(
                                          snapshot.data![index].buyer_quantity,
                                        style: TextStyle(
                                          color: kBlackColor800,
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
                                        color: titlecolor,
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
                                            snapshot.data![index].buyer_location,
                                         maxLines: 3 ,
                                          style: TextStyle(
                                            color: kBlackColor800,
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
                                height: 17.h,
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
                                  top: 40.r,
                                ),
                                child: Row(
                                  children: [
                                     Text(
                                      "Price Per Ton :",
                                      style: TextStyle(
                                        color:titlecolor,
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(
                                        left: 3.r,
                                        top: 2.r,
                                      ),
                                      child: Text(snapshot.data![index].farmer_priceperton,
                                        // contents[index].price,
                                        style:  TextStyle(
                                          color: kBlackColor800,
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
                                      "Quantity In Tons :",
                                      style: TextStyle(
                                        color:titlecolor,
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
                                          snapshot.data![index].farmer_quantity,
                                        // contents[index].quantity,
                                        style:  TextStyle(
                                          color: kBlackColor800,
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
                                        color:titlecolor,
                                        fontSize:35.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      width: 400.w,
                                      child: Padding(
                                        padding:  EdgeInsets.only(
                                          left: 3.r,
                                          top: 2.r,
                                        ),
                                        child: Text(
                                            snapshot.data![index].farmer_location,
                                          //  contents[index].location,
                                          maxLines: 3,
                                          style:  TextStyle(
                                            color: kBlackColor800,
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

  Future<List<offer>> qwe() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    print(userid);
    print('1111111111111111111111111');
    final response = await http.get(
      Uri.parse(Apiconst.selected_view+'$userid'),
    );
    var jsond = json.decode(response.body)["data"];
    print('wwwwwwwwwwwwwwwwwwww');
    print(jsond);

    List<offer> allround = [];


    for (var o in jsond)  {
      offer al = offer(
        o["buyerofferid"],
        o['buyer_priceperton'],
        o["buyer_quantity"],
        o["buyer_location"],
        o["farmer_priceperton"],
        o["farmer_location"],
        o["farmer_quantity"],
        o["farmer_offerid"],
        o["farmer_id"],
        o["buyer_name"],
        o["cropname"],
      );

      allround.add(al);
    }
    return allround;
  }


}
class offer {
  int buyerofferid;
  String buyer_priceperton;
  String buyer_quantity;
  String buyer_location;
  String farmer_priceperton;
  String farmer_location;
  String farmer_quantity;
  int  farmer_offerid;
  String farmer_id;
  String buyer_name;
  String cropname;



  offer(
      this.buyerofferid,
      this.buyer_priceperton,
      this.buyer_quantity,
      this.buyer_location,
      this.farmer_priceperton,
      this.farmer_location,
      this.farmer_quantity,
      this.farmer_offerid,
      this.farmer_id,
      this.buyer_name,
      this.cropname,
      );

}








