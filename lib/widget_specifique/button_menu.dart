import 'package:flutter/material.dart';

class button_home extends StatelessWidget {

  button_home(
      {@required this.nom_image,@required this.label, @required this.ontap});
  final String nom_image;
  final String label;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      //la methode onTap sert a fait action listener
      onTap: ontap,
      child: Card(

        elevation: 10.0,
        margin: EdgeInsets.all(10.0),
        //pour radius
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset('$nom_image',),
         Text(label,style: TextStyle(
             fontSize: size.height/40,
             color: Colors.grey.shade700,
             fontWeight: FontWeight.w500),
           textAlign: TextAlign.center,)

          ],
        ),
      ),
    );
  }
}