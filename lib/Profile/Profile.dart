import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Login_screen.dart';
import 'package:roots_goods/Profile/editprofile.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
   Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _rootsgoodState();
}



class _rootsgoodState extends State<Profile> {

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title:  Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        body: map== null?Center(child: CircularProgressIndicator()):
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: map['profileimage']==null?CircleAvatar(
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
                 SizedBox(
                  height: 20,
                ),
                 Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                 SizedBox(
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
                        map['name']==null?'Fill your name':map['name'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                 Text(
                  "Mobile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                 SizedBox(
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
                        map['mobile']==null?'Fill your mobile':map['mobile'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                 Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                 SizedBox(
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
                        map['email']==null?'Fill your email':map['email'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                 Text(
                  "Father Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                 SizedBox(
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
                        map['fathername']==null?'Fill your father name':map['fathername'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                 Text(
                  "Aadhar Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                 SizedBox(
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
                        map['aadharno']==null?'fill your aadhar no':map['aadharno'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                 Divider(
                  thickness: 2,
                ),
                 SizedBox(
                  height: 5,
                ),
                 Text(
                  "Bank Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                 Divider(
                  thickness: 2,
                ),
                 SizedBox(
                  height: 5,
                ),

                Text(
                  "A/c Holder name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
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
                        map['accountholdername']==null?'fill your A/c holder name':map['accountholdername'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 Text(
                  "Account Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
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
                        map['accountno']==null?'fill your account no':map['accountno'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                 Text(
                  "Bank Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(
                        Icons.food_bank_sharp,
                        color: Color(
                          0xff747474,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        map['bankname']==null?'fill your bank name':map['bankname'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                 Text(
                  "Bank Branch Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(
                        Icons.streetview,
                        color: Color(
                          0xff747474,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        map['branchname']==null?'fill your branch name':map['branchname'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 Text(
                  "IFSC",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children:  [
                      Icon(
                        Icons.password_rounded,
                        color: Color(
                          0xff747474,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        map['ifsc']==null?'fill your ifsc':map['ifsc'].toString(),
                        style: TextStyle(
                          color: Color(0xff747474),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  EditProfile(
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

                          Acno:map['accountno']==null?'':
                          map['accountno'],

                          bank:map['bankname']==null?'':
                          map['bankname'],

                          branch:map['branchname']==null?'':
                          map['branchname'],

                          ifsc:map['ifsc']==null?'':
                          map['ifsc'],

                          achn:map['accountholdername']==null?'':
                          map['accountholdername'],
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color:  Color(0xffA1D567),
                        border: Border.all(
                          color:  Color(0xffA1D567),
                        ),
                        borderRadius:  BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(
                          12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/pencil.png"),
                             Text(
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
}
