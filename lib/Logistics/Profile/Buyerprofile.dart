import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Login_screen.dart';
import 'package:roots_goods/Logistics/Profile/buyereditprofile.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyerProfile extends StatefulWidget {
  const BuyerProfile({Key? key}) : super(key: key);

  @override
  State<BuyerProfile> createState() => _rootsgoodState();
}

class _rootsgoodState extends State<BuyerProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        body:
        map==null?Center(child: CircularProgressIndicator()):
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: map['profileimage']== null? CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      'assets/coloruser.png',
                    ),
                    radius: 50,
                  ):
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(Apiconst.imgurl+map['profileimage'].toString()),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(
                        Icons.person,
                        color: Color(
                          0xff747474,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        map['name']==null?'Fill name':map['name'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Mobile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(
                        Icons.phone_android,
                        color: Color(
                          0xff747474,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        map['mobile']==null?'Fill mobile no.':map['mobile'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(
                        Icons.mail,
                        color: Color(
                          0xff747474,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        map['email']==null?'Fill email':map['email'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Father Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(
                        Icons.person,
                        color: Color(
                          0xff747474,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        map['fathername']==null?'Fill father name':map['fathername'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Aadhar Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(
                        Icons.verified_user_rounded,
                        color: Color(
                          0xff747474,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        map['aadharno']==null?'fill aadhar no.':map['aadharno'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "GSTIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/id.png",
                        color:  Color(0xff747474),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                       Text(
                         map['gstin']==null?' fill GSTIN':map['gstin'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  BuyerEditProfile(
                              img:map['profileimage']==null?'':
                              map['profileimage'],

                              name:map['name']==null?'':
                              map['name'],

                              number:map['mobile']==null?'':
                              map['mobile'],

                              email:map['email']==null?'':
                              map['email'],

                              fname:map['fathername']==null?'':
                              map['fathername'],

                              Adno:map['aadharno']==null?'':
                              map['aadharno'],

                              GSTIN:map['gstin']==null?'':
                              map['gstin'],


                            )));
                  },
                  child: Center(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xffA1D567),
                        border: Border.all(
                          color: const Color(0xffA1D567),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/pencil.png"),
                            const Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
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
          ),
        ),
      ),
    );
  }
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
}
