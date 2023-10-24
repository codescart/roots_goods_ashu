import 'package:flutter/material.dart';

class Ridersss extends StatefulWidget {
  const Ridersss({super.key});

  @override
  State<Ridersss> createState() => _RidersssState();
}

class _RidersssState extends State<Ridersss> {
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
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: double.infinity,
            child: const Text(
              "Matching Ride Giver",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      )),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(9),
                      child: Text(
                        "Nearby  Drivers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/driver.jpg",
                      ),
                    ),
                  ),
                  title: Row(
                    children: const [
                      Text(
                        'Mr. Niitesh Guupta',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.verified,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  subtitle: Row(
                    children: const [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      Text('4.8  (293)'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.car_rental,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    "Marathali,Lucknow,Uttar pradesh, India,",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    "Gomti nagar,Hosur Road,Uttar pradesh, India.........",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.alarm,
                            color: Colors.blue,
                          ),
                          Text(
                            "16:28 Time",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Icon(
                            Icons.chat,
                            color: Colors.red,
                          ),
                          Text(
                            "94% OnTime",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Icon(
                            Icons.pin_drop,
                            color: Colors.blue,
                          ),
                          Text(
                            "56  points",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                          ),
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(
                              9,
                            ),
                            child: Text(
                              "Route",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          color: Colors.blue.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              "Decline",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                          ),
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
