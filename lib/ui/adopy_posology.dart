import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medica_app/DataBase/database.dart';
import 'package:medica_app/controller/adopt_poso_controller.dart';
import 'package:medica_app/controller/functions.dart';

import 'package:medica_app/model/model_medicament.dart';
import 'package:medica_app/ui/Result.dart';

import '../main.dart';

String b, c, t;

class adopt_poso extends StatefulWidget {
  static String id = 'adopt_poso';
  @override
  _adopt_posoState createState() => _adopt_posoState();
}

class _adopt_posoState extends State<adopt_poso> {
  var dbmanager = new Dbpfe();

  @override
  List<DropdownMenuItem> getDropDownItem() {
    //es val initiale de text field
    clairance_cntrl.text = '0';
    bilurbine_cntrl.text = '0';
    tgo_cntrl.text = '0';
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (int i = 0; i < meds.length; i++) {
      //  extrait le nom de chaque objet comme dans list screen

      String currency = Medicament.fromMap(meds[i]).nom_med;
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitems.add(newItem);
    }
    return dropdownitems;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffd23eac),
          title: Text('Adoptation posologique'),
        ),
        body: ListView(
          children: [
            SizedBox(height: size.height / 30),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Le poids',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 3,
                  )),
//O
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(25.0),
                child: FutureBuilder(
                    future: dbmanager.getAllMed(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        meds = snapshot.data;
                        return DropdownButton<String>(
                            hint: Text("Choisir"),
                            isExpanded: true,
                            dropdownColor: Colors.pink.shade400,
                            items: getDropDownItem(),
                            value: selected_item,
                            onChanged: (value) async {
                              setState(() {
                                selected_item = value;
                                print(' selected item $selected_item');
                              });
                              med_search =
                                  await dbmanager.chercherMed(selected_item);

                              med_clr = await dbmanager
                                  .getClairance(med_search.id_med);
                              med_bil = await dbmanager
                                  .getBilirubine(med_search.id_med);
                              med_tgo =
                                  await dbmanager.getTgo_tgp(med_search.id_med);
                            });
                      }
                    })),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: clairance_cntrl,
                decoration: InputDecoration(
                  labelText: 'La clairance rénale',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 3,
                  )),
//O
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: bilurbine_cntrl,
                decoration: InputDecoration(
                  labelText: 'La bilirubine',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 3,
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: tgo_cntrl,
                decoration: InputDecoration(
                  labelText: 'Tgo/Tgp',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 3,
                  )),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  c = resultat_clairance(med_clr, clairance_cntrl.text);
                  b = resultat_bilirubine(med_bil, bilurbine_cntrl.text);
                  t = resultat_tgo(med_tgo, tgo_cntrl.text);
                });

                Navigator.pushNamed(context, Result.id);
              },
              child: new Icon(
                Icons.check,
                size: 40,
              ),
              backgroundColor: Color(0xffd23eac),
              foregroundColor: Colors.white,
            )
          ],
        ));
  }
}
