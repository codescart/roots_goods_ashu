import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';



class buyerlivetracking extends StatefulWidget {
  final String tracking;
 buyerlivetracking({ required this.tracking});

  @override
  State<buyerlivetracking> createState() => _buyerlivetrackingState();
}

class _buyerlivetrackingState extends State<buyerlivetracking> {
  List<StepperData> stepperData = [];
  int tracker=0;


  pj(){
    setState(() {
      tracker= int.parse(widget.tracking);

    });
    stepperData.add(StepperData(

        title:
        tracker >= 0 ?
        StepperText(
           "At Source" ,

          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ): StepperText(
          "At Source" ,

          textStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle:
        tracker >= 0?
        StepperText('Logistics partner has reached the farmer\'s location'):
        StepperText(''),
        iconWidget: Container(

          decoration:  BoxDecoration(

              color:
              tracker >= 0?
              Colors.green:Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child:
          tracker >= 0?
           Icon(Icons.check, color: Colors.white,size: 15,):
          Center(child: Icon(Icons.looks_one, color: Colors.white,size: 15,)),
        )));
    stepperData.add(StepperData(

        title:
        tracker >= 1 ?
        StepperText(
          "Loaded" ,

          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ): StepperText(
          "Loaded" ,

          textStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle:
        tracker >= 1 ?
        StepperText(
             'The goods are loaded, let\'s go from here'
        ):
        StepperText(""),

        iconWidget: Container(

          decoration:  BoxDecoration(
              color:
              tracker >= 1?
              Colors.green:Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child:
          tracker >= 1?
          Icon(Icons.check, color: Colors.white,size: 15,):
          Center(child: Icon(Icons.looks_two, color: Colors.white,size: 15,)),
        )));
    stepperData.add(StepperData(

        title:
        tracker >= 2 ?
        StepperText(
          "On Road" ,

          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ): StepperText(
          "On Road" ,

          textStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle:
        tracker >= 2 ?
        StepperText("Your Goods is on the way"):
        StepperText(''),

        iconWidget: Container(

          decoration:  BoxDecoration(
              color:
              tracker >= 2?
              Colors.green:Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child:
          tracker >= 2?
          Icon(Icons.check, color: Colors.white,size: 15,):
          Center(child: Icon(Icons.looks_3_rounded, color: Colors.white,size: 15,)),
        )));
    stepperData.add(StepperData(

        title:
        tracker >= 3 ?
        StepperText(
          "Delivered" ,

          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ): StepperText(
          "Delivered" ,

          textStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),

        subtitle:
        tracker >= 3 ?
        StepperText("Goods delivered to your location"):
        StepperText(''),

        iconWidget: Container(

          decoration:  BoxDecoration(
              color: tracker >= 3?
              Colors.green:Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child:
          tracker >= 3?
          Icon(Icons.check, color: Colors.white,size: 15,):
          Center(child: Icon(Icons.looks_4, color: Colors.white,size: 15,)),
        )));
    stepperData.add(StepperData(

        title:
        tracker >= 4 ?
        StepperText(
          "Payment Recived",

          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ): StepperText(
          "Payment Recived" ,

          textStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle:
        tracker >= 4?
        StepperText(
            "your payment has been recived"
        ):StepperText(''),

        iconWidget: Container(

          decoration:  BoxDecoration(
              color:
              tracker >= 4?
              Colors.green: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child:
          tracker >= 4?
          Icon(Icons.check, color: Colors.white,size: 15,):
          Center(child: Icon(Icons.looks_5, color: Colors.white,size: 15,)),
        )));

  }



  @override
  void initState() {
    pj();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),

        ),
        title:  Text(
          "Live Tracking",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: AnotherStepper(
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              iconWidth: 20,
              iconHeight: 20,
              activeBarColor: Colors.green,
              inActiveBarColor: Colors.orange,
              inverted: false,
              verticalGap: 30,
              activeIndex: tracker,
              barThickness: 4,
            ),
          ),
        ],
      ),
    );
  }
}