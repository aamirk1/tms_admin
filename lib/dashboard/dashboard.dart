import 'package:admin/Homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.adminId});
  final String adminId;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    getTicketList().whenComplete(() {
      getdata().whenComplete(() {
        setState(() {});
      });
    });
  }

  List<String> ticketList = [];
  List<String> columnName = [
    'Report Generated\n On Date',
    'Pending For\n (Days)',
    'For Less\nThan 01 Day',
    'Between\n 01 to 07',
    'Between\n 08 to 14',
    'Between\n 15 to 21',
    'Between\n 22 to 28',
    'For More Than\n 28 Days',
  ];
  List<dynamic> rowData = [];
  String asset = '';
  String floor = '';
  String building = '';
  String room = '';
  String date = '';
  String work = '';
  String serviceProvider = '';
  // String remark = '';
  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String day = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.purple, Colors.deepPurple])),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.99,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text(
                  //   'Ticket Raised On ${DateTime.now().toString()}',
                  //   style: const TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width * 0.99,
                      child: DataTable2(
                        minWidth: 7000,
                        border: TableBorder.all(color: Colors.black),
                        headingRowColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 84, 1, 99)),
                        headingTextStyle: const TextStyle(
                            color: Colors.white, fontSize: 50.0),
                        columnSpacing: 3.0,
                        columns: List.generate(columnName.length, (index) {
                          return DataColumn2(
                            fixedWidth: 150,
                            // fixedWidth: index == 10 ? 300 : 110,
                            label: Align(
                              alignment: Alignment.center,
                              child: Text(
                                columnName[index],
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          );
                        }),
                        rows: List.generate(
                          growable: true,
                          rowData.length, //change column name to row data
                          (index1) => DataRow2(
                            cells: List.generate(columnName.length, (index2) {
                              if (index2 == 10) {
                                //serviceProvider
                                return const DataCell(TextField());
                              } else {
                                return DataCell(Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      rowData[index1][index2].toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ));
                              }
                            }),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 8.0, right: 18.0, bottom: 18),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(
                          adminId: widget.adminId,
                        ),
                      ),
                    );
                  },
                  child: const Text('Proceed')),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getTicketList() async {
    // final provider = Provider.of<AllRoomProvider>(context, listen: false);
    // provider.setBuilderList([]);
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('raisedTickets').get();
    if (querySnapshot.docs.isNotEmpty) {
      List<String> tempData = querySnapshot.docs.map((e) => e.id).toList();
      ticketList = tempData;
    }
  }

  Future<void> getdata() async {
    Map<String, dynamic> data = Map();

    for (var i = 0; i < ticketList.length; i++) {
      List<dynamic> allData = [];
      print('lll${ticketList[i]}');
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('raisedTickets')
          .doc(ticketList[i])
          .get();

      if (documentSnapshot.data() != null) {
        data = documentSnapshot.data() as Map<String, dynamic>;

        asset = data['asset'] ?? '';
        building = data['building'] ?? '';
        date = data['date'] ?? '';
        floor = data['floor'] ?? '';
        room = data['room'] ?? '';
        serviceProvider = data['serviceProvider'] ?? '';
        work = data['work'] ?? '';
        day = data['date'].toString().substring(0, 2);
      }
      // print('day $day');
      allData.add(date);
      allData.add(day);
      // Index = 2
      if (currentDate == date) {
        allData.add(ticketList.length);
      } else {
        allData.add('0');
      }

      // Index = 3
      // if (day=>7) {
      allData.add(ticketList.length);
      // } else {
      //   allData.add('0');
      // }

      // allData.add(remark);
      allData.add(floor);
      allData.add(room);
      allData.add(serviceProvider);
      allData.add(work);
      rowData.add(allData);
    }
  }
}

  // Future<void> getdata() async {
  //   Map<String, dynamic> data = Map();

  //   for (var i = 0; i < ticketList.length; i++) {
  //     List<dynamic> allData = [];
  //     print('lll${ticketList[i]}');
  //     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //         .collection('raisedTickets')
  //         .doc(ticketList[i])
  //         .get();

  //     if (documentSnapshot.data() != null) {
  //       data = documentSnapshot.data() as Map<String, dynamic>;

  //       asset = data['asset'] ?? '';
  //       building = data['building'] ?? '';
  //       date = data['date'] ?? '';
  //       floor = data['floor'] ?? '';
  //       // remark = data['remark'] ?? '';
  //       room = data['room'] ?? '';
  //       serviceProvider = data['serviceProvider'] ?? '';
  //       work = data['work'] ?? '';
  //     }
  //     allData.add(asset);
  //     allData.add(building);
  //     allData.add(date);
  //     // allData.add(remark);
  //     allData.add(floor);
  //     allData.add(room);
  //     allData.add(serviceProvider);
  //     allData.add(work);
  //     rowData.add(allData);
  //   }
  // }
