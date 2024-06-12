import 'package:admin/Homescreen.dart';
import 'package:admin/Login/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? height, width;
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: height! * .5,
                  decoration: const BoxDecoration(
                      // color: Colors.blue,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue,
                            Color.fromARGB(255, 220, 137, 234)
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.home,
                      color: Colors.blue,
                      size: 40,
                    ),
                    radius: 50,
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  height: height! * .5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 120,
              child: Card(
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        'LOGIN',
                        style: TextStyle(letterSpacing: 2, fontSize: 20),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: userIdController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter you username',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter you password',
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                height: 50,
                width: 200,
                child: InkWell(
                  onTap: () {
                    login(userIdController.text, passwordController.text);
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Log in',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              // child: ElevatedButton(
              //   onPressed: () {},
              //   child: const Text('Login'),
              // ),
            ),
            Positioned(
              bottom: 45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'FORGOT PASSWORD?',
                          )),
                      const SizedBox(
                        width: 110,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          child: const Text(
                            'SIGN UP',
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> login(String adminId, String password) async {
    try {
      // Fetch the user document from Firestore based on the provided username
      final userDoc = await FirebaseFirestore.instance
          .collection('admins')
          .doc(adminId)
          .get();

      if (userDoc.exists) {
        // Compare the provided password with the stored password
        final storedPassword = userDoc.data()!['password'];

        if (password == storedPassword) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Center(
                child: Text(
                  "Login Successful!",
                ),
              ),
            ),
          );
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  adminId: adminId,
                ),
              ),
              (route) => false);

          // Navigate to the home screen or perform any other necessary actions
        } else {
          // Incorrect password
          SnackBar snackBar = const SnackBar(
            backgroundColor: Colors.red,
            content: Center(child: Text('Incorrect password')),
          );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // print('Incorrect password');
        }
      } else {
        // User does not exist
        SnackBar snackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Center(child: Center(child: Text('User does not exist'))),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // print('User does not exist');
      }
    } catch (e) {
      // Error occurred
      // ignore: avoid_print
      print('Error: $e');
    }
  }
}
