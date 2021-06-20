import 'package:medica_app/DataBase/model/model_bilirubine.dart';
import 'package:medica_app/DataBase/model/model_clairance.dart';
import 'package:medica_app/DataBase/model/model_tgo_tgp.dart';
import 'package:medica_app/ui/searching_details.dart';
// les fonctions pour remplir les détails de la recherche
String remplir_clr_inf(Clairance c){
  String res;
  if(c == null){
    print('vide');
   res =null;

  }else{
    res= c.inf_30;

  }
  return res;
}
String remplir_clr_sup(Clairance c){
  String res;
  if(c == null){

    res =null;

  }else{

    res=c.sup_60;

  }
  return res;
}
String remplir_clr_entre(Clairance c){
  String res;
  if(c == null){
    print('vide');

    res =null;
  }else{

    res = c.entre_30_60;
  }
  return res;
}
String remplir_bil_inf(Bilirubine b,) {
  String res;
  if (b == null) {
    res =null;
  } else {
    res =  b.inf_60;
  }
  return res;
}
String remplir_bil_sup(Bilirubine b,){
  String res;
  if(b == null){

    res =null;

  }else{

    res =b.sup_60;
  }
  return res;
}
String remplir_tgo_inf(Tgo_tgp t){String res;
if(t == null){
  res =null;


}else{
  res =t.inf_55;


}
return res;}
String remplir_tgo_sup(Tgo_tgp t){String res;
if(t == null){

  res =null;

}else{
  res = t.sup_55;

}
return res ;}
//fonction de résultat

String resultat_clairance(Clairance c,String text){
  String res;
  double val =double.parse(text);
  if(c==null){
    res =null;
  }else{
    if(val<=30){
      res=c.inf_30;
    }else{if(val >=60){
      res =c.sup_60;
    }else{
      res=c.entre_30_60;
    }
    }
  }

  return res;
}

String resultat_bilirubine(Bilirubine b,String text){
  String res;
  double val =double.parse(text);
  if(b==null){
    res =null;
  }else{
    if(val<60) {
      res = b.inf_60;
    }else {
      res = b.sup_60;
    }
  }

  return res;

}

String resultat_tgo(Tgo_tgp t,String text){
  String res;
  double val =double.parse(text);
  if(t == null){
    res =null;
  }else{
    if(val<55) {
      res = t.inf_55;
    }else {
      res = t.sup_55;
    }
  }

  return res;

}