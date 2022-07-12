import 'package:e_permis/back_end/export_all.dart';
import 'package:e_permis/front_end/creations/export_all.dart';
import 'package:e_permis/instances.dart';
//import 'package:e_permis/front_end/export_pages.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../back_end/gestion_lecon.dart';
import '../back_end/evaluation.dart';
//import '../instances.dart';

//______________list des dossier images___________________

final String croisement_images = "assets/niveau_expert/croisement/";
final String intersections_images= "assets/niveau_expert/intersections/";
final String panneaux_priorite2_images = "assets/niveau_expert/panneaux_priorite2/";
final String depassement_images="assets/niveau_expert/depassement/";

//______________list des Widget__________________________________//




Widget panneaux_priorite(BuildContext context) {
  return Card(
    elevation: 0.0,
    child: Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(getTranslated(context,"apperçu"),style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox (height: 30,),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(getTranslated(context,"video3" )),
            looping: true,
          ),
        ],
      ),
    ),);
}
Widget croisemnt(BuildContext context) {
  return Card(
    elevation: 0.0,
    child: Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(getTranslated(context,"apperçu"),style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox (height: 30,),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(getTranslated(context,"video4" )),
            looping: true,
          ),
        ],
      ),
    ),);
}
Widget depassemnt(BuildContext context) {
  return Card(
    elevation: 0.0,
    child: Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(getTranslated(context,"apperçu"),style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox (height: 30,),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(getTranslated(context,"video5" )),
            looping: true,
          ),
        ],
      ),
    ),);
}

Widget _partie_Card_sans_image(Partie partie, double p, TextStyle ts, BuildContext context){
    return Card(
      elevation: 0.0,
      child: Container(
        color: white_grey,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:p,right: 5,top:7),
            child: Text(getTranslated(context, partie.nom), style: ts)),
          Padding(
            padding: EdgeInsets.only(left:p+2,right:5,top:7),
            child: Text(getTranslated(context, partie.contenu), style: TextStyles.bodyTextStyle))
        ],)
      ),
    );
  }
  Widget _partie_Card_image(Partie partie, double p, TextStyle ts,BuildContext context){
    return Card(
      elevation: 0.0,
      child: Container(
        color: white_grey,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:p, right: 5,top:7),
            child: Text(getTranslated(context, partie.nom), style: ts)),
          Padding(
            padding: EdgeInsets.only(left:p+2,right: 5, top:7,),
            child: Text(getTranslated(context, partie.contenu), style: TextStyles.bodyTextStyle)),
          Padding( 
            padding: EdgeInsets.only(top:7),
            child:Center(child: Image(image: AssetImage(partie.image)))
          ),
        ],)
      ),
    );
  }

  Widget _partie_Card_image2(Partie partie, double p, TextStyle ts,BuildContext context ){
    return Card(
      elevation: 0.0,
      child: Container(
        color: white_grey,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:p, right: 5,top:7),
            child: Text(getTranslated(context, partie.nom), style: ts)),
          Padding( 
            padding: EdgeInsets.only(top:7),
            child:Center(child: Image(image: AssetImage(partie.image)))
          ),
          Padding(
            padding: EdgeInsets.only(left:p+2,right: 5, top:7,),
            child: Text(getTranslated(context, partie.contenu), style: TextStyles.bodyTextStyle)),

        ],)
      ),
    );
  }


//----------------------------Niveau expert---------------------------------------

//________________ thème croisement et dépassement___________________(Chaima)__________

List <Partie>croisement_parties=[
  Partie("croisement1","croisement2",croisement_images+"1.jpg"),
  Partie("croisement3","croisement4",croisement_images+"2.jpg"),
  Partie("croisement5","croisement6",croisement_images+"3.png"),
  Partie("vide","croisement7",croisement_images+"4.png"),
  Partie("vide","croisement8",croisement_images+"5.png"),
  Partie("croisement9","croisement10",croisement_images+"6.png"),
  Partie("croisement11","croisement12",null),
  Partie("croisement13","croisement14",null),
  Partie("croisement15","vide",null),
  Partie("croisement16","croisement17",croisement_images+"7.jpg"),
  Partie("croisement18","croisement19",croisement_images+"8.jpg"),
  Partie("croisement20","croisement21",null),
  Partie("croisement22","croisement23",null),
  Partie("croisement24","croisement25",null),
  Partie("croisement26","croisement27",croisement_images+"9.jpg"),
];
class Croisement_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      video(context,"video4"),
    //croisemnt(context),
  _partie_Card_image(croisement_parties[0],5,TextStyles.headingTextStyle,context),
  _partie_Card_image(croisement_parties[1],10,TextStyles.headingTextStyle2,context),
  _partie_Card_image2(croisement_parties[2],5,TextStyles.headingTextStyle2,context),
  _partie_Card_image2(croisement_parties[3],5,TextStyles.headingTextStyle3,context),
  _partie_Card_image(croisement_parties[4],5,TextStyles.headingTextStyle3,context),
  _partie_Card_image(croisement_parties[5],5,TextStyles.headingTextStyle,context),
  _partie_Card_sans_image(croisement_parties[6],5,TextStyles.headingTextStyle,context),
  _partie_Card_sans_image(croisement_parties[7],5,TextStyles.headingTextStyle,context),
  _partie_Card_sans_image(croisement_parties[8],5,TextStyles.headingTextStyle,context),
  _partie_Card_image(croisement_parties[9],10,TextStyles.headingTextStyle2,context),
  _partie_Card_image(croisement_parties[10],15,TextStyles.headingTextStyle4,context),
  _partie_Card_sans_image(croisement_parties[11],10,TextStyles.headingTextStyle2,context),
  _partie_Card_sans_image(croisement_parties[12],15,TextStyles.headingTextStyle4,context),
  _partie_Card_sans_image(croisement_parties[13],15,TextStyles.headingTextStyle4,context),
  _partie_Card_image(croisement_parties[14],15,TextStyles.headingTextStyle4,context),
  ]));
  }
}
List <Question> croisement_questions=[
  Question("croisement_question_1",["croisement_question_2","croisement_question_3"],croisement,"croisement_question_3",1,null),
  Question("croisement_question_4",["croisement_question_5","croisement_question_6"],croisement,"croisement_question_5",1,null),
  Question("croisement_question_7",["croisement_question_8","croisement_question_9","croisement_question_10","croisement_question_11"],croisement,"croisement_question_9",1,croisement_images+"3.png"),                                                                 
  Question("croisement_question_12",["croisement_question_13","croisement_question_14","croisement_question_15","croisement_question_16"],croisement,"croisement_question_13",1,croisement_images+"4.png"),                                                                        
  Question("croisement_question_17",["croisement_question_18","croisement_question_19","croisement_question_20"],croisement,"croisement_question_20",1,null),
  Question("croisement_question_21",["croisement_question_22","croisement_question_23"],croisement,"croisement_question_22",1,null),
  Question("croisement_question_24",["croisement_question_25","croisement_question_26"],croisement,"croisement_question_25",1,null),
  Question("croisement_question_27",["croisement_question_28","croisement_question_29"],croisement,"croisement_question_29",1,null),
  Question("croisement_question_30",["croisement_question_31","croisement_question_32","croisement_question_33"],croisement,"croisement_question_31",1,null),
  Question("croisement_question_34",["croisement_question_35","croisement_question_36","croisement_question_37"],croisement,"croisement_question_36",1,null),
];


List<Partie> depassement_parties=[
    Partie("depassement1","depassement2",depassement_images+'1.png'),
    Partie("depassement3","depassement4",null),
    Partie("depassement5","depassement6",depassement_images+'2.png'),
    Partie("depassement7","depassement8",null),
    Partie("depassement9","depassement10",depassement_images+'3.jpg'),
    Partie("vide","depassement11",depassement_images+"4.png"),
    Partie("vide","depassement12",depassement_images+"5.png"),
    Partie("vide","depassement13",depassement_images+"6.jpg"),
    Partie("depassement14","depassement15",depassement_images+'7.png'),
    Partie("vide","depassement16",null),
    Partie("depassement17","depassement18",depassement_images+"8.png"),
    Partie("depassement19","depassement20",depassement_images+'9.jpg'),
    Partie("depassement21","depassement22",depassement_images+'10.PNG'),
    Partie("depassement23","depassement24",depassement_images+'11.jpg')

  ];


class Depassement_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      video(context, "video5"),
      //depassemnt(context),
      _partie_Card_image(depassement_parties[0],5,TextStyles.headingTextStyle,context),
      _partie_Card_sans_image(depassement_parties[1],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(depassement_parties[2],5,TextStyles.headingTextStyle,context),
      _partie_Card_sans_image(depassement_parties[3],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(depassement_parties[4],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(depassement_parties[5],5,TextStyles.headingTextStyle3,context),
      _partie_Card_image(depassement_parties[6],5,TextStyles.headingTextStyle3,context),
      _partie_Card_image(depassement_parties[7],5,TextStyles.headingTextStyle3,context),
      _partie_Card_image(depassement_parties[8],10,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(depassement_parties[9],5,TextStyles.headingTextStyle3,context),
      _partie_Card_image(depassement_parties[10],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image(depassement_parties[11],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image(depassement_parties[12],10,TextStyles.headingTextStyle,context),
      _partie_Card_image(depassement_parties[13],10,TextStyles.headingTextStyle,context),
    ]));
  }
}
List<Question> depassement_questions=[
  Question("depassement_question_1",["depassement_question_2","depassement_question_3"],depassement,"depassement_question_2",1,null),
  Question("depassement_question_4",["depassement_question_5","depassement_question_6"],depassement,"depassement_question_5",1,depassement_images+"12.png"),
  Question("depassement_question_7",["depassement_question_8","depassement_question_9","depassement_question_10"],depassement,"depassement_question_8",1,null),
  Question("depassement_question_11",["depassement_question_12","depassement_question_13"],depassement,"depassement_question_12",1,depassement_images+"13.png"),
  Question("depassement_question_14",["depassement_question_15","depassement_question_16","depassement_question_17"],depassement,"depassement_question_16",1,null),
  Question("depassement_question_18",["depassement_question_19","depassement_question_20"],depassement,"depassement_question_20",1,depassement_images+"14.jpg"),
  Question("depassement_question_21",["depassement_question_22","depassement_question_23"],depassement,"depassement_question_23",1,depassement_images+"15.png"),
  Question("depassement_question_24",["depassement_question_25","depassement_question_26"],depassement,"depassement_question_25",1,depassement_images+"16.jpg"),
  Question("depassement_question_27",["depassement_question_28","depassement_question_29"],depassement,"depassement_question_28",1,null),
  Question("depassement_question_30",["depassement_question_31","depassement_question_32"],depassement,"depassement_question_32",1,depassement_images+"17.jpg"),
];

Lecon croisement = new Lecon("Croisement",croisement_parties,'assets/lecon_pics/croisement.jpg',Niveau.EXPERT,Croisement_widgets());//Lecon_affichage(name:"Croisement",list:croisement_widgets,),);
Lecon depassement= new Lecon("Dépassement",depassement_parties,'assets/lecon_pics/deppassement.png',Niveau.EXPERT,Depassement_widgets());//Lecon_affichage(name:"Dépassement",list:depassement_widgets,),);

Themee croisement_depassement= Themee("Croisement et dépassement",Niveau.EXPERT,
{
  croisement:croisement_questions,
  depassement:depassement_questions,
}
);

//___________________________ thème priorité_____________(Youssra)________________

List<Partie> panneaux_priorite2_parties= [
  Partie("panneaux_priorite2_1","panneaux_priorite2_2",panneaux_priorite2_images+"panneauPD1.png"),
  Partie("panneaux_priorite2_3","panneaux_priorite2_4",panneaux_priorite2_images+"panneauPD2.PNG"),
  Partie("panneaux_priorite2_5","panneaux_priorite2_6",panneaux_priorite2_images+"panneauPD3.png"),
  Partie("panneaux_priorite2_7","panneaux_priorite2_8",panneaux_priorite2_images+"panneauPD4.PNG"),
  Partie("panneaux_priorite2_9","panneaux_priorite2_10",panneaux_priorite2_images+"panneauPD5.png"),
  Partie("panneaux_priorite2_11","panneaux_priorite2_12",panneaux_priorite2_images+"panneauPD7.jpg"),
];
class Panneaux_priorite2_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      video(context, "video3"),
      //panneaux_priorite(context),
      _partie_Card_image(panneaux_priorite2_parties[0],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(panneaux_priorite2_parties[1],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(panneaux_priorite2_parties[2],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(panneaux_priorite2_parties[3],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(panneaux_priorite2_parties[4],5,TextStyles.headingTextStyle,context),
      _partie_Card_image2(panneaux_priorite2_parties[5],5,TextStyles.headingTextStyle,context),
    ]));
  }
}
List<Question> panneaux_priorite2_quetions=[
  Question("panneaux_priorite2_question_1",["panneaux_priorite2_question_2","panneaux_priorite2_question_3","panneaux_priorite2_question_4"],panneaux_priorite2,"panneaux_priorite2_question_3",1,null),
  Question("panneaux_priorite2_question_5",["panneaux_priorite2_question_6","panneaux_priorite2_question_7"],panneaux_priorite2,"panneaux_priorite2_question_6",1,panneaux_priorite2_images+"q1.png"),
  Question("panneaux_priorite2_question_8",["panneaux_priorite2_question_9","panneaux_priorite2_question_10","panneaux_priorite2_question_11"],panneaux_priorite2,"panneaux_priorite2_question_11",1,panneaux_priorite2_images+"q2.png"),
  Question("panneaux_priorite2_question_12",["panneaux_priorite2_question_13","panneaux_priorite2_question_14"],panneaux_priorite2,"panneaux_priorite2_question_14",1,panneaux_priorite2_images+"q3.png"),
  Question("panneaux_priorite2_question_15",["panneaux_priorite2_question_16","panneaux_priorite2_question_17"],panneaux_priorite2,"panneaux_priorite2_question_17",1,panneaux_priorite2_images+"q4.png"),
  Question("panneaux_priorite2_question_18",["panneaux_priorite2_question_19","panneaux_priorite2_question_20"],panneaux_priorite2,"panneaux_priorite2_question_20",1,panneaux_priorite2_images+"panneauPD2.PNG"),
  Question("panneaux_priorite2_question_21",["panneaux_priorite2_question_22","panneaux_priorite2_question_23"],panneaux_priorite2,"panneaux_priorite2_question_22",1,panneaux_priorite2_images+"q5.png"),
  Question("panneaux_priorite2_question_24",["panneaux_priorite2_question_25","panneaux_priorite2_question_26","panneaux_priorite2_question_27"],panneaux_priorite2,"panneaux_priorite2_question_27",1,panneaux_priorite2_images+"q6.png"),
  Question("panneaux_priorite2_question_28",["panneaux_priorite2_question_29","panneaux_priorite2_question_30"],panneaux_priorite2,"panneaux_priorite2_question_30",1,panneaux_priorite2_images+"q7.png"),
];


List<Partie> intersections_parties=[
  Partie("intersections1","intersections2",intersections_images+"1.jpg"),
  Partie("intersections3","vide",intersections_images+"2.jpg"),
  Partie("vide","intersections4",null),
  Partie("intersections5","intersections6",null),
  Partie("intersections7","intersections8",null),
  Partie("intersections9","vide",null)
];
class Intersections_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      video(context, "video2"),//intersection(context),
    _partie_Card_image(intersections_parties[0],5,TextStyles.headingTextStyle,context),
    _partie_Card_image(intersections_parties[1],5,TextStyles.headingTextStyle,context),
    _partie_Card_sans_image(intersections_parties[2],5,TextStyles.headingTextStyle,context),// vérifier ici 
    _partie_Card_sans_image(intersections_parties[3],5,TextStyles.headingTextStyle,context),
    _partie_Card_sans_image(intersections_parties[4],5,TextStyles.headingTextStyle,context),
    _partie_Card_sans_image(intersections_parties[5],5,TextStyles.headingTextStyle,context),
  ]));
  }
}
List<Question> intersection_questions=[
  Question("intersection_question_1",["intersection_question_2","intersection_question_3","intersection_question_4","intersection_question_5"],intersections,"intersection_question_5",1,null),
  Question("intersection_question_6",[ "intersection_question_7","intersection_question_8","intersection_question_9"],intersections,"intersection_question_7",1,intersections_images+"q1.gif"),
  Question("intersection_question_10",["intersection_question_11","intersection_question_12","intersection_question_13"],intersections,"intersection_question_11",1,intersections_images+"q2.gif"),                     
  Question("intersection_question_14",["intersection_question_15","intersection_question_16","intersection_question_17"],intersections,"intersection_question_15",1,intersections_images+"q3.gif"),
  Question("intersection_question_18",["intersection_question_19","intersection_question_20","intersection_question_21","intersection_question_22"],intersections,"intersection_question_21",1,intersections_images+"q4.gif"),
  Question("intersection_question_23",["intersection_question_24","intersection_question_25","intersection_question_26"],intersections,"intersection_question_26",1,intersections_images+"q5.gif"),
  Question("intersection_question_27",["intersection_question_28","intersection_question_29"],intersections,"intersection_question_29",1,intersections_images+"q6.gif"),                                                                              
  Question("intersection_question_30",["intersection_question_31","intersection_question_32","intersection_question_33","intersection_question_34"],intersections,"intersection_question_34",1,intersections_images+"q7.jpg"),                                                                  
  Question("intersection_question_35",["intersection_question_36","intersection_question_37"],intersections,"intersection_question_37",1,intersections_images+"q8.png"),
  Question("intersection_question_38",["intersection_question_39","intersection_question_40"],intersections,"intersection_question_40",1,intersections_images+"q9.png"),
  Question("intersection_question_41",["intersection_question_42","intersection_question_43"],intersections,"intersection_question_43",1,intersections_images+"q10.jpg"),
  Question("intersection_question_44",["intersection_question_45","intersection_question_46"],intersections,"intersection_question_46",1,intersections_images+"q11.jpg"),
  Question("intersection_question_47",["intersection_question_48","intersection_question_49"],intersections,"intersection_question_49",1,intersections_images+"q12.jpg"),
  Question("intersection_question_50",["intersection_question_51","intersection_question_52"],intersections,"intersection_question_51",1,intersections_images+"q13.jpg"),
  Question("intersection_question_53",["intersection_question_54","intersection_question_55"],intersections,"intersection_question_55",1,intersections_images+"q14.jpg"),
];
Lecon intersections= new Lecon("Intersections",intersections_parties,'assets/lecon_pics/intersections.png',Niveau.EXPERT,Intersections_widgets());//Lecon_affichage(name:"Intersections",list:intersections_widgets,));
Lecon panneaux_priorite2= new Lecon("Panneaux de priorité",panneaux_priorite2_parties,'assets/lecon_pics/stop.png',Niveau.EXPERT,Panneaux_priorite2_widgets());//Lecon_affichage(name:"Panneaux de priorité",list:panneaux_priorite_d_widgets,));

Themee priorite= Themee("Priorité",Niveau.EXPERT,
{
  intersections:intersection_questions,
  panneaux_priorite2:panneaux_priorite2_quetions,
});

//________________________________ Tests ________________________________
Test_Niveau testExpert1 = new Test_Niveau(
    //indice paire
    Niveau.DEBUTANT, 
    Niveau.INTERMIDIAIRE, 
    [
      croisement_questions[0],
      croisement_questions[2],
      croisement_questions[4],
      croisement_questions[6],
      croisement_questions[8],
      depassement_questions[0],
      depassement_questions[2],
      depassement_questions[4],
      depassement_questions[6],
      depassement_questions[8],

      panneaux_priorite2_quetions[0],
      panneaux_priorite2_quetions[2],
      panneaux_priorite2_quetions[4],
      panneaux_priorite2_quetions[6],
      intersection_questions[0],
      intersection_questions[2],
      intersection_questions[4],
      intersection_questions[6],
      intersection_questions[8],
      intersection_questions[10], 
    ]
  );

    Test_Niveau testExpert2 = new Test_Niveau(
      //indice impaire
    Niveau.DEBUTANT, 
    Niveau.INTERMIDIAIRE, 
    [
      croisement_questions[1],
      croisement_questions[3],
      croisement_questions[5],
      croisement_questions[7],
      croisement_questions[9],
      depassement_questions[1],
      depassement_questions[3],
      depassement_questions[5],
      depassement_questions[7],
      depassement_questions[9],

      panneaux_priorite2_quetions[1],
      panneaux_priorite2_quetions[3],
      panneaux_priorite2_quetions[5],
      panneaux_priorite2_quetions[7],
      intersection_questions[1],
      intersection_questions[3],
      intersection_questions[5],
      intersection_questions[7],
      intersection_questions[9],
      intersection_questions[11], 
    ]
  );
