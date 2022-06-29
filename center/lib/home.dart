import 'package:flutter/material.dart';
import 'package:center_side/compount/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app.dart';
import '../compount/texts.dart';
import 'package:center_side/pages/signin_page.dart';
import 'package:center_side/uses/share_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logIn.dart';
import 'package:center_side/compount/colors.dart';
import 'package:center_side/pages/maneger.dart';
import 'package:center_side/sos_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dbHelper/worker_managment.dart';
import '../dbHelper/worker_model.dart';
import 'package:center_side/compount/texts.dart';
import 'package:center_side/uses/share_data.dart';
import 'package:center_side/dbHelper/mng_managment.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget languageButton()=> PopupMenuButton(
      color: Colors.grey,
      child: Icon(Icons.language,color:app_colors.languageButton,size: 40,) ,
      itemBuilder: (context) => [
        PopupMenuItem(
          key: Key('hebrew'),
          child: const Text("עברית"),
          value: 1,
          onTap: (){print("change to hebrew");
          setState(() {
            my_texts.changeToHebrew();
            data.language=1;
          });


          },
        ),
        PopupMenuItem(
          child: const Text("English"),
          value: 1,
          onTap: (){
            print("change to english");
            setState(() {
              my_texts.changeToEnglish();
              data.language=0;
            });


          },
        ),
        PopupMenuItem(
          child: const Text("العربية"),
          value: 1,
          onTap: (){
            print("change to english");
            setState(() {
              my_texts.changeToArabic();
              data.language=2;
            });


          },
        ),
      ]
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

  Widget Login_Button()=>Container(
    height: 100,
    width:100,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow:[
          BoxShadow(
              color: app_colors.buttom_shadow,
              blurRadius: 20,
              offset: Offset(8,5)

          ),
          BoxShadow(
              color: app_colors.buttom_shadow,
              blurRadius: 20,
              offset: Offset(-8,-5)
          ),
        ]
    ),
    child: ElevatedButton(
      key: Key('inputPhoneButton'),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>(const
        Login()) ));
      }
      ,
      child:Text("Login",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight:FontWeight.bold),),

      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
        primary: app_colors.app_bar_background,
        minimumSize:const Size(60.0, 60.0),

      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.background,
        appBar: AppBar(
          title: Text("home"),titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
          actions: [
            languageButton()

          ],
          backgroundColor: app_colors.app_bar_background,
          centerTitle: true,
          elevation: 6,
          automaticallyImplyLeading: false,
        ),

        body:Center(child:
          Column(children: [
            SizedBox(height: 50,),
            WelcomeContainer(),
           Login_Button(),

          ],)

          ,)





    );
  }
}
