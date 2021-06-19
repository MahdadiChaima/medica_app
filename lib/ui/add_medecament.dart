import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medica_app/DataBase/database.dart';
import 'package:medica_app/controller/add_med_controller.dart';

import 'package:medica_app/model/model_bilirubine.dart';
import 'package:medica_app/model/model_clairance.dart';
import 'package:medica_app/model/model_medicament.dart';
import 'package:medica_app/model/model_tgo_tgp.dart';

class Add_med extends StatefulWidget {
  static String id = 'addMed';

  @override
  _Add_medState createState() => _Add_medState();
}

class _Add_medState extends State<Add_med> {
  bool cl = true, bl = true, tgo = true;

  String _chosenValue;

  var dbmanager = new Dbpfe();
  @override
  Widget build(BuildContext context) {
    bool insert_before = false;
    Size size = MediaQuery.of(context).size;

    int id_med;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd23eac),
        title: Text('Ajouter un médicament'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              //controller bah nhazo wach aw maktob f text field
              controller: nom_med_ctrl,
              decoration: InputDecoration(
                labelText: 'nom de médicament',
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 3,
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'La clairance rénale',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: size.width / 9),
              ),
            ),
          ),
          Container(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: clr_inf30_ctrl,
                        decoration: InputDecoration(
                          labelText: '<= 30 ml/min',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      TextField(
                        controller: clr_sup60_ctrl,
                        decoration: InputDecoration(
                          labelText: '>= 60 ml/min',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      TextField(
                        controller: clr_entre_30_60_ctrl,
                        decoration: InputDecoration(
                          labelText: 'entre 30 ml/min et 60 ml/min',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      //  FloatingActionButton(
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15.0),
                        color: Color(0xff31acce),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "sauvegarder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 24,
                          ),
                        ),
                        onPressed: () async {
                          //je fais ce texte pour insire le nom de med 1 seule fois car ici je fais pls buton pour insiréé chaque bilan seule
                          if (insert_before == false) {
                            // medicament le nom n'est pas  insiréé
                            id_med =
                                await dbmanager.insertMedicament(new Medicament(
                              nom_med_ctrl.text,
                            ));
                            print("id medicament $id_med");
                            insert_before = true;
                          }

                          //insirérer clairance
                          int id_clr = await dbmanager.insertClairance(
                              new Clairance(
                                  clr_inf30_ctrl.text,
                                  clr_sup60_ctrl.text,
                                  clr_entre_30_60_ctrl.text,
                                  id_med));
                          clr_inf30_ctrl.clear();
                          clr_sup60_ctrl.clear();
                          clr_entre_30_60_ctrl.clear();
                          print("save med clirance $id_clr");
                        },
                      )
                    ],
                  ))),
          Container(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              'La bilirubine',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width / 9),
                            ),
                          )),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      TextField(
                        controller: bil_inf60_ctrl,
                        decoration: InputDecoration(
                          labelText: '< 60 ml/min',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      TextField(
                        controller: bil_sup60_ctrl,
                        decoration: InputDecoration(
                          labelText: '>= 60 ml/min',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      // FloatingActionButton(
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15.0),
                        color: Color(0xff31acce),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "sauvegarder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 24,
                          ),
                        ),
                        onPressed: () async {
                          if (insert_before == false) {
                            // medicament le nom n'est pas  insiréé
                            id_med =
                                await dbmanager.insertMedicament(new Medicament(
                              nom_med_ctrl.text,
                            ));

                            insert_before = true;
                          }

                          int id_bil = await dbmanager.insertBilirubine(
                              new Bilirubine(bil_inf60_ctrl.text,
                                  bil_sup60_ctrl.text, id_med));
                          bil_sup60_ctrl.clear();
                          bil_inf60_ctrl.clear();
                          print("save med ulrbine $id_bil");
                        },
                      )
                    ],
                  ))),
          Container(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 30,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            'TGO/TGP',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: size.width / 9),
                          ),
                        ),
                      ),

                      TextField(
                        controller: tgo_inf55_ctrl,
                        decoration: InputDecoration(
                            focusColor: Colors.pink,
                            labelText: '< 55 ml/min',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 3,
                            )),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => tgo_inf55_ctrl.clear(),
                            )),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      TextField(
                        controller: tgo_sup55_ctrl,
                        decoration: InputDecoration(
                          labelText: '>= 55 ml/min',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 3,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      //   FloatingActionButton(
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15.0),
                        color: Color(0xff31acce),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "sauvegarder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 24,
                          ),
                        ),
                        onPressed: () async {
                          if (insert_before == false) {
                            // medicament le nom n'est pas  insiréé
                            id_med =
                                await dbmanager.insertMedicament(new Medicament(
                              nom_med_ctrl.text,
                            ));

                            insert_before = true;
                          }
                          int id_tg = await dbmanager.insertTgo_tgpe(
                              new Tgo_tgp(tgo_inf55_ctrl.text,
                                  tgo_sup55_ctrl.text, id_med));
                          tgo_sup55_ctrl.clear();
                          tgo_inf55_ctrl.clear();
                          print("save med Tgo $id_tg");
                        },
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
