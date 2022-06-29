import 'package:center_side/statistic/statistic_page.dart';
import 'package:flutter/material.dart';
import 'dbHelper/mongodb.dart';
import 'socket_class.dart';
import 'package:center_side/sos_main_page.dart';
import 'home.dart';
import 'logIn.dart';





Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.connect();
  await my_socket.connect();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'HomePage',
      debugShowCheckedModeBanner: false,
     home:Home(),
     //  home:SOS(),
     // home:Login(),
      // home: Statistic(),

    );
  }
}
