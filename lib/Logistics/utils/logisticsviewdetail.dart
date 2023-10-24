import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roots_goods/Logistics/home/acceptoffer.dart';

import '../model/logistic_offermodel.dart';

class Logistics_View_offer_Detail extends StatefulWidget {
 final LofferModel view;
 Logistics_View_offer_Detail(this.view);

  @override
  State<Logistics_View_offer_Detail> createState() => _View_offer_DetailState();
}

class _View_offer_DetailState extends State<Logistics_View_offer_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: const Text(
          "Offer Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
           SizedBox(
            height: 40.h,
          ),
          Padding(
            padding:  EdgeInsets.all(10.r),
            child: Card(
              elevation: 8.r,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding:  EdgeInsets.only(
                  left: 10.r,
                  top: 10.r,
                  bottom: 10.r,
                  right: 10.r,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(

                      children:  [
                        Text(
                          "Price Per KM : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD88A63),
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(width: 100.w,),
                        Text(
                         '₹  '+ widget.view.price!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff747474),
                            fontSize: 25.sp,
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          "Source Location : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD88A63),
                            fontSize: 30.sp,
                          ),
                        ),
                        Container(
                          width: 325.w,
                          child: Text(
                            widget.view.source_location!,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff747474),
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          "Destination Location : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD88A63),
                            fontSize: 30.sp,
                          ),
                        ),
                        Container(
                          width: 325.w,
                          child: Text(
                            widget.view.destination_location!,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff747474),
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children:  [
                        Text(
                          "Estimated Travel Date : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD88A63),
                            fontSize: 30.sp,
                          ),
                        ),
                        Text(
                          widget.view.traveldate!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff747474),
                            fontSize: 25.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
