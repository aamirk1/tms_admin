import 'package:admin/Master/master.dart';
import 'package:admin/Report/ticketTableReport.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
            image: AssetImage('assets/images/clg.jpeg'),
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
                        height: 150,
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
                      width: 100,
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
                        width: 600,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Color.fromARGB(255, 179, 138, 248)
                            gradient: const LinearGradient(
                                colors: [Colors.purple, Colors.deepPurple])),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Master to include: Tag Service Provider to each Work',
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
                              builder: (context) => const TicketTableReport()),
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
                            'All Ticket',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Card(
                      shadowColor: Color.fromARGB(255, 58, 2, 156),
                      elevation: 30,
                      child: Container(
                        height: 150,
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
                        height: 150,
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
                          gradient: const LinearGradient(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your notification logic here
          print('Notification button is clicked');
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
