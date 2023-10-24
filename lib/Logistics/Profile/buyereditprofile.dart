import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart'as http;
import 'package:roots_goods/Profile/Profile.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyerEditProfile extends StatefulWidget {
  final img;
  final name;
  final number;
  final email;
  final fname;
  final Adno;
  final GSTIN;

  BuyerEditProfile( {
    required
    this.img,
    this.name,
    this.number,
    this.email,
    this.fname,
    this.Adno,
    this.GSTIN,

  });



  @override
  State<BuyerEditProfile> createState() => _rootsgoodState();
}

class _rootsgoodState extends State<BuyerEditProfile> {

  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _father = TextEditingController();
  TextEditingController _adhar = TextEditingController();
  TextEditingController _GSTIN = TextEditingController();

  bool _loading = false;

  view(){

    setState(() {

      _name.text = widget.name;
      _phone.text = widget.number;
      _email.text = widget.email;
      _father.text = widget.fname;
      _adhar.text = widget.Adno;
      _GSTIN.text = widget.GSTIN;
    });
  }

  @override
  void initState() {
    view();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: _choose,
                  child: Center(
                    child: Stack(
                      children: [
                        file != null
                            ? CircleAvatar(
                          backgroundImage: FileImage(file!),
                          radius: 50,
                        ) :CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              Apiconst.imgurl+widget.img),
                          radius: 50,
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              radius: 15,
                              child: Icon(Icons.camera_alt_outlined),
                            )),
                      ],
                    ),
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
                TextField(
                  controller:_name,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'Name',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const Text(
                  "Mobile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  controller: _phone,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'Mobile',
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'Email',
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const Text(
                  "Father Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  controller: _father,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'Father Name',
                    prefixIcon: const Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const Text(
                  "Aadhar Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  maxLength: 16,
                  controller: _adhar,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'Aadhar Number',
                    prefixIcon: const Icon(
                      Icons.verified_user_rounded,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
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
                TextField(
                  controller: _GSTIN,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'GSTIN',
                    prefixIcon: const Icon(
                      Icons.password_rounded,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: (){
                      _addImage(_name.text,_phone.text,_email.text,_father.text,
                          _adhar.text,_GSTIN.text);
                    },
                    child: Container(
                      width: 550.w,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.all(
                          12,
                        ),
                        child: Center(
                          child:
                              _loading == false?
                          Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ):
                              Padding(
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

  var mydata;
  File? file;
  final picker = ImagePicker();
  void _choose() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 20,
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
  _addImage(
      String _name,
      String _phone,
      String _email,
      String _father,
      String _adhar,
      String _GSTIN) async {
    setState(() {
      _loading = true;
    });

    print(mydata);
    print('ggggggggggggg');

    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    // Define the endpoint URL
    final url = Uri.parse(Apiconst.farmereditpro);

    // Create a new multipart request
    final request = http.MultipartRequest('POST', url);

    // Add the form fields
    request.fields['userid'] = '$userid';
    request.fields['name'] = _name;
    request.fields['email'] = _email;
    request.fields['fathername'] = _father;
    request.fields['phone'] = _phone;
    request.fields['aadhar'] = _adhar;
    request.fields['gstin'] = _GSTIN;
    request.fields['profileimage']="$mydata";
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
