import 'package:flutter/material.dart';
import 'package:client_side/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'texts.dart';


class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);


  Widget loading()=> SizedBox(
    child:CircularProgressIndicator(color:app_colors.Welcome,strokeWidth: 10,),
    height: 50,
    width: 50,

  );
  Widget logo()=>Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: const Image(
        image: AssetImage('assets/images/logo.png'),
        height: 300,
        width: 300,
      )

  );
  Widget welcome()=> DefaultTextStyle(
    style: GoogleFonts.pacifico(fontSize: 70,fontWeight: FontWeight.w300,color: app_colors.Welcome),
    child: Text(my_texts.welcome),

  );
  Widget WelcomeContainer()=>Container(
      height: 350,
      width:400,
      //  color: Colors.grey,
      child:Stack(children: [
        Align(alignment: Alignment.topCenter,child: welcome(),),
        Align(alignment: const Alignment(0.0,1),child: logo(),),



      ],)

  );

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          color: app_colors.background,
          child: Column(children: [
            const SizedBox(height:150,),
            WelcomeContainer(),
            loading(),

          ],),


        ));
  }
}