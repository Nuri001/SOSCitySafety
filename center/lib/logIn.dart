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

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var islogin;
  final TextEditingController _userName= TextEditingController();
  final TextEditingController _password= TextEditingController();
  bool notFound=false;
  bool somthingWrong=false;

  void checkMng()async{
    var mng=await searchMng(_userName.text);
    if(mng!=null){
      if(mng.userName==_userName.text){
        print("ok");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => Scaffold(body: ManagerPage())
        ));
      }
      else {
        setState(() {
          somthingWrong=true;
        });
      }

    }
    else{
      setState(() {
        notFound=true;
      });
    }

  }

  void chekUser()async {
    print("chekUser1");
    print(_userName.text);
    print(_password.text);
    var user = await searchWorker(_userName.text);
    print("chekUser2");
    if(user!=null){
      if (user.password == _password.text) {
        print("ok");
        data.userName = _userName.text;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>(const SOS())),).then((_) =>
            setState(() {
              _userName.text="";
              _password.text="";

            }) );
      }
      else {
        setState(() {
          somthingWrong=true;

        });

      }


    }


    else {
      print("chekUser1");
      checkMng();
      //print("no match");}
    }

  }



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
        height:200,
        width: 300,
      )

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
        setState(() {
          notFound=false;
          somthingWrong=false;
        });
        print("Next");
        chekUser();
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
  Widget userNameTextField() =>
      Container(
        height: 100,
        width: 200,
        child: TextField(
          key:Key('userName'),
          decoration: InputDecoration(
              hintText: my_texts.UserName,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 5.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(20.0),

              ),
              fillColor: app_colors.background,
              filled: true,
              prefix: const Padding(
                padding: EdgeInsets.all(4),
              )),
          maxLines: 1,
          maxLength: 20,
          controller: _userName,
        ),
      );
  Widget passwordTextField() =>
      Container(
        height: 100,
        width: 200,
        child: TextField(
          key:Key('pass'),
          obscureText: true,
          decoration: InputDecoration(
              hintText: my_texts.password,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 5.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(20.0),

              ),
              fillColor: app_colors.background,
              filled: true,
              prefix: const Padding(
                padding: EdgeInsets.all(4),
              )),
          maxLines: 1,
          maxLength: 20,
          controller: _password,
        ),
      );
  Widget inputContainer() =>
      Container(
        height: 180,
        width: 300,
        color: app_colors.background,
        padding: EdgeInsets.all(0),
        child: Stack(children: [
          Align(
            alignment: const Alignment(0, -1), child: userNameTextField(),),
          Align(
            alignment: const Alignment(0, 1), child: passwordTextField(),),

        ],),

      );

  Widget userNotFound()=>Text(
    my_texts.userNotFond,
    style: TextStyle(color: Colors.red,fontSize: 20),
    key: Key('userNotFond'),

  );
  Widget  passOrnameWrong()=>Text(
    my_texts.userNameOrpasswordWrong,
    style: TextStyle(color: Colors.red,fontSize: 20),
    key: Key('passOrnameWrong'),

  );





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: app_colors.background,
        appBar: AppBar(
          title: Text("Login"),titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
          actions: [
            languageButton()

          ],
          backgroundColor: app_colors.app_bar_background,
          centerTitle: true,
          elevation: 6,
          automaticallyImplyLeading: false,
        ),

        body:Center(child:
        SingleChildScrollView(
          reverse: true,
          child: Column(children: [
            logo(),
            inputContainer(),
            if(notFound)  userNotFound(),
            if(somthingWrong) passOrnameWrong(),
            SizedBox(height: 10,),
            Login_Button(),


          ],),
        )

          ,)





    );
  }
}
