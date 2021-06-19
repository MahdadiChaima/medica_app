
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medica_app/ui/adopy_posology.dart';
import 'package:medica_app/ui/list_med.dart';
import 'package:medica_app/widget_specifique/button_menu.dart';

class Menu extends StatelessWidget {
  //une variable n3ayttolo f main routes bah ykhalina za3ma ndiro trig mn screen l screen
  static String id = 'menu';
  @override
  Widget build(BuildContext context) {
    //tajbed size mn tel bah ki ndeclariw size ta3 7adja tet3adl 3la 7ssab kol tel
    Size size=MediaQuery.of(context).size;


    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          title: Text("Menu" ,style:TextStyle(
            fontSize: 24,)),
          backgroundColor:Color(0xffd23eac),
          centerTitle: true,
        ),
//ndiroha bah f screen na9adro nhabto
        body: ListView(

          children: [


            SizedBox(height: size.width / 7,),
            Column(
              children: [

//one button
                //pour eviter de beaucoup texte de button alors je le met d une classe qui s appele buutton_menu et puis juste je l appel et je la donne des propriete
                buildBottom(size: size,ontap:() {
                  Navigator.pushNamed(context, List_med.id);
                },label:'Liste des médicaments',img:'images/img2.png',),
                SizedBox(height: size.width/14,),
              buildBottom(size: size,ontap:() {
              Navigator.pushNamed(context, adopt_poso.id);
              },label:'Adoptation posologique',img:'images/adop.png',),

              ],
            ),

          ],
        ),
      ),
    );
  }  }

class buildBottom extends StatelessWidget {
  const buildBottom({
    Key key,
    @required this.size,@required this.ontap,@required this.label,@required this.img,
  }) : super(key: key);

  final Size size;
  final Function ontap;
  final String label,img;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap,
      child: Card(

        elevation:  10.0,
        margin: EdgeInsets.all(10.0),
        //pour radius
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(children: [   Container(
          child: Image.asset('$img',width: size.width/2,height: size.width/2,fit: BoxFit.cover, ),
        ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$label",
                style: TextStyle(
                    fontSize: 24,
                    color:Color(0xffd23eac),
                    //fontFamily: 'VarelaRound-Regular',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center

            ),
          ),],),
      ),);
  }
}

