 import 'package:flutter/material.dart';
 import 'package:flutter/cupertino.dart';
import 'package:medica_app/controller/repmplir_result_function.dart';
import 'package:medica_app/main.dart';
import 'package:medica_app/ui/list_med.dart';


class Searching_details  extends StatelessWidget {

  static String id = 'Detail_med';

  String clr_inf =remplir_clr_inf(med_clr);
  String clr_sup =remplir_clr_sup(med_clr);
  String clr_entre =remplir_clr_entre(med_clr);
  String bil_inf =remplir_bil_inf(med_bil);
  String bil_sup =remplir_bil_sup(med_bil);
  String tgo_inf =remplir_tgo_inf(med_tgo);
  String tgo_sup =remplir_tgo_sup(med_tgo);
  bool cl=true,bl=true,tgo=true;




  @override
  Widget build(BuildContext context) {


    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Détails de médicament'),backgroundColor: Color(0xffd23eac),
      ),
body: Center(
  child:   ListView(

    padding: EdgeInsets.all(10.0),
    children: [
      SizedBox(
        height: size.height/31,
      ),
      Text("les information :", style: TextStyle(
        fontSize: size.width/15,
        color:  Color(0xffd23eac),
        fontWeight: FontWeight.w700,

      )),
      Container(margin:EdgeInsets.only(top:12,bottom:12,right: size.width/2.1),height:size.width/140,width: size.width/3,color:Color(0xffd23eac)),


      SizedBox(
        height: size.height/31,
      ),

      clr_inf!=null?Container(child: Column(children: [ Text('La clairance rénale :',textAlign: TextAlign.center,
       style: TextStyle(
         fontSize: size.width/18,
         color:  Color(0xff31acce),
         fontWeight: FontWeight.w600,

       ),),
       SizedBox(
         height: size.height/31,
       ),
       Container(height:size.height/15,padding: EdgeInsets.only(left: 25,right: 25),width:double.infinity,decoration: BoxDecoration(color:Color(0xff54a9bf),
           borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular( 20))),child:  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[Text("Valeur", style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white)),Text("Dose à administrer", style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white)),],),
       ),
       Container(height: size.height/5,padding: EdgeInsets.all(5),
           width: double.infinity,
           decoration: BoxDecoration(color: Color(0xff96eaff),
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular( 20))),
           child: Column(

               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 SizedBox(
                   height: size.height/54,
                 ),
                 Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[ Text('Si elle est <= 30 ml/min : ',style: TextStyle(
                     fontSize: size.width/25,
                     fontWeight: FontWeight.bold
                 ),),

                   Text(' $clr_inf',style: TextStyle(
                     fontSize: size.width/25,

                   ),),]),
                 Container(margin:EdgeInsets.only(top:12,bottom:12),height:size.width/140,width: double.infinity,color:Color(0xff54a9bf)),
                 Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[ Text('Si elle est >= 60 ml/min : ',style: TextStyle(
                     fontSize: size.width/25,
                     fontWeight: FontWeight.bold
                 ),),
                   Text(' $clr_sup',style: TextStyle(
                     fontSize: size.width/25,

                   ),)]),
                 Container(margin:EdgeInsets.only(top:12,bottom:12),height:size.width/140,width: double.infinity,color:Color(0xff54a9bf)),
                 Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                   Text('Si elle est entre 30 et 60 ml/min : ',style: TextStyle(
                       fontSize: size.width/25,
                       fontWeight: FontWeight.bold
                   ),),
                   Text(' $clr_entre',style: TextStyle(
                     fontSize: size.width/25,

                   ),),
                 ])

               ])),

     ],),):Container(),
      SizedBox(
        height: size.height/31,
      ),
      bil_inf!=null?Container(child: Column(children: [ Text('La bilirubine :',textAlign: TextAlign.center,
       style: TextStyle(
         fontSize: size.width/18,
         color:  Color(0xff31acce),
         fontWeight: FontWeight.w600,
       ),),
       SizedBox(
         height: size.height/31,
       ),
       Container(height:size.height/15,padding: EdgeInsets.only(left: 25,right: 25),width:double.infinity,decoration: BoxDecoration(color:Color(0xff54a9bf),
           borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular( 20))),child:  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[Text("Valeur", style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white)),Text("Dose à administrer", style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white)),],),
       ),
       Container(height: size.height/7,padding: EdgeInsets.all(5),
           width: double.infinity,
           decoration: BoxDecoration(color: Color(0xff96eaff),
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular( 20))),
           child: Column(

               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 SizedBox(
                   height: size.height/54,
                 ),

                 Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                   Text('Si elle est < 60 : ',style: TextStyle(
                       fontSize: size.width/25,
                       fontWeight: FontWeight.bold
                   ),),
                   Text(' $bil_inf',style: TextStyle(
                     fontSize: size.width/25,

                   ),),
                 ]),
                 Container(margin:EdgeInsets.only(top:12,bottom:12),height:size.width/140,width: double.infinity,color:Color(0xff54a9bf)),
                 Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                   Text('Si elle est >= 60 :',style: TextStyle(
                       fontSize: size.width/25,
                       fontWeight: FontWeight.bold
                   ),),

                   Text(' $bil_sup',style: TextStyle(
                     fontSize: size.width/25,

                   ),),

                 ])

               ])),],),):Container(),



      SizedBox(
        height: size.height/31,
      ),
      tgo_inf!=null?Container(child:Column(children: [ Text('Tgo/Tgp :',textAlign: TextAlign.center,
       style: TextStyle(
         fontSize: size.width/18,
         color:  Color(0xff31acce),
         fontWeight: FontWeight.w600,
       ),),
       SizedBox(
         height: size.height/31,
       ),
       Container(height:size.height/15,padding: EdgeInsets.only(left: 25,right: 25),width:double.infinity,decoration: BoxDecoration(color:Color(0xff54a9bf),
           borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular( 20))),child:  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[Text("Valeur", style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white)),Text("Dose à administrer", style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white)),],),
       ),
       Container(height: size.height/7,padding: EdgeInsets.all(5),
           width: double.infinity,
           decoration: BoxDecoration(color: Color(0xff96eaff),
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular( 20))),
           child: Column(

               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 SizedBox(
                   height: size.height/54,
                 ),

                 Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                   Text('Si il est < 55 :',style: TextStyle(
                       fontSize: size.width/25,
                       fontWeight: FontWeight.bold
                   ),),
                   Text(' $tgo_inf',style: TextStyle(
                     fontSize: size.width/25,

                   ),),

                 ]),
                 Container(margin:EdgeInsets.only(top:12,bottom:12),height:size.width/140,width: double.infinity,color:Color(0xff54a9bf)),
                 Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                   Text('Si il est >= 55 : ',style: TextStyle(
                       fontSize: size.width/25,
                       fontWeight: FontWeight.bold
                   ),),
                   Text(' $tgo_sup',style: TextStyle(
                     fontSize: size.width/25,

                   ),),
                 ])

               ])),],)):Container(),

      SizedBox(
        height: size.height/31,
      ),



    ],
  ),
),
    );
  }
}
