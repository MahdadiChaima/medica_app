import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medica_app/model/model_medicament.dart';
import 'package:medica_app/ui/searching_details.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../main.dart';
import 'ajouter_medicament.dart';
class List_med extends StatefulWidget {
  static String id = 'listMed';

  @override
  _List_medState createState() => _List_medState();
}

class _List_medState extends State<List_med> {


  final chercher_med_ctrl = TextEditingController();
  @override
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text(
    'Liste des médicaments',


  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    controller: chercher_med_ctrl,
                    decoration:
                    InputDecoration(hintText: 'Chercher un médicament'),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (term) async {
                      //si le med n existe pas on affiche ce alert message
                      med_search = await db.chercherMed(chercher_med_ctrl.text);

                      if (med_search == null) {
                        Alert(
                            context: context,
                            title: "Ce médicament n'existe pas",
                            desc: "vous devez le l'ajouter d'abord.")
                            .show();
                      } else {
                        selected_id = med_search.id_med;
                        print('id delectionne $selected_id');

                        med_clr = await db.getClairance(selected_id);
                        med_bil = await db.getBilirubine(selected_id);
                        med_tgo = await db.getTgo_tgp(selected_id);
                        //=========================
                        med_search=null;
                        print('exisit');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>Searching_details()));
                      }
                    },
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text(
                    'Liste des médicaments',);
                }
              });
            },
            icon: cusIcon,
          ),
        ],
        centerTitle: true,
        title: cusSearchBar,
        backgroundColor: Color(0xffd23eac),

      ),
      //pour reecrier la list view aprées chaque ajout

      body: FutureBuilder(
        future: db.getAllMed(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            meds = snapshot.data;
            return _buildlistview();
          }
          return new CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Add_med.id);
        },
        child: new Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: Color(0xffd23eac),
        foregroundColor: Colors.white,
      ),
    );
  }
}
  //la methode buildlist view
  ListView _buildlistview() {
    return ListView.builder(
        itemCount: meds == null ? 0 : meds.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            child: ListTile(
             title: Text(
               'médicament : ${Medicament.fromMap(meds[position]).nom_med}',

              ),
              onTap: ()async{
                selected_id=Medicament.fromMap(meds[position]).id_med;
                med_det = await db.getMed(selected_id);

                med_clr = await db.getClairance(selected_id);
                med_bil = await db.getBilirubine(selected_id);
                med_tgo = await db.getTgo_tgp(selected_id);
                Navigator.pushNamed(context, Searching_details.id);
              },


            ),
          );
        });
  }