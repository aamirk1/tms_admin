import 'package:admin/Homescreen.dart';
import 'package:admin/Master/designation/listOfDesignation.dart';
import 'package:admin/Master/itemMaster/itemMaster.dart';
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
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    shadowColor: Colors.deepPurple,
                    elevation: 30,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 225, 223, 223),
                              width: 2)),
                      child: IconButton(
                        icon: Icon(
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
                    width: 100,
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
                      width: 600,
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
                      width: 600,
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
                    width: 100,
                  ),
                  Card(
                    shadowColor: const Color.fromARGB(255, 58, 2, 156),
                    elevation: 30,
                    child: Container(
                      height: 150,
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
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    shadowColor: Colors.deepPurple,
                    elevation: 30,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Color.fromARGB(255, 225, 223, 223))),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                          size: 70,
                        ),
                        onPressed: () {
                          child:
                          _buildCard(
                              'Profile', //const Color.fromARGB(255, 149, 197, 235),
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                            );
                            print('Profile card is clicked');
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 600,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Color.fromARGB(255, 179, 138, 248)
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.deepPurple])),
                    child: const Text(
                      'Master to include: Tag Service Provider to each Work',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
        child: Container(
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