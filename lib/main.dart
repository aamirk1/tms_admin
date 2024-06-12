import 'package:admin/Login/login.dart';
import 'package:admin/Provider/filteration_provider.dart';
import 'package:admin/Provider/menuUserPageProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBkbuPHD4_PccrtBBhhADQTptO_bZRRfmI",
      authDomain: "complaintmanagementsyste-151cf.firebaseapp.com",
      projectId: "complaintmanagementsyste-151cf",
      storageBucket: "complaintmanagementsyste-151cf.appspot.com",
      messagingSenderId: "658299404100",
      appId: "1:658299404100:web:32be8e502ec972ae4de111",
      measurementId: "G-NXNZL8SE02",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FilterProviderAdmin()),
        ChangeNotifierProvider(create: (context) => MenuUserPageProvider()),
        // ChangeNotifierProvider(create: (context) => SelectedRowIndexModel()),
        // ChangeNotifierProvider(create: (context) => EnergyProvider()),
        // ChangeNotifierProvider(create: (context) => AllDepoSelectProvider()),
        // ChangeNotifierProvider(create: (context) => DemandEnergyProvider()),
        // ChangeNotifierProvider(create: (context) => HoverProvider()),
        // ChangeNotifierProvider(create: (context) => CheckboxProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TMS Admin',
        theme: ThemeData(
          scrollbarTheme: const ScrollbarThemeData(
            thumbColor: MaterialStatePropertyAll(
              Colors.deepPurple,
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        //Home(),
        //LoginPage(),
      ),
    );
  }
}
