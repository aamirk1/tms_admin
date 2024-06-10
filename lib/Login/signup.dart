import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  double? height, width;

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
                top: 20,
                left: 6,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))),

            Positioned(
              bottom: 70,
              child: Card(
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.53,
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        'SIGN UP',
                        style: TextStyle(letterSpacing: 2, fontSize: 20),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'Enter your first name ',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Last name',
                          hintText: 'Enter your last name',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Mobile number',
                          hintText: 'Enter you mobile number',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
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
              bottom: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                height: 50,
                width: 200,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              // child: ElevatedButton(
              //   onPressed: () {},
              //   child: const Text('Login'),
              // ),
            ),
            // Positioned(
            //   bottom: 45,
            //   left: 30,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       TextButton(
            //           onPressed: () {},
            //           child: Text(
            //             'BACK TO LOGIN PAGE',
            //           )),
            //       // SizedBox(
            //       //   width: 110,
            //       // ),
            //       // TextButton(
            //       //     onPressed: () {},
            //       //     child: Text(
            //       //       'SIGN UP',
            //       //     ))
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
