import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart'as http;
import 'package:roots_goods/Profile/Profile.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  final img;
  final name;
  final number;
  final email;
  final fname;
  final Adno;
  final Acno;
  final bank;
  final branch;
  final ifsc;
  final achn;
  EditProfile( {
    required
    this.img,
    this.name,
    this.number,
    this.email,
    this.fname,
    this.Adno,
    this.Acno,
    this.bank,
    this.branch,
    this.ifsc,
    this.achn,
  });


  @override
  State<EditProfile> createState() => _rootsgoodState();
}

class _rootsgoodState extends State<EditProfile> {

  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _father = TextEditingController();
  TextEditingController _adhar = TextEditingController();
  TextEditingController _account = TextEditingController();
  TextEditingController _bank = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _ifsc = TextEditingController();
  TextEditingController _acholdername = TextEditingController();

  view(){

    setState(() {

      _name.text = widget.name;
      _phone.text = widget.number;
      _email.text = widget.email;
      _father.text = widget.fname;
      _adhar.text = widget.Adno;
      _account.text = widget.Acno;
      _bank.text = widget.bank;
      _branch.text= widget.branch;
      _ifsc.text = widget.ifsc;
      _acholdername.text = widget.achn;

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
                        ) : CircleAvatar(
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
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Bank Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
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

                const Text(
                  "A/c Holder Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  controller: _acholdername,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'A/c Holder Name',
                    prefixIcon: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const Text(
                  "Account Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  controller: _account,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'Account number',
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
                const Text(
                  "Bank Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  controller: _bank,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'Bank Name',
                    prefixIcon: const Icon(
                      Icons.balance,
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
                  "Bank Branch Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  controller: _branch,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'Bank Branch Name',
                    prefixIcon: const Icon(
                      Icons.location_history,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const Text(
                  "IFSC",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                TextField(
                  controller: _ifsc,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    hintText: 'IFSC',
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
                  keyboardType: TextInputType.text,
                ),


                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: (){
                      _addImage(_name.text,_phone.text,_email.text,_father.text,
                      _adhar.text,_account.text,_bank.text,_branch.text,_ifsc.text,
                        _acholdername.text,
                      );
                    },
                    child: Container(
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
                      child: const Padding(
                        padding: EdgeInsets.all(
                          12,
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
      String _account,
      String _bank,
      String _branch,
      String _ifsc,
      String _acholdername
      ) async {

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
    request.fields['ifsc'] = _ifsc;
    request.fields['branchname'] = _branch;
    request.fields['accountno'] = _account;
    request.fields['bankname'] = _bank;
    request.fields['profileimage']="$mydata";
    request.fields['accounthcname']= _acholdername;
    try {
      // Send the request and get the response
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);
      print(data);
      print("merasaman");
      // Check if the request was successful
      if (data["status"] == "200") {
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
