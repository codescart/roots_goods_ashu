import 'package:flutter/material.dart';

class BoxDetails extends StatefulWidget {
  const BoxDetails({super.key});

  @override
  State<BoxDetails> createState() => _BoxDetailsState();
}

class _BoxDetailsState extends State<BoxDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: const Text(
          "Logistics",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  left: 20,
                ),
                child: Text(
                  "Order Detail",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                child: SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            'Status :',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            'Active',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                  right: 15,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 10,
                          ),
                          child: const Text(
                            'Address  of Order',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_city,
                                color: Colors.grey,
                              ),
                              Text(
                                " Gomti nagar,263/355a Anandpuram",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 35,
                            top: 15,
                          ),
                          child: Text(
                            "Mobile No: 123456789",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 30,
                            top: 20,
                            bottom: 10,
                          ),
                          child: Text(
                            "Hopefully you will deliver to the  delivery location\n on the time and safely",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                  right: 15,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 10,
                          ),
                          child: const Text(
                            'Pick up',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_city,
                                color: Colors.grey,
                              ),
                              Text(
                                "Gomti nagar,263/355a Anandpuram",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 35,
                            top: 15,
                          ),
                          child: Text(
                            "Mobile No: 123456789",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 30,
                            top: 20,
                            bottom: 10,
                          ),
                          child: Text(
                            "Hopefully you will deliver to the  delivery location\n on the time and safely",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 30,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            "Weight : 12 kg",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 30,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            "Distance : 55 km",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 30,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            "Price : ₹ 10,0000",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
