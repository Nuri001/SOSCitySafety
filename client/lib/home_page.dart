import 'package:flutter/material.dart';
import 'texts.dart';
import 'local_data.dart';
import 'registration_page.dart';
import 'sos_main_screen.dart';
import 'splashScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading=true;
  void loadData() async{
    await data.getData();
    print("is first time?");
    print(data.first_time);
    if(data.language==1) my_texts.changeToArabic();
    if(data.language==2) my_texts.changeToHebrew();
  if(data.first_time){
    data.first_time=false;
    data.updateData();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>(const Registor())),);}
  else {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>(const SOS())),);
  }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return splashScreen();
  }
}
