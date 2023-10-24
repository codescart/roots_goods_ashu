import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:roots_goods/quality%20Parameter/certificate.dart';
import 'package:roots_goods/quality%20Parameter/uploadCertificate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QualityParameter extends StatefulWidget {
  const QualityParameter({super.key});

  @override
  State<QualityParameter> createState() => _QualityParameterState();
}

class _QualityParameterState extends State<QualityParameter> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Quality Parameters",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffA1D567),
                border: Border.all(
                  color: const Color(0xffA1D567),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UploadCertificate(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(
                        2,
                      ),
                      child: Icon(
                        Icons.upload_file,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        8,
                      ),
                      child: Text(
                        "Upload",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body:  ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          RefreshIndicator(
            onRefresh: () async  {
              setState(() {
                ert();
                //error
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.75,
              child: FutureBuilder<List<quality>>(
                  future: ert(),
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
                    else
                    return
                         ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: false,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return  InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  farmercertificateupload(snapshot.data![index])));
                          },
                          child: Card(
                            elevation: 5,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.all(8.0),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          snapshot.data![index].images==''? Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomLeft: Radius.circular(15)),

                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                 AssetImage('assets/noimg.png')
                                                )
                                            ),
                                            height: 85,
                                            width: 100,
                                          ):
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomLeft: Radius.circular(15)),

                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                  NetworkImage(
                                                   Apiconst.imgurl+"${snapshot.data![index].images}",
                                                  ),
                                                )
                                            ),
                                            height: 85,
                                            width: 100,
                                          ),
                                          Positioned(
                                              bottom: -18.r,
                                              right: -35.r,
                                              child:
                                              Container(
                                                height: 80.r,
                                                width: 80.r,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage("${snapshot.data![index].status}"=='0'?'assets/Verified.png':"${snapshot.data![index].status}"=='1'?
                                                      'assets/pending.png':'assets/reject.png'
                                                      ),
                                                    )
                                                ),
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children:  [
                                              Text(
                                                "Certificate ID : ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xffD88A63),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${snapshot.data![index].Certificateid}",
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Text(
                                                "Location  : ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xffD88A63),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Container(

                                                width: 140,
                                                child: Text(
                                                  "${snapshot.data![index].location}",
                                                  maxLines: 5,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                         );}
              ),
            ),
          ),


        ],
      ),
    );
  }

  Future<List<quality>> ert() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    print(Apiconst.certificateid+'$userid');

    final response = await http.get(
      Uri.parse(Apiconst.certificateidview+'$userid'),
    );
    final jsond = json.decode(response.body)['data'];
    print('wwwwwwwwwwwwwwwwwwww');
    print(jsond);


    List<quality> allround = [];
    for (var o in jsond)  {
      quality al = quality(
        o["id"],
        o["username"],
        o["location"],
        o["image"],
        o["Certificateid"],
        o["status"]
      );

      allround.add(al);
    }
    return allround;
  }
}
class quality {
  int? id;
  String? username;
  String? location;
  String? images;
  String? Certificateid;
  String? status;
  quality(
      this.id,
      this.username,
      this.location,
      this.images,
      this.Certificateid,
      this.status,
      );

}
