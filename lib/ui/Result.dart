import 'package:flutter/material.dart';
import 'package:medica_app/ui/adopy_posology.dart';
class Result extends StatefulWidget {
  static String id="Result";
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Adapter la dose:",style: TextStyle(color: Colors.white),),backgroundColor:  Color(0xffd23eac),),
 body: Container(
   margin: EdgeInsets.all(20),
   child: Column(children: [
     SizedBox(
       height: size.height/5,

     ),
     Text('Le resultat : ',style: TextStyle(
       fontSize: size.width/12,color: Color(0xffd23eac),
     ),),
     SizedBox(
       height: size.height/12,

     ),
     c==null?Container():Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
       Text('La clairance rénale :',style: TextStyle(
       fontSize: size.width/18,color: Color(0xff31acce),
     ),),
       Text('$c',style: TextStyle(
         fontSize: size.width/18,
       ),),],),
     SizedBox(
       height: size.height/30,
     ),
     b==null?Container():Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
     Text('La bilrubine :',style: TextStyle(
       fontSize: size.width/22,color:Color(0xff31acce),
     ),),

     Text('$b',style:TextStyle(
       fontSize: size.width/22,
     ),)]),
     SizedBox(
       height: size.height/30,
     ),
     t==null?Container():Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
     Text('Tgo/Tgp :',style: TextStyle(
       fontSize: size.width/25,color:Color(0xff31acce),
     ),),

     Text('$t',style:TextStyle(
       fontSize: size.width/25,
     ),)]),


   ],),
 ),
    );
  }
}
