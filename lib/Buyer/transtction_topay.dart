import 'dart:convert';
import 'dart:io';

import 'package:another_stepper/utils/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/constant/color_resources.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;




class Topay_transction extends StatefulWidget {
  String amount;
  String tid;
  Topay_transction( {required this.amount, required this.tid});


  @override
  State<Topay_transction> createState() => _Topay_transctionState();
}

class _Topay_transctionState extends State<Topay_transction> {

  void copyToClipboard() {
    String acdetail='Name:'+map['holdername']+"\nAccount Number:"+map['accountnumber']+"\nIFSC Code:" +map['ifsc']+"\nBank :"+map['bank_name'];
    Clipboard.setData(ClipboardData(text: acdetail));
  }

  Future<void> share() async {
String acdetail='Name:'+map['holdername']+"\nAccount Number:"+map['accountnumber']+"\nIFSC Code:" +map['ifsc']+"\nBank :"+map['bank_name'];
    await FlutterShare.share(
        title: 'RootsGoods Private Limited',
        text: acdetail,
        // linkUrl: '',
        chooserTitle: ''
    );
  }
  bool _loading = false;


  void initState() {
    Accountdetail();
    super.initState();
  }


  var map;
  Future Accountdetail() async {
    // final prefs = await SharedPreferences.getInstance();
    // final userid=prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.admin_account_detail),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),

        ),
        title: const Text(
          "To pay",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body:   Column(
        children: [
          Padding(
            padding: EdgeInsets.all(38.r),
            child: DottedBorder(
              color: titlecolor,
              borderType: BorderType.RRect,
              radius: Radius.circular(12.r),
              padding: EdgeInsets.all(6.r),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                child: Container(
                  height: 160.h,
                  width: double.infinity,
                  child:
                  map==null?Center(child: CircularProgressIndicator()):
                  Column(
                    children: [
                      Text('We only take RTGS/NEFT ',
                        style: TextStyle(fontSize: 40.sp,
                          fontWeight:FontWeight.bold ),),
                      SizedBox(height: 20.h,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ',
                            style: TextStyle(fontSize: 25.sp,
                                color:kGreyColor900,
                                fontWeight:FontWeight.w500 ),
                            textAlign: TextAlign.start,
                          ),
                          Text(map["holdername"]==null?'':
                            map["holdername"],
                            style: TextStyle(fontSize: 35.sp,
                                color: titlecolor,
                                fontWeight:FontWeight.bold ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 10.h,),
                          Text('Account Number: ',
                            style: TextStyle(fontSize: 25.sp,
                                color:kGreyColor900,
                                fontWeight:FontWeight.w500 ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            map['accountnumber']==null?'':
                            map['accountnumber'],
                            style: TextStyle(fontSize: 35.sp,
                                color: titlecolor,
                                fontWeight:FontWeight.bold ),),
                          SizedBox(height: 10.h,),
                          Text('IFSC code : ',
                            style: TextStyle(fontSize: 25.sp,
                                color:kGreyColor900,
                                fontWeight:FontWeight.w500 ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            map['ifsc']==null?'':
                            map['ifsc'],
                            style: TextStyle(fontSize: 35.sp,
                                color: titlecolor,
                                fontWeight:FontWeight.bold ),),
                          SizedBox(height: 10.h,),
                          Text('Bank : ',
                            style: TextStyle(fontSize: 25.sp,
                                color:kGreyColor900,
                                fontWeight:FontWeight.w500 ),
                            textAlign: TextAlign.start,
                          ),
                          Text(map['bank_name']==null?''
                              :map['bank_name'],
                            style: TextStyle(fontSize: 35.sp,
                                color: titlecolor,
                                fontWeight:FontWeight.bold ),),


                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.all(28.sm),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: ()async {
                                share();
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12.r),
                                padding: EdgeInsets.all(6.r),
                                child: Row(
                                  children: [
                                    Text('  share',
                                      style: TextStyle(fontSize: 25.sp,
                                          color:kGreyColor900,
                                          fontWeight:FontWeight.w500 ),
                                    ),
                                    Icon(Icons.share)
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                copyToClipboard();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Account detail are copied to clipboard!')),
                                );
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12.r),
                                padding: EdgeInsets.all(6.r),
                                child: Row(
                                  children: [
                                    Text('  copy',
                                      style: TextStyle(fontSize: 25.sp,
                                          color:kGreyColor900,
                                          fontWeight:FontWeight.w500 ),
                                    ),
                                    Icon(Icons.copy_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  // color: Colors.amber,
                ),
              ),
            ),
          ),
          Text('Upload the screenshot of the transaction\n when the transaction is completed',
            style: TextStyle(fontSize: 30.sp,
                fontWeight:FontWeight.bold ),
            textAlign: TextAlign.center,
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(38.r, 38.r, 38.r, 3.r),
            child: DottedBorder(
              color: green,
              borderType: BorderType.RRect,
              radius: Radius.circular(12.r),
              padding: EdgeInsets.all(6.r),
              child: Container(
                padding: EdgeInsets.fromLTRB(5.r, 8.r, 5.r, 8.r),
                // height:MediaQuery.of(context).size.height/6,

                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
                    color: Color(0xffdbe9f2),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.camera_enhance_rounded,
                      color: Colors.blue,
                      size: 30,
                    ),
                    file != null
                        ? SizedBox(
                      height: 6,
                    )
                        : SizedBox(),
                    file == null
                        ? Text(
                      "Using Camera, Gallery or Files",
                      style: TextStyle(fontSize: 11.5),
                    )
                        : Text(
                      file!.files.elementAt(0).name.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                    file != null
                        ? SizedBox(
                      height: 6,
                    )
                        : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        file != null
                            ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 18,
                        )
                            : Text(""),
                        // Text(file.toString()),
                        file != null
                            ? Text(
                          "  Uploaded Successfully",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600),
                        )
                            : Text("")
                      ],
                    ),
                    file != null
                        ? SizedBox(
                      height: 6,
                    )
                        : SizedBox(),
                    InkWell(
                      onTap: () {
                        _choose();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8),
                        child: file == null
                            ? Text(
                          "UPLOAD",
                          style: TextStyle(
                              color: Colors.white, fontSize: 12),
                        )
                            : Text("UPLOAD AGAIN",
                            style: TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(left:38.r),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Upload JPEG, PDF, PNG, or JPG upto 10 mb",

                style: TextStyle(fontSize: 10,),

              ),
            ),
          ),
          SizedBox(
            height: 10.r,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {

                      _screenshort();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: _loading == false
                        ? Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                        : Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(
                                  Colors.white)),
                          Text(
                            "Please Wait...",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ),

        ],
      )
    );
  }

   var mydata;
  FilePickerResult? file;
  final picker = ImagePicker();

  void _choose() async {
    file = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'jpeg', 'png'],
    );
    if (file == null) {
      print("No file selected");
    } else {
      if (file!.files.first.size.toDouble() > 10000000) {
        print("size is larger then allowence");
        // setState(() {
        //   Utils.flushBarErrorMessage(
        //       "Image not selected because image size not more than 10 Mb",
        //       context,
        //       Colors.white);
        //   file = null;
        // });
      } else {
        final bytes = File(file!.files.first.path!).readAsBytesSync();
        String img64 = base64Encode(bytes);
        mydata = img64;
      }
      setState(() {
        file?.files.forEach((element) {
          print(element.name);
        });
      });
    }
  }




  _screenshort() async {

    setState(() {
      _loading = true;
    });

    print(mydata);
    print('ggggggggggggg');

    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    // Define the endpoint URL
    final url = Uri.parse(Apiconst.buyer_tranction_screenshort);

    // Create a new multipart request
    final request = http.MultipartRequest('POST', url);

    // Add the form fields
    request.fields['userid'] = '$userid';
    request.fields['amount'] = widget.amount;
    request.fields['transactionid'] = widget.tid;
    request.fields['image']="$mydata";
    try {
      // Send the request and get the response
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);
      print(data);
      print("merasaman");
      // Check if the request was successful
      if (data["status"] == "200") {
        setState(() {
          _loading = false;
        });
        Fluttertoast.showToast(
            msg: data['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.green,
            fontSize: 16.0);
        Navigator.pop(context);
      } else {
        setState(() {
          _loading = false;
        });
        Fluttertoast.showToast(
            msg: data['msg'],
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
}
