import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:roots_goods/constant/Constat_file.dart';





class privecy_policies extends StatefulWidget {
  const privecy_policies({Key? key}) : super(key: key);

  @override
  State<privecy_policies> createState() => _privecy_policiesState();
}

class _privecy_policiesState extends State<privecy_policies> {
  var data;
  Future<void> termsCondition() async {
    print('aaaaaaa');
    final response = await http.get(Uri.parse(Apiconst.privecy_policies)
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
          title: Text('Privacy Policies',style: TextStyle(color: Colors.black,fontSize: 40.sp),),
          centerTitle: true,


        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  physics: const BouncingScrollPhysics(),
                  child: data == null
                      ? Container()
                      : HtmlWidget(
                    data['privacy'].toString(),),
                  )
              ),

          ],
        ),
      ),
    );
  }
}
