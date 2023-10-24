import 'dart:io';

// import 'package:fire_uber_customer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UploadProductLogistics extends StatefulWidget {
  @override
  State<UploadProductLogistics> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UploadProductLogistics> {
  @override
  void initState() {
    // DateTime selectedDate = DateTime.now();
    super.initState();
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }
  }

  DateTime selectedDate = DateTime.now();
  // final TextEditingController name = TextEditingController();
  final TextEditingController hospital_name = TextEditingController();
  final TextEditingController doctor_name = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController date = TextEditingController();

  @override
  void dispose() {
    // name.dispose();
    hospital_name.dispose();
    doctor_name.dispose();
    subject.dispose();
    location.dispose();
    date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add Offer",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 12,
          centerTitle: true,
        ),
        //appBar
        body: Container(
          // padding: EdgeInsets.only(right: 0,left: 10),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    //contentPadding: EdgeInsets.all(20),
                    hintText: 'Price per KM',
                    prefixIcon: const Icon(
                      Icons.currency_rupee,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none //<-- SEE HERE
                        ),
                  ),
                  controller: hospital_name,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: doctor_name,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    //contentPadding: EdgeInsets.all(20),
                    prefixIcon: const Icon(
                      Icons.pin_drop,
                    ),
                    hintText: 'Source Location',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none //<-- SEE HERE
                        ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: subject,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    counter: const Offstage(),
                    //contentPadding: EdgeInsets.all(20),
                    hintText: 'Destination Location',
                    prefixIcon: const Icon(
                      Icons.pin_drop,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101))
                        .then((pickeddate) {
                      if (pickeddate != null) {
                        setState(() {
                          selectedDate = pickeddate;
                          date.text = "${selectedDate.toLocal()}".split(' ')[0];
                        });
                      }
                      return null;
                    });
                  },
                  controller: date,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_month)),
                    counter: const Offstage(),
                    //contentPadding: EdgeInsets.all(20),
                    hintText: 'Estimated Travel Date',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(
                          color: Colors.orange,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 90,
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
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ), //textform
      ),
    );
  }

  Future<void> uploadImage(
    String hospitalName,
    String doctorName,
    String subject,
    String location,
    String date,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final vals = prefs.getString('id') ?? "0";
    print(vals);

    print("vvvvvvvvv");
    var stream = http.ByteStream(filee!.openRead());
    stream.cast();
    var length = await filee!.length();
    var uri = Uri.parse("http://rocks.codescarts.com/Ubiqcure/update.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['mobile'] = "123456789";
    request.fields['hospital_name'] = hospitalName;
    request.fields['doctor_name'] = doctorName;
    request.fields['subject'] = subject;
    request.fields['date'] = date;
    request.fields["s_id"] = vals;
    var multiport = http.MultipartFile('sendimage', stream, length,
        filename: (filee!.path));
    request.files.add(multiport);
    var response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      print("aaaaaaaaaa");
    } else {
      print("bbbb");
    }
  }

  File? filee;
  final pickerr = ImagePicker();

  void _choosee() async {
    final pickedFile = await pickerr.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        filee = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // _uploadImage() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   const key = 'user_id';
  //   final userId = prefs.getString(key) ?? 0;
  //   var formData = FormData.fromMap({
  //     "id": "1",
  //     "sendimage": await MultipartFile.fromFile(filee!.path),
  //   });
  //   var response = await Dio()
  //       .post("rocks.codescarts.com/Ubiqcure/image.php", data: formData);
  //   print(response.toString());
  //   if (response.data['status'] == '200') {
  //     Fluttertoast.showToast(
  //       msg: "Update Success",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 3,
  //       backgroundColor: Colors.green,
  //       fontSize: 16.0,
  //       textColor: Colors.white,
  //     );
  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } else {}
  // }

  // _updatae(
  //   String hospitalName,
  //   String doctorName,
  //   String subject,
  //   String date,
  // ) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   const key = 'user_id';
  //   final userId = prefs.getString(key) ?? 0;
  //   final response = await http.post(
  //     Uri.parse(
  //         "https://rocks.codescarts.com/Ubiqcure/index.php/api/Mobile_app/update_hospital"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "id": "1",
  //       'hospital_name': hospitalName,
  //       'doctor_name': doctorName,
  //       'subject': subject,
  //       'date': date,
  //     }),
  //   );
  //   final data = jsonDecode(response.body);
  //   print(data);
  //   if (data['error'] == 200) {
  //     Fluttertoast.showToast(
  //         msg: "Update Success",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: data['msg'],
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }
}
