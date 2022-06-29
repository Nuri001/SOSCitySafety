import 'package:client_side/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'socket_class.dart';
import 'splashScreen.dart';
import 'home_page.dart';
import 'sos_main_screen.dart';
import 'verify_phone_number_page.dart';


Future main() async{
  runApp(const splashScreen());
 WidgetsFlutterBinding.ensureInitialized();
 my_socket.connect();
 await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 10));
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return const MaterialApp(
        title: 'home page',
        debugShowCheckedModeBanner: false,
       home: Home(),
      //  home: splashScreen(),
       // home: verifyPhone(),
       // home:Registor(),
       // home: SOS(),


      );
  }


}