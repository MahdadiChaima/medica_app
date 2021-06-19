import 'package:flutter/material.dart';

import 'menu.dart';


class SplashScreen extends StatefulWidget {  static String id = 'splashscreen';
@override
_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    //set time to load the new page

    Future.delayed(Duration(seconds: 11), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Menu()));
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body:Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        colors: [Color(0xffd23eac),Color(0xff31acce)]),
    ),
    child: Stack(
    alignment: Alignment.center,
    children: <Widget>[
    Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.centerLeft,
    colors: [Color(0xffd23eac),Color(0xff31acce)]),
    )),
    new Container(
    width:double.infinity,
    height:size.height/1.5,

    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(340),
    topLeft: Radius.circular(0),
    bottomLeft: Radius.circular(340)),
    ),
    ),
    Column(
      children: [
        SizedBox(height: size.width/2,),
        Container(
            child: Image.asset(
              "images/logo.jpg",
              width:size.width/2,
            )),
            SizedBox(height:size.width/10),
          Text(
            'Medica',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height/35,

              color: Color(0xff31acce),
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    )
    ],
    ),
    )));
  }
}
//lol