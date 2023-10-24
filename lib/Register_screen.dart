import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:roots_goods/Otp_screen.dart';
import 'package:roots_goods/constant/Constat_file.dart';

class register extends StatefulWidget {
  final number;
  const register({Key? key, required this.number}) : super(key: key);
  @override
  State<register> createState() => _registerState();
}
class _registerState extends State<register> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    state();
    super.initState();
  }


  String? Role;
  List Role_data = [];
  Future<String> state() async {
    final res = await http
        .get(Uri.parse(Apiconst.Role));
    final resBody = json.decode(res.body);
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      Role_data = resBody;
    });
    return "Sucess";
  }
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController(text: widget.number.toString());
    return SafeArea(
        child: Scaffold(

      body: Padding(
        padding:  EdgeInsets.all(20.0.r),
        child: ListView(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200.r, height: 200.r,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/logo.png'),
                  )
                ),
              ),

            ),
             SizedBox(
              height: 30.h,
            ),
            Center(
                child: Text(
              "Register to Roots Goods",
              style: GoogleFonts.alike(
                textStyle:  TextStyle(
                  fontSize: 30.sp,
                ),
              ),
            )),
             SizedBox(
              height: 20.h,
            ),
             Divider(
              thickness: 1.r,
              color: Colors.grey,
            ),


            Container(
              height: 180.h,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.alike(
                            textStyle:  TextStyle(
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                         SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 25.h,
                          child: TextFormField(
                            validator:validateName,
                            controller: nameController,
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.black87, width: 1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.black87, width: 1),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Color(0xFFF65054)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Color(0xFFF65054)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),




                              hintStyle: GoogleFonts.alike(
                                textStyle:  TextStyle(
                                  fontSize: 25.sp,
                                ),
                              ),
                              hintText: "Your Name",

                              // fillColor: kBackgroundColor,
                              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                            ),
                          ),
                        ),
                         SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Phone Number",
                          style: GoogleFonts.alike(
                            textStyle:  TextStyle(
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                         SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 25.h,
                          child: TextFormField(
                            readOnly: true,
                            buildCounter: (BuildContext context,
                                    {int? currentLength,
                                    int? maxLength,
                                    bool? isFocused}) =>
                                null,
                            maxLength: 10,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length != 10) {
                                return 'Mobile number cannot be empty';
                              }
                              return null;
                            },
                            controller: phoneController,
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.black87, width: 1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.black87, width: 1),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Color(0xFFF65054)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Color(0xFFF65054)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.phone_android_outlined,
                                color: Colors.grey,
                              ),




                              hintStyle: GoogleFonts.alike(
                                textStyle:  TextStyle(
                                  fontSize: 25.sp,
                                ),
                              ),
                              hintText: widget.number,

                              // fillColor: kBackgroundColor,
                              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                            ),
                            // decoration: InputDecoration(
                            //   prefixIcon: const Icon(
                            //     Icons.phone_android_outlined,
                            //     color: Colors.black54,
                            //   ),
                            //   fillColor: Colors.white,
                            //   filled: true,
                            //   border: OutlineInputBorder(
                            //     borderSide: const BorderSide(
                            //       width: 5,
                            //       color: Colors.black,
                            //     ),
                            //     borderRadius: BorderRadius.circular(
                            //       5,
                            //     ),
                            //   ),
                            //   hintText: widget.number,
                            //   hintStyle: GoogleFonts.alike(
                            //     textStyle:  TextStyle(
                            //       fontSize: 25.sp,
                            //     ),
                            //   ),
                            // ),
                          ),
                        ),
                         SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Email Address",
                          style: GoogleFonts.alike(
                            textStyle:  TextStyle(
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                         SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 25.h,
                          child: TextFormField(
                            validator: validateEmail,
                            controller: emailController,
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.black87, width: 1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.black87, width: 1),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Color(0xFFF65054)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Color(0xFFF65054)),
                              ),
                              //filled: true,
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Colors.grey,
                              ),




                              hintStyle: GoogleFonts.alike(
                                textStyle:  TextStyle(
                                  fontSize: 25.sp,
                                ),
                              ),
                              hintText: "Example@gmail.com",
                              filled: true,
                              fillColor: Colors.white,
                              // fillColor: kBackgroundColor,
                              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Role",
                          style: GoogleFonts.alike(
                            textStyle:  TextStyle(
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                           height: 25.h,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 20.r, right: 20.r),
                          // alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border: Border.all( color: Colors.black)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text('Select your Role',
                                style: GoogleFonts.alike(
                                  textStyle:  TextStyle(
                                    fontSize: 25.sp,
                                  ),
                                ),

                              ),
                              items: Role_data.map((item) {
                                return DropdownMenuItem(
                                    child:
                                        Container(

                                          height: 100.h,
                                          width: 500.w,
                                          child: ListTile(
                                            leading: Image.network('http://3.111.255.71:8000'+
                                                    item['image'].toString(),
                                                    height: 70.r,
                                                    width: 70.r,
                                                    ),
                                            trailing:  Text(
                                              item['name'].toString(),
                                              overflow: TextOverflow.clip,
                                              softWrap: false,
                                              style: GoogleFonts.alike(
                                                textStyle:  TextStyle(
                                                    fontSize: 25.sp,
                                                    fontWeight: FontWeight.w900
                                                ),
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ),

                                    value: item['id'].toString());
                              }).toList(),
                              onChanged: (value) async {
                                setState(() {
                                  Role = value as String;
                                });

                              },
                              value: Role,
                            ),
                          ),
                        ),
                         SizedBox(
                          height: 20.h,
                        ),

                        Center(
                          child: SizedBox(
                            width: 600.w,
                            height: 20.h,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  Register(
                                      nameController.text,
                                      emailController.text,
                                      phoneController.text,

                                  );

                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffa1d567),
                                // backgroundColor: ColorConstant.buttoncolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: _loading == false?
                              Text(
                                "Register",
                                style: GoogleFonts.alike(
                                  textStyle:  TextStyle(
                                    fontSize: 35.sp,
                                  ),
                                ),
                              ): Padding(
                                padding:  EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircularProgressIndicator(
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white)),
                                Text(
                                  "Please Wait...",
                                  style: GoogleFonts.alike(
                                    textStyle:  TextStyle(
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }


  bool _loading = false;
  Future<void> Register(
      String nameController,
      String emailController,
      String phoneController,


      )  async {
    setState(() {
      _loading = true;
    });

    print('ggggggggggggg');
    // Define the endpoint URL
    final url = Uri.parse(Apiconst.Register);

    // Create a new multipart request
    final request = http.MultipartRequest('POST', url);

    // Add the form fields
    request.fields['name'] = nameController;
    request.fields['email'] = emailController;
    request.fields['phone'] = phoneController;
    request.fields['role'] = '$Role';




    try {
      // Send the request and get the response
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);

      print("merasaman");
      // Check if the request was successful
      if (data["status"] == "200") {
        final userId=data['data']['id'];
        final role=data['data']['role'];
        final otp=data['otp'];

        otpfunction(otp:otp,number:phoneController);
        print(data);
        print(userId);
        print(otp);
        print(role);
        setState(() {
          _loading = false;
        });
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.green,
            fontSize: 16.0);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context)=>OTPScreens(userid:userId,
              number:phoneController,
              role:role,
              otp:otp,
            )));
      } else {
        setState(() {
          _loading = false;
        });
        Fluttertoast.showToast(
            msg: data['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 16.0);


        print("Error");
      }
    } catch (e) {
      print('Error: $e');
    }
  }



  otpfunction({required otp, required String number}) async {
    print(number);
    print('ggggggggggggg');
    // Define the endpoint URL
    final url = Uri.parse( Apiconst.otpurl+'$number&sender=RTSGDS&message=Your Registration / Login OTP is $otp for the RootsGoods Mobile App. <ROOTSGOODS>');
    print(url);
    print('nnnnnnnnnnnnnnnnnnnn');
    await http.get(url);



    // Create a new multipart request


    // Add the form fields







//     var c;
//     final res = await c.send(
//         Request(
//           method: "GET",
//           url: "https://api.textlocal.in/send/?apikey=Ivp4hmerrTs-3NiLaoXMHdS8oFxCeNH6gvvufBDlEA&numbers="+"$number"+"&sender=RTSGDS&message=Your Registration / Login OTP is "+"$otp"+"for the RootsGoods Mobile App. <ROOTSGOODS>",
//
//           headers: {
//             "user-agent": "myapp-v1.0/android9"
//           },
//
//
//
//         ));
//     print(res);
//     print('uuuuuuuuuuuuuuuuuuuuuuuuuuu');
//     print('yyyyyyyyyyyyyyyyyyyyyyyyyyy');
//     print('rrrrrrrrrrrrrrrrr');
//
// // Read response
//     print("Status: ${res.statusCode}");
//     print("HTTP: ${res.httpVersion}");
//     res.headers.forEach((key, value) {
//       print("$key: $value");
//     });
//     print(res.text());

  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }

  String? validateName(String? value) {
    if (value!.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }
}
