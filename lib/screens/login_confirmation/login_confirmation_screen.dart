import 'dart:async';
import 'package:ecommerceapp/screens/home_page/home_screen.dart';
import 'package:ecommerceapp/app_resources/constants.dart';
import 'package:flutter/material.dart';
import '../../app_resources/lottie_animations.dart';
class LoginSuccessfulPage extends StatefulWidget{
  const LoginSuccessfulPage({super.key});

  @override
  State<LoginSuccessfulPage> createState() => _LoginSuccessfulPageState();
}


class _LoginSuccessfulPageState extends State<LoginSuccessfulPage> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds:2,),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
    });
  }
  
  
  
  @override
  Widget build(BuildContext context){
    return   SafeArea(child: Scaffold(
    body:

    Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,children:[
          loginSuccessfulPage() ,
        const SizedBox(height: 20.0,),
        const Text('Login Successful',style: kmajortextStyle,),]))
    ),);
  }
}