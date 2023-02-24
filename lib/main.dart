import 'package:cwikapp/firebase_options.dart';
import 'package:cwikapp/views/pagination.dart';
import 'package:cwikapp/views/profile/tabbarview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_screen.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: ('Poppins')
      ),
      home:  const LoginScreen(),
    //  MyHomePage(title: 'Flutter Demo Home Page'),
      // Example(),
    );
  }
}


