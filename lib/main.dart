import 'package:flutter/material.dart';
import 'package:medica_app/DataBase/database.dart';
import 'package:medica_app/model/model_bilirubine.dart';
import 'package:medica_app/model/model_clairance.dart';
import 'package:medica_app/model/model_tgo_tgp.dart';
import 'package:medica_app/ui/Result.dart';
import 'package:medica_app/ui/SplashScreen.dart';
import 'package:medica_app/ui/ajouter_medicament.dart';
import 'package:medica_app/ui/adopy_posology.dart';
import 'package:medica_app/ui/list_med.dart';
import 'package:medica_app/ui/menu.dart';
import 'package:medica_app/ui/searching_details.dart';
import 'model/model_medicament.dart';

Medicament med_det;
Medicament med_search;
List join_med;
String selected_item = null;
int selected_id;
Clairance med_clr;
Bilirubine med_bil;
Tgo_tgp med_tgo;
var db = new Dbpfe();
//liste qui va contenir la liste des medicament
List meds;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    title: "Medica",
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),

    routes: {

      Menu.id: (context) => Menu(),
      List_med.id: (context) => List_med(),
      Add_med.id: (context) => Add_med(),
      adopt_poso.id: (context) => adopt_poso(),
      Searching_details.id: (context) => Searching_details(),
      SplashScreen.id: (context) => SplashScreen(),
      Result.id: (context)=>Result(),
    },));
}
