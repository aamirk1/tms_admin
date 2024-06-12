import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('My Profile')),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getProfile() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Usres').get();
    if (querySnapshot.docs.isNotEmpty) {
      List<String> tempData = querySnapshot.docs.map((e) => e.id).toList();
      print(tempData);
    }
  }
}
