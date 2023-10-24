import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:http/http.dart' as http;
import 'package:roots_goods/constant/Constat_file.dart';


class aboutus extends StatefulWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  var data;
  Future<void> termsCondition() async {
    print('aaaaaaa');
    final response = await http.get(Uri.parse(Apiconst.aboutus)
    );
    final datas = jsonDecode(response.body);
    print('aaaaaaaaaaaa');
    print(datas);
    if (datas['status'] == '200') {
      setState(() {
        data = datas['data'];
      });
      print(data);
    } else {}
  }

  @override
  void initState() {
    termsCondition();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          elevation: 12.r,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () {  Navigator.pop(context); },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
          title: Text('About Us',style: TextStyle(color: Colors.black,fontSize: 40.sp),),
          centerTitle: true,


        ),
        body: Tawk(
          directChatLink: 'https://rootsgoods.com/about/',
          onLoad: () {

          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        // body: Column(
        //   children: [
        //     Expanded(
        //       child: SingleChildScrollView(
        //           padding: const EdgeInsets.all(8.0),
        //           physics: const BouncingScrollPhysics(),
        //           child: data == null
        //               ? Container()
        //               : HtmlWidget(
        //             data['about'].toString(),
        //
        //           )
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
