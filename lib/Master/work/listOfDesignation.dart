import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListOfWork extends StatefulWidget {
  const ListOfWork({super.key});

  @override
  State<ListOfWork> createState() => _ListOfWorkState();
}

class _ListOfWorkState extends State<ListOfWork> {
  TextEditingController workController = TextEditingController();
  bool isLoading = true;
  List<String> workList = [];
  @override
  void initState() {
    fetchData().whenComplete(() => setState(() {
          isLoading = false;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Work'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.purple, Colors.deepPurple])),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: workList.length,
                              itemBuilder: (item, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                        title: Text(workList[index]),
                                        trailing: IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              deleteWork(workList[index]);
                                            })),
                                    const Divider(
                                      color: Colors.black,
                                    )
                                  ],
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              backgroundColor: Colors.deepPurple,
                              onPressed: () {
                                addWork();
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
    );
  }

  Future<void> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('works').get();
    if (querySnapshot.docs.isNotEmpty) {
      List<String> tempData = querySnapshot.docs.map((e) => e.id).toList();
      workList = tempData;
      print(workList);
    }
  }

  Future<void> deleteWork(String work) async {
    await FirebaseFirestore.instance.collection('works').doc(work).delete();
  }

  void addWork() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              Center(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            color: Colors.white,
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: workController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Add Work',
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(10),
                        //   child: Container(
                        //       color: Colors.white,
                        //       height: 40,
                        //       width: MediaQuery.of(context).size.width * 0.25,
                        //       child: Column(children: [
                        //         TextFormField(
                        //           expands: true,
                        //           maxLines: null,
                        //           controller: serviceProviderController,
                        //           decoration: InputDecoration(
                        //             isDense: true,
                        //             contentPadding: const EdgeInsets.symmetric(
                        //               horizontal: 10,
                        //               vertical: 8,
                        //             ),
                        //             hintText: 'Search flat no...',
                        //             hintStyle: const TextStyle(fontSize: 12),
                        //             border: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //           ),
                        //         ),
                        //       ])),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            ElevatedButton(
                                onPressed: () {
                                  storeData(workController.text)
                                      .whenComplete(() {
                                    popupmessage('Work added successfully!!');
                                  });
                                },
                                child: const Text('Save'))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  Future storeData(String work) async {
    await FirebaseFirestore.instance.collection('works').doc(work).set({
      'work': work,
    });
  }

  void popupmessage(String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: AlertDialog(
              content: Text(
                msg,
                style: const TextStyle(fontSize: 14, color: Colors.green),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      workController.clear();
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ),
          );
        });
  }
}
