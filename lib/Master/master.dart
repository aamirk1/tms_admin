import 'package:admin/Master/assets/listOfAsset.dart';
import 'package:admin/Master/designation/listOfDesignation.dart';
import 'package:admin/Master/itemMaster/itemMaster.dart';
import 'package:admin/Master/work/listOfWork.dart';
import 'package:admin/assignRoll/role.dart';
import 'package:flutter/material.dart';

class MasterHomeScreen extends StatefulWidget {
  const MasterHomeScreen({Key? key}) : super(key: key);

  @override
  State<MasterHomeScreen> createState() => _MasterHomeScreenState();
}

class _MasterHomeScreenState extends State<MasterHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Master',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        //  backgroundColor: Colors.deepPurple,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.purple, Colors.deepPurple])),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.power_settings_new_outlined,
                  size: 30,
                )),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // section first
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    shadowColor: Colors.deepPurple,
                    elevation: 30,
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 225, 223, 223),
                              width: 2)),
                      child: IconButton(
                        icon: const Icon(
                          Icons.supervised_user_circle_sharp,
                          size: 70,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ListOfDesignation()),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListOfDesignation()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Color.fromARGB(255, 179, 138, 248)
                          gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.deepPurple])),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Designation List',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // section second
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ItemMaster()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Color.fromARGB(255, 179, 138, 248)
                          gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.deepPurple])),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Item Master',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Card(
                    shadowColor: const Color.fromARGB(255, 58, 2, 156),
                    elevation: 30,
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 225, 223, 223))),
                      child: IconButton(
                        icon: const Icon(
                          Icons.receipt_long_outlined,
                          size: 70,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemMaster()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // section third
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    shadowColor: Colors.deepPurple,
                    elevation: 30,
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 225, 223, 223))),
                      child: IconButton(
                          icon: const Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                            size: 70,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RoleScreen()),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RoleScreen()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Color.fromARGB(255, 179, 138, 248)
                          gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.deepPurple])),
                      child: const Text(
                        'Role Assign',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // section first
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListOfAsset()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Color.fromARGB(255, 179, 138, 248)
                          gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.deepPurple])),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Assets',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Card(
                    shadowColor: const Color.fromARGB(255, 58, 2, 156),
                    elevation: 30,
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 225, 223, 223))),
                      child: IconButton(
                        icon: const Icon(
                          Icons.receipt_long_outlined,
                          size: 70,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListOfAsset()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // section first
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    shadowColor: Colors.deepPurple,
                    elevation: 30,
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 225, 223, 223),
                              width: 2)),
                      child: IconButton(
                        icon: const Icon(
                          Icons.supervised_user_circle_sharp,
                          size: 70,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListOfWork()),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListOfWork()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Color.fromARGB(255, 179, 138, 248)
                          gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.deepPurple])),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Work List',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      String text, //Color color,
      Function() onTapCallback) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Card(
        // color: color,
        child: SizedBox(
          height: 200,
          width: 200,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                text,
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
