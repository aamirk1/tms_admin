// // ignore_for_file: must_be_immutable

// import 'dart:async';

// import 'package:admin/Provider/filteration_provider.dart';
// import 'package:admin/Provider/menuUserPageProvider.dart';
// //import 'package:cloud_firestore/cloud_firestore.dart';
// //import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MenuUserPage extends StatefulWidget {
//   static const String id = 'user-page';
//   MenuUserPage({Key? key, required this.society, required this.userId})
//       : super(key: key);
//   final String society;
//   String userId;

//   @override
//   State<MenuUserPage> createState() => _MenuUserPageState();
// }

// class _MenuUserPageState extends State<MenuUserPage> {
//   final TextEditingController _controllerSociety = TextEditingController();
//   final TextEditingController _controllerForUser = TextEditingController();
//   String selectedUserId = '';
//   List<String> searchedList = [];
//   // Boolean value fro updating and setting user role in database
//   bool userExist = false;
//   List<dynamic> societyList = [];
//   List<dynamic> memberList = [];
//   List<String> assignedUserList = [];
//   int assignedUsers = 0;
//   int totalUsers = 0;
//   List<dynamic> unAssignedUserList = [];
//   int unAssignedUser = 0;
//   String selectedUserName = '';
//   List<bool> changeColorForDepo = [];
//   List<dynamic> selectedDepo = [];
//   List<dynamic> selecteddesignation = [];
//   List<dynamic> selectedCity = [];
//   List<dynamic> role = [];
//   List<bool> changeColorForRole = [];
//   List<bool> changeColorForCity = [];
//   List<bool> isRemoveDepo = [];
//   List<String> cityData = [];
//   Stream? _stream;
//   bool showError = false;
//   String errorMessage = '';
//   // bool isLoading = true;
//   bool getDepooData = false;
//   TextEditingController unAssignedUserController = TextEditingController();

//   List<String> designation = ['Admin', 'Secretary', 'Treasurer'];

//   List<String> cardTitle = [
//     'Total User',
//     'Assigned User',
//     'Unassigned User',
//   ];

//   List<Color> cardColor = [
//     const Color.fromARGB(255, 57, 177, 63),
//     const Color.fromARGB(255, 76, 123, 250),
//     const Color.fromARGB(255, 207, 45, 24),
//   ];

//   List<dynamic> depodata = [];
//   bool isProjectManager = false;

//   TextEditingController myController = TextEditingController();

//   @override
//   void initState() {
//     // getCityName().whenComplete(() => {
//     //       isLoading = false,
//     //       getCityLen(),
//     //       if (mounted) {setState(() {})}
//     //     });
//     // getDesigationLen();
//     // getTotalUsers().whenComplete(() => {
//     //       isLoading = false,
//     //       if (mounted) {setState(() {})}
//     //     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.deepPurple),
//           title: Text(widget.society),
//           backgroundColor: Colors.deepPurple,
//           // actions: [
//           //   IconButton(
//           //     padding: const EdgeInsets.only(right: 20.0),
//           //     onPressed: () {
//           //       showLogoutDialog(context);
//           //     },
//           //     icon: const Icon(
//           //       Icons.power_settings_new,
//           //       color: Colors.white,
//           //     ),
//           //   )
//           // ],
//         ),
//         body:
//             //isLoading
//             //     ? const Center(child: CircularProgressIndicator())
//             //  :
//             Container(
//                 padding: const EdgeInsets.all(5.0),
//                 width: MediaQuery.of(context).size.width * 0.98,
//                 height: MediaQuery.of(context).size.height * 0.99,
//                 child: Column(children: [
//                   // Consumer<MenuUserPageProvider>(
//                   //   builder: (context, providerValue, child) {
//                   //     return Row(
//                   //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //       children: [
//                   //         UserCard(context, totalUsers, cardTitle[0],
//                   //             cardColor[0], const //TotalUsers()
//                   //             ),
//                   //         UserCard(
//                   //             context,
//                   //             assignedUsers,
//                   //             cardTitle[1],
//                   //             cardColor[1],
//                   //             AssignedUser(society: widget.society)),
//                   //         UserCard(context, unAssignedUser, cardTitle[2],
//                   //             cardColor[2], const UnAssingedUsers()),
//                   //       ],
//                   //     );
//                   //   },
//                   // ),
//                   // const SizedBox(height: 10),
//                   // SizedBox(
//                   //   width: MediaQuery.of(context).size.width * 0.9,
//                   //   // height: MediaQuery.of(context).size.height * 0.7,
//                   //   child: StreamBuilder(
//                   //     stream: _stream,
//                   //     builder: (context, snapshot) {
//                   //       if (snapshot.hasData) {
//                   //         return SingleChildScrollView(
//                   //           child: Container(
//                   //             decoration: const BoxDecoration(
//                   //               color: Color.fromARGB(255, 63, 155, 221),
//                   //             ),
//                   //  padding: const EdgeInsets.only(left: 10.0),
//                   //    child:
//                   // getDepooData
//                   //     ? const CircularProgressIndicator()
//                   //     :
//                   Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Row(
//                           children: [
//                             Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: TextButton(
//                                   style: const ButtonStyle(
//                                       backgroundColor: MaterialStatePropertyAll(
//                                           Colors.yellow)),
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'Select Member: ',
//                                     style: TextStyle(
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black),
//                                   ),
//                                 )),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             // Consumer<MenuUserPageProvider>(
//                             //   builder: (context,
//                             //       providerValue, child) {
//                             //     return Container(
//                             //       color: Colors.white,
//                             //       height: 30,
//                             //       width: 260,
//                             //       child: TypeAheadField(
//                             //         hideOnLoading: true,
//                             //         textFieldConfiguration:
//                             //             TextFieldConfiguration(
//                             //           style: const TextStyle(
//                             //               fontSize: 10),
//                             //           controller:
//                             //               _controllerForUser,
//                             //           decoration: const InputDecoration(
//                             //               focusedBorder: OutlineInputBorder(
//                             //                   borderSide: BorderSide(
//                             //                       color: Colors
//                             //                           .black)),
//                             //               labelText:
//                             //                   'Select Member',
//                             //               labelStyle: TextStyle(
//                             //                   fontStyle:
//                             //                       FontStyle
//                             //                           .normal,
//                             //                   color: Colors
//                             //                       .black),
//                             //               border:
//                             //                   OutlineInputBorder()),
//                             //         ),
//                             //         itemBuilder: (context,
//                             //             suggestion) {
//                             //           return ListTile(
//                             //             title: Text(
//                             //               suggestion
//                             //                   .toString(),
//                             //             ),
//                             //           );
//                             //         },
//                             //         onSuggestionSelected:
//                             //             (suggestion) async {
//                             //           _controllerForUser
//                             //                   .text =
//                             //               suggestion
//                             //                   .toString();

//                                       await getDataId(
//                             //                   suggestion
//                             //                       .toString())
//                             //               .whenComplete(
//                             //                   () {});

//                             //           selectedUserName =
//                             //               suggestion
//                             //                   .toString();
//                             //           checkUserAlreadyExist(
//                             //                   selectedUserName)
//                             //               .then((value) {
//                             //             providerValue
//                             //                 .setLoadWidget(
//                             //                     true);
//                             //           });
//                             //         },
//                             //         suggestionsCallback:
//                             //             (String
//                             //                 pattern) async {
//                             //           return await getMemberList(
//                             //               pattern);
//                             //         },
//                             //       ),
//                             //     );
//                             //   },
//                             // ),
//                             const SizedBox(
//                               width: 65,
//                             ),
//                             // SizedBox(
//                             //   height: 30,
//                             //   width: 130,
//                             //   child: ElevatedButton(
//                             //     style: const ButtonStyle(
//                             //         backgroundColor:
//                             //             MaterialStatePropertyAll(
//                             //                 Colors.green)),
//                             //     onPressed: () async {
//                             //       for (int i = 0;
//                             //           i < assignedUsers;
//                             //           i++) {
//                             //         if (assignedUserList[i] ==
//                             //             selectedUserName) {
//                             //           // isDefined = true;
//                             //         }
//                             //       }

//                             //       if (selectedUserName !=
//                             //           selectedSocietyName) {
//                             //         role.isEmpty
//                             //             ? customAlertBox(
//                             //                 'Please Select Designation')
//                             //             : selectedSocietyName
//                             //                     .isEmpty
//                             //                 ? customAlertBox(
//                             //                     'Please Select Society')
//                             //                 : storeAssignData();
//                             //         getTotalUsers()
//                             //             .whenComplete(
//                             //                 () async {
//                             //           DocumentReference
//                             //               documentReference =
//                             //               FirebaseFirestore
//                             //                   .instance
//                             //                   .collection(
//                             //                       'unAssignedRole')
//                             //                   .doc(
//                             //                       selectedUserName);

//                             //           await documentReference
//                             //               .delete();

//                             //           provider.setLoadWidget(
//                             //               true);
//                             //         });
//                             //       } else if (selectedUserName
//                             //               .isEmpty &&
//                             //           selectedSocietyName
//                             //               .isEmpty) {
//                             //         customAlertBox(
//                             //             'Please Select Member and User');
//                             //       } else {
//                             //         customAlertBox(
//                             //             'Reporting Manager and User cannot be same');
//                             //       }
//                             //     },
//                             //     child: const Text(
//                             //       'Assign Role',
//                             //     ),
//                             //   ),
//                             // )
//                           ],
//                         ),
//                       ),
//                       Consumer<MenuUserPageProvider>(
//                         builder: (context, value, child) {
//                           return Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 500),
//                                 child: showError
//                                     ? Text(
//                                         errorMessage,
//                                         style:
//                                             const TextStyle(color: Colors.red),
//                                       )
//                                     : const Text(''),
//                               )
//                             ],
//                           );
//                         },
//                       ),
//                       Container(
//                         padding: const EdgeInsets.only(
//                             left: 10.0, top: 10.0, bottom: 10),
//                         child: Row(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.only(right: 10.0),
//                               child: SizedBox(
//                                 width: 130,
//                                 child: TextButton(
//                                   style: const ButtonStyle(
//                                       backgroundColor: MaterialStatePropertyAll(
//                                           Colors.yellow)),
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'Designation :',
//                                     style: TextStyle(
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Consumer<MenuUserPageProvider>(
//                               builder: (BuildContext context, providerValue,
//                                   Widget? child) {
//                                 return SizedBox(
//                                   height: 30,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.6,
//                                   child: GridView.builder(
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       shrinkWrap: true,
//                                       itemCount: designation.length,
//                                       gridDelegate:
//                                           const SliverGridDelegateWithFixedCrossAxisCount(
//                                               crossAxisCount: 6,
//                                               crossAxisSpacing: 10.0,
//                                               mainAxisSpacing: 5.0,
//                                               mainAxisExtent: 30,
//                                               childAspectRatio: 9.0),
//                                       itemBuilder: (context, index) {
//                                         return ElevatedButton(
//                                           style: ButtonStyle(
//                                               backgroundColor:
//                                                   MaterialStatePropertyAll(
//                                                       changeColorForRole[index]
//                                                           ? Colors.white
//                                                           : Colors.lightGreen)),
//                                           onPressed: () {
//                                             if (designation[index] ==
//                                                 'Others') {
//                                             } else {
//                                               if (designation[index] ==
//                                                   'Project Manager') {
//                                                 isProjectManager = true;
//                                               } else {
//                                                 isProjectManager = false;
//                                               }

//                                               changeColorForRole[index] =
//                                                   !changeColorForRole[index];
//                                               // insertSelectedRole(
//                                               //     index);
//                                               providerValue.setLoadWidget(true);
//                                             }
//                                           },
//                                           child: Text(
//                                             designation[index],
//                                             style: TextStyle(
//                                                 color: changeColorForRole[index]
//                                                     ? Colors.black
//                                                     : Colors.white,
//                                                 fontSize: 9),
//                                           ),
//                                         );
//                                       }),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ])));
//   }
//   //  return const Center(child: CircularProgressIndicator());
// }
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }

//Storing data in firebase
// // ignore: non_constant_identifier_names
// UserCard(
//     BuildContext context, int number, String title, Color color, Widget name) {
//   final menuProvider = Provider.of<MenuUserPageProvider>(context, listen: true);
//   return Column(
//     children: [
//       Container(
//         width: 300,
//         height: 100,
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: color,
//             borderRadius: const BorderRadius.all(Radius.circular(10))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(
//                 '$number',
//                 style: const TextStyle(fontSize: 18, color: Colors.white),
//               ),
//               Text(title,
//                   style: const TextStyle(fontSize: 13, color: Colors.white)),
//             ]),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return MultiProvider(providers: [
//                         ChangeNotifierProvider(
//                             create: (context) => MenuUserPageProvider()),
//                         ChangeNotifierProvider(
//                           create: (context) => FilterProviderAdmin(),
//                         )
//                       ], child: name);
//                     })).then((value) {
//                       // getTotalUsers().whenComplete(() async {
//                       //   isRemoveDepo =
//                       //       List.generate(cityData.length, (index) => true);
//                       //   errorMessage = '';
//                       //   _controllerSociety.text = '';
//                       //   _controllerForUser.text = '';
//                       //   isProjectManager = false;
//                       //   selectedDepo.clear();
//                       //   role.clear();
//                       // }
//                       // );
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: color,
//                   ),
//                   child: const Text('More Info'),
//                 ),
//                 const SizedBox(width: 10),
//                 const Icon(Icons.forward),
//               ],
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//     ],
//   );
// }

//   customAlertBox(String message) {
// //     return showDialog(
// //         context: context,
// //         builder: (context) {
// //           return AlertDialog(
// //             elevation: 10,
// //             backgroundColor: Colors.white,
// //             icon: const Icon(
// //               Icons.warning_amber,
// //               size: 45,
// //               color: Colors.red,
// //             ),
// //             title: Text(
// //               message,
// //               style: const TextStyle(
// //                   color: Colors.grey, fontSize: 14, letterSpacing: 2),
// //             ),
// //           );
// //         });
// //   }
// // }

// Widget searchWidget(String text) {
// //   return ListTile(
// //     title: Text(
// //       text.length > 4 ? text.substring(0, 4) : text,
// //       style: const TextStyle(
// //           fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
// //     ),
// //     subtitle: Text(
// //       text,
// //       maxLines: 1,
// //       overflow: TextOverflow.ellipsis,
// //       style: const TextStyle(
// //         fontWeight: FontWeight.normal,
// //         fontSize: 12,
// //         color: Colors.black26,
// //       ),
// //     ),
// //   );
// // }

import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10),
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.8,
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  color: Colors.white,
                  height: 50,
                  width: 100,
                  child: Text(
                    'Ticket:- 1',
                  ),
                ),
              ),
              Card(
                child: Text('Ticket:- 2'),
              ),
              Card(
                child: Text('Ticket:-3'),
              ),
              Card(
                child: Text('Ticket:- 4'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
