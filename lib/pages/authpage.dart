import 'package:flutter/material.dart';
import 'package:liveauction/pages/login.dart';
import 'package:liveauction/pages/register.dart';


class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {

  bool showlogin=true;

  void togglescreen(){
    setState(() {
      showlogin=!showlogin;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showlogin){
      return login(showregisterpage: togglescreen,);
    }else{
      return RegisterPage(showloginpage: togglescreen,);
    }
  }
}