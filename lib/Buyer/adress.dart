import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:roots_goods/Buyer/quality_parameter/qualitypa.dart';
import 'package:roots_goods/constant/Constat_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Adress extends StatefulWidget {
  const Adress({super.key});

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Quality Parameters",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:   RefreshIndicator(
        onRefresh: () async  {
          setState(() {
            ert();
            //error
          });
        },
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.75,
              child: FutureBuilder<List<quality>>(
                  future: ert(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: false,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return  InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  buyercertificateupload(snapshot.data![index])));
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
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomLeft: Radius.circular(15)),


                                              image:
                                              snapshot.data![index].images==''?  DecorationImage(
                                                fit: BoxFit.fill,

                                                image: AssetImage(
                                                  'assets/placeholder.png',
                                                ),
                                              ):
                                              DecorationImage(
                                                fit: BoxFit.fill,

                                                image: NetworkImage(
                                                  Apiconst.imgurl+"${snapshot.data![index].images}",
                                                ),
                                              )
                                          ),
                                          height: 85,
                                          width: 95,
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
                                                    fontSize: 14,
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
                                                  "Farmer Name : ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xffD88A63),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Container(
                                                  width: 130,
                                                  child: Text(
                                                    "${snapshot.data![index].farmername}",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blueGrey,
                                                      fontWeight: FontWeight.bold,
                                                    ),
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
                                                    fontSize: 14,
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
                        }):Center(child: CircularProgressIndicator());
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<quality>> ert() async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.buyer_quality_parameter),
    );
    print('wwwwwwwwwwwwwwwwwwww');
    final jsond = json.decode(response.body)['data'];
    print(jsond);


    List<quality> allround = [];
    for (var o in jsond)  {
      quality al = quality(
          o["id"],
          o["farmername"],
          o["location"],
          o["image"],
          o["Certificateid"],
          o["status"],
          o["farrmerid"],
      );

      allround.add(al);
    }
    return allround;
  }
}
class quality {
  int? id;
  String? farmername;
  String? location;
  String? images;
  String? Certificateid;
  String? status;
  int? farrmerid;

  quality(
      this.id,
      this.farmername,
      this.location,
      this.images,
      this.Certificateid,
      this.status,
      this.farrmerid,
      );

}



