import 'package:admin/Master/master.dart';
import 'package:admin/Report/ticketTableReport.dart';
import 'package:admin/changePassword/changePassword.dart';
import 'package:admin/profile/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.adminId}) : super(key: key);

  final String adminId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Image.asset('assets/images/clg.jpeg').color,
      //mage(image: AssetImage('assets/images/clg.jpeg')).color,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TICKET MANAGEMENT SYSTEM',
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/clg.jpeg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Adjust the opacity here
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Center(
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
                                      const MasterHomeScreen()),
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
                              builder: (context) => const MasterHomeScreen()),
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
                          child: Center(
                            child: Text(
                              'Master',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
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
                              builder: (context) => const TicketTableReport()),
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
                            'Report',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Card(
                      shadowColor: Color.fromARGB(255, 58, 2, 156),
                      elevation: 30,
                      child: Container(
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color:
                                    const Color.fromARGB(255, 225, 223, 223))),
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
                                  builder: (context) =>
                                      const TicketTableReport()),
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
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color:
                                    const Color.fromARGB(255, 225, 223, 223))),
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
                                  builder: (context) => ChangePassword()),
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
                              builder: (context) => const ChangePassword()),
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
                          'Change Password',
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                              builder: (context) => const TicketTableReport()),
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
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
                              'Profile',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Card(
                      shadowColor: Color.fromARGB(255, 58, 2, 156),
                      elevation: 30,
                      child: Container(
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color:
                                    const Color.fromARGB(255, 225, 223, 223))),
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
                                  builder: (context) => const Profile()),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your notification logic here
        },
        child: const Icon(Icons.notifications),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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

class MasterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Screen'),
      ),
      body: const Center(
        child: Text('This is the Master Screen'),
      ),
    );
  }
}

// class ReportScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reports Screen'),
//       ),
//       body: const Center(
//         child: Text('This is the Reports Screen'),
//       ),
//     );
//   }
// }

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(
        child: Text('This is the Profile Screen'),
      ),
    );
  }
}
