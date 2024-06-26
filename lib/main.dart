import 'package:admin/dashboard/dashboard.dart';
import 'package:admin/providers/assetsProvider.dart';
import 'package:admin/providers/buildingProvider.dart';
import 'package:admin/providers/designationProvider.dart';
import 'package:admin/providers/filteration_provider.dart';
import 'package:admin/providers/floorProvider.dart';
import 'package:admin/providers/image_upload_provider.dart';
import 'package:admin/providers/menuUserPageProvider.dart';
import 'package:admin/providers/role_page_totalNum_provider.dart';
import 'package:admin/providers/roomProvider.dart';
import 'package:admin/providers/userProvider.dart';
import 'package:admin/providers/workProvider.dart';
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
        ChangeNotifierProvider(create: (context) => AllBuildingProvider()),
        ChangeNotifierProvider(create: (context) => AllAssetProvider()),
        ChangeNotifierProvider(create: (context) => AllDesignationProvider()),
        ChangeNotifierProvider(create: (context) => AllFloorProvider()),
        ChangeNotifierProvider(create: (context) => AllRoomProvider()),
        ChangeNotifierProvider(create: (context) => AllWorkProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),
        ChangeNotifierProvider(create: (context) => ImageUploadProvider()),
        ChangeNotifierProvider(create: (context) => MenuUserPageProvider()),
        ChangeNotifierProvider(create: (context) => AllUserProvider()),
        ChangeNotifierProvider(
            create: (context) => RolePageTotalNumProviderAdmin()),
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
        home: const Dashboard(adminId: 'ST8032'),
        // LoginPage(),
        // LoginPage(),
      ),
    );
  }
}
