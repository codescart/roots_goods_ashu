import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart'as http;
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/constant/color_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';


class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {

  InputDecoration getInputDecoration(String hintext,) {
    return InputDecoration(
      counter: Offstage(),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      filled: true,




      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
      hintText: hintext,
      // fillColor: kBackgroundColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    );
  }
  TextEditingController feedback = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(

      appBar: AppBar(
        elevation: 12.r,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        title: Text('Feedback',
          style: TextStyle(color: Colors.black,fontSize: 20),),
        centerTitle: true,


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(top: 0,bottom: 10,left: 10),
                  child: Text('*Feedback',style: TextStyle(fontSize: 15),),
                ),
              ),
              TextFormField(
                controller: feedback,
                maxLines: 7,
                maxLength: 300,
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontSize: 18),
                // cursorColor: Colors.white,
                decoration: getInputDecoration(
                  "Share your feedback",
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(top: 20,bottom: 10,left: 10),
                  child: Text('*Attachment',style: TextStyle(fontSize: 15),),
                ),
              ),
              InkWell(
                onTap: _choose,
                child: Center(
                  child: Stack(
                    children: [
                      file != null
                          ?Container(
                        height: 120,

                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image:  FileImage(file!),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            color: Color(0xffe4f2fd),
                            border: Border.all(width: 2, color: Colors.white)),

                        // backgroundImage: FileImage(file!),

                      ) :Column(
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),

                                border: Border.all(width: 2, color: Colors.white),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/placeholder.png'),
                                )
                            ),
                          ),
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color:Colors.redAccent ,
                                border: Border.all(width: 2, color: Colors.white)),
                            child: Center(child: Text('Choose Your File')),

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 30),
                  child: SizedBox(
                    height: 40,
                    width: 300,
                    child: ElevatedButton(
                        onPressed:() {
                          feedbackform(
                              feedback.text
                          );


                        },
                        style: ElevatedButton.styleFrom(backgroundColor:green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
  var mydata;
  File? file;
  final picker = ImagePicker();
  void _choose() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
        final bytes = File(pickedFile.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        mydata = img64;
        print('Abhinav');
        print(img64);
        print('Thi');
      } else {
        print('No image selected.');
      }
    });
  }

  feedbackform(String feedback) async {

    print(mydata);
    print('ggggggggggggg');

    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    // Define the endpoint URL
    final url = Uri.parse(Apiconst.feedback);

    // Create a new multipart request
    final request = http.MultipartRequest('POST', url);

    // Add the form fields
    request.fields['userid'] = '$userid';
    request.fields['description'] = feedback;
    request.fields['image']="$mydata";
    try {
      // Send the request and get the response
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);
      print(data);
      if (data["status"] == "200") {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.green,
            fontSize: 16.0);
        Navigator.pop(context);
      } else {
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
