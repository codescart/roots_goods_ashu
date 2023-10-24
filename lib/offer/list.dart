import 'package:flutter/material.dart';
import 'package:roots_goods/example/makeoffer.dart';
import 'package:roots_goods/offer/offer.dart';
// ignore: prefer_typing_uninitialized_variables
import 'model.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late DatabaseHandler handler;
  late Future<List<todo>> _todo;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        _todo = getList();
      });
    });
  }

  Future<List<todo>> getList() async {
    return await handler.todos();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _todo = getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Farmer offer's",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<todo>>(
              future: _todo,
              builder:
                  (BuildContext context, AsyncSnapshot<List<todo>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final items = snapshot.data ?? <todo>[];
                  return Scrollbar(
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            direction: DismissDirection.startToEnd,
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: const Icon(Icons.delete_forever),
                            ),
                            key: ValueKey<int>(items[index].id),
                            onDismissed: (DismissDirection direction) async {
                              await handler.deletetodo(items[index].id);
                              setState(() {
                                items.remove(items[index]);
                              });
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Viewoffer(
                                      price: items[index].description,
                                      quantity: items[index].title,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: Colors.blue,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Farmer offer",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Crop : Maize",
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: const EdgeInsets.only(
                                        left: 8,
                                      ),
                                      title: Text(
                                        "Quantity : ${items[index].title}",
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 19,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Price :"
                                        "₹ ${items[index].description}",
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Status: pending",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //     left: 10,
                                    //     right: 10,
                                    //     bottom: 10,
                                    //   ),
                                    //   child: SizedBox(
                                    //     width: double.infinity,
                                    //     child: ElevatedButton(
                                    //       style: ElevatedButton.styleFrom(
                                    //         foregroundColor: Colors.white,
                                    //         backgroundColor:
                                    //             Colors.green, // foreground
                                    //       ),
                                    //       onPressed: () {
                                    //         Navigator.push(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //             builder: (context) => oofers(
                                    //               product: items[index].title,
                                    //               price: items[index]
                                    //                   .description
                                    //                   .toString(),
                                    //             ),
                                    //           ),
                                    //         );
                                    //       },
                                    //       child: const Text(
                                    //         "View upload page",
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          // ElevatedButton(onPressed: () {}, child: const Text("Done"))
        ],
      ),
    );
  }
}
