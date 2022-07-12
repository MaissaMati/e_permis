import 'package:e_permis/back_end/export_all.dart';
import 'package:e_permis/front_end/creations/export_all.dart';
import 'package:e_permis/sc%C3%A9narisation/expert.dart';
//import 'package:e_permis/front_end/export_pages.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../back_end/gestion_lecon.dart';
import '../back_end/evaluation.dart';
//import '../instances.dart';

//______________list des dossier images___________________

final String arret_stationnement_images="assets/niveau_intermediaire/arret_stationnement/";
final String vitesse_distance_images="assets/niveau_intermediaire/vitesse_distance/";
final String circuler_images="assets/niveau_intermediaire/circuler/";

//______________list des Widget__________________________________//

Widget commentsarreter(BuildContext context) {
  return Card(
    elevation: 0.0,
    child: Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(getTranslated(context,"apperçu"),style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox (height: 30,),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(getTranslated(context,"video6" )),
            looping: true,
          ),
        ],
      ),
    ),);
}
Widget ousarreter(BuildContext context) {
  return Card(
    elevation: 0.0,
    child: Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(getTranslated(context,"apperçu"),style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox (height: 30,),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(getTranslated(context,"video7" )),
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


//----------------------------Niveau intermédiare---------------------------------------

//___________________________ thème règles générale de la route____________(Maissa)_____________

List <Partie> comment_circuler_parties=[
  Partie("circuler1","circuler2",null),
  Partie("circuler3","circuler4",circuler_images+"1.jpg"),
  Partie("vide","circuler5",circuler_images+"2.png"),
  Partie("circuler6","circuler7",null),
  Partie("vide","circuler8",circuler_images+"3.jpg"),
  Partie("circuler9","circuler10",null),
  Partie("circuler11","circuler12",null),
  Partie("circuler13","vide",null),
  Partie("circuler14","circuler15",circuler_images+"4.jpg"),
  Partie("circuler16","circuler17",circuler_images+"5.png"),
  Partie("circuler18","circuler19",circuler_images+"6.jpg"),
  Partie("circuler20","vide",null),//text2 sans 
  Partie("circuler21","circuler22",null),//text4 sans 
  Partie("circuler23","circuler24",null),// text2 sans 
  Partie("circuler25","circuler26",null),// text2 plus padding sans 
  Partie("circuler27","circuler28",circuler_images+"7.png"),//text4 image 2
  Partie("circuler29","circuler30",circuler_images+"8.png"),//text4 image 2
  Partie("circuler31","vide",null),//text2 padding sans 
  Partie("circuler32","circuler33",null),//sans text 2
  Partie("circuler34","circuler35",circuler_images+"9.png"),//text 4 image 
  Partie("circuler36","circuler37",circuler_images+"10.jpg"),//text 4 image 
];
class Comment_circuler_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      _partie_Card_sans_image(comment_circuler_parties[0],5,TextStyles.headingTextStyle,context),
      _partie_Card_image2(comment_circuler_parties[1],5,TextStyles.headingTextStyle,context),
      _partie_Card_image2(comment_circuler_parties[2],5,TextStyles.headingTextStyle3,context),
      _partie_Card_sans_image(comment_circuler_parties[3],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(comment_circuler_parties[4],5,TextStyles.headingTextStyle3,context),
      _partie_Card_sans_image(comment_circuler_parties[5],5,TextStyles.headingTextStyle,context),
      _partie_Card_sans_image(comment_circuler_parties[6],10,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(comment_circuler_parties[7],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image2(comment_circuler_parties[8],10,TextStyles.headingTextStyle4,context),
      _partie_Card_image2(comment_circuler_parties[9],10,TextStyles.headingTextStyle4,context),
      _partie_Card_image2(comment_circuler_parties[10],10,TextStyles.bodyTextStyle,context),
      _partie_Card_sans_image(comment_circuler_parties[11],10,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(comment_circuler_parties[12],10,TextStyles.headingTextStyle4,context),
      _partie_Card_sans_image(comment_circuler_parties[13],10,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(comment_circuler_parties[14],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image2(comment_circuler_parties[15],15,TextStyles.headingTextStyle4,context),
      _partie_Card_image2(comment_circuler_parties[16],15,TextStyles.headingTextStyle4,context),
      _partie_Card_sans_image(comment_circuler_parties[17],10,TextStyles.headingTextStyle4,context),
      _partie_Card_sans_image(comment_circuler_parties[18],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image(comment_circuler_parties[19],10,TextStyles.headingTextStyle4,context),
      _partie_Card_image(comment_circuler_parties[20],10,TextStyles.headingTextStyle4,context),
    ]));
  }
}
List <Question> circuler_questions=[
    Question("circuler_question1",["circuler_question2","circuler_question3"],comment_circuler,"circuler_question3",1,circuler_images+"q1.jpg"),
    Question("circuler_question4",["circuler_question5", "circuler_question6","circuler_question7"],comment_circuler,"circuler_question5",1,circuler_images+"q2.jpg"),
    Question("circuler_question8",["circuler_question9","circuler_question10"],comment_circuler,"circuler_question10",1,circuler_images+"q3.jpg"),
    Question("circuler_question11",["circuler_question12", "circuler_question13"],comment_circuler,"circuler_question13",1,circuler_images+"q4.png"),
    Question("circuler_question14",["circuler_question15","circuler_question16"],comment_circuler,"circuler_question15",1,circuler_images+"q5.jpg"),
    Question("circuler_question17",["circuler_question18","circuler_question19"], comment_circuler,"circuler_question18",1,null),
    Question("circuler_question20",["circuler_question21","circuler_question22"],comment_circuler,"circuler_question22",1,null),
    Question("circuler_question23",["circuler_question24","circuler_question25"],comment_circuler,"circuler_question25",1,null),
];

List<Partie> vitesse_distance_parties=[
  Partie("vitesse1","vide",null),
  Partie("vitesse2","vitesse3",null),
  Partie("vitesse4","vitesse5",null),
  Partie("vitesse6","vide",null),
  Partie("vitesse7","vitesse8",vitesse_distance_images+"1.jpg"),
  Partie("vitesse9","vitesse10",vitesse_distance_images+"2.webp"),
  Partie("vitesse11","vitesse12",vitesse_distance_images+"3.jpg"),
  Partie("vitesse13","vitesse14",null),
  Partie("vitesse15","vide",vitesse_distance_images+"4.PNG"),
  Partie("vitesse16","vide",null),
  Partie("vitesse17","vitesse18",null),
  Partie("vitesse19","vitesse20",null),
  Partie("vitesse21","vitesse22",null),
  Partie("vitesse23","vitesse24",null),
  Partie("vitesse25","vitesse26",null),
  Partie("vide","vitesse27",null),
  Partie("vitesse28","vitesse29",vitesse_distance_images+"5.PNG")
];

class Vitesse_distance_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      _partie_Card_sans_image(vitesse_distance_parties[0],5,TextStyles.headingTextStyle,context),
      _partie_Card_sans_image(vitesse_distance_parties[1],5,TextStyles.headingTextStyle,context),
      _partie_Card_sans_image(vitesse_distance_parties[2],30,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(vitesse_distance_parties[3],5,TextStyles.headingTextStyle,context),
      _partie_Card_image2(vitesse_distance_parties[4],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image2(vitesse_distance_parties[5],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image2(vitesse_distance_parties[6],10,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(vitesse_distance_parties[7],10,TextStyles.headingTextStyle2,context),
      //_partie_Card_image(vitesse_distance_parties[8],5,TextStyles.headingTextStyle,context),
      Image(image: AssetImage(getTranslated(context,"image1"))),
      _partie_Card_sans_image(vitesse_distance_parties[9],5,TextStyles.headingTextStyle,context),
      _partie_Card_sans_image(vitesse_distance_parties[10],5,TextStyles.headingTextStyle,context),
      _partie_Card_sans_image(vitesse_distance_parties[11],30,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(vitesse_distance_parties[12],10,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(vitesse_distance_parties[13],30,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(vitesse_distance_parties[14],10,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(vitesse_distance_parties[15],0,TextStyles.headingTextStyle3,context),
      _partie_Card_sans_image(vitesse_distance_parties[16],30,TextStyles.headingTextStyle2,context),
    ]));
  }
}

List <Question> vitesse_distance_questions=[
  Question("vitesse_question1",["vitesse_question2","vitesse_question3"],vitesse_distance,"vitesse_question3",1,vitesse_distance_images+"q4.jpg"),
  Question("vitesse_question4",["vitesse_question5","vitesse_question6"],vitesse_distance,"vitesse_question5",1,null),
  Question("vitesse_question7",["vitesse_question8","vitesse_question9"],vitesse_distance,"vitesse_question9",1,null),
  Question("vitesse_question10",["vitesse_question11","vitesse_question12","vitesse_question13"],vitesse_distance,"vitesse_question13",1,null),
  Question("vitesse_question14",["vitesse_question15","vitesse_question16","vitesse_question17"],vitesse_distance,"vitesse_question16",1,null),
  Question("vitesse_question18",["vitesse_question19","vitesse_question20","vitesse_question21"],vitesse_distance,"vitesse_question19",1,null),
  Question("vitesse_question22",["vitesse_question23","vitesse_question24","vitesse_question25"],vitesse_distance,"vitesse_question24",1,null),
  Question("vitesse_question26",["vitesse_question27","vitesse_question28","vitesse_question29"],vitesse_distance,"vitesse_question28",1,null),
  Question("que_sinifie_ce_panneau",["vitesse_question30","vitesse_question31"],vitesse_distance,"vitesse_question31",1,vitesse_distance_images+"q1.jpg"),
  Question("que_sinifie_ce_panneau",["vitesse_question32","vitesse_question33"],vitesse_distance,"vitesse_question33",1,vitesse_distance_images+"q2.jpg"),
  Question("que_sinifie_ce_panneau",["vitesse_question34","vitesse_question35","vitesse_question36"],vitesse_distance,"vitesse_question34",1,vitesse_distance_images+"q3.jpg"),
  Question("que_sinifie_ce_panneau",["vitesse_question37","vitesse_question38","vitesse_question39"],vitesse_distance,"vitesse_question39",1,vitesse_distance_images+"q5.jpg"),
  Question("vitesse_question40",["vitesse_question41","vitesse_question42","vitesse_question43"],vitesse_distance,"vitesse_question43",1,null),
  Question("vitesse_question44",["vitesse_question45","vitesse_question46","vitesse_question47"],vitesse_distance,"vitesse_question46",1,null),
];

Lecon vitesse_distance= new Lecon("vitesse",vitesse_distance_parties,'assets/lecon_pics/fast.png',Niveau.INTERMIDIAIRE,Vitesse_distance_widgets());//Lecon_affichage(name:"Vitesse et Distance",list:vitesse_distance_widgets,),);
Lecon comment_circuler= new Lecon("Règles générales de circulation",comment_circuler_parties,'assets/lecon_pics/regle_g_circulation.png',Niveau.INTERMIDIAIRE,Comment_circuler_widgets());//Lecon_affichage(name:"Règles générales de circulation",list:regles_circulation_widgets,),);
//Lecon prcautions_route= new Lecon("Précaution de la route",null,null,Niveau.INTERMIDIAIRE,null);

Themee regles_generales_route= Themee(
  "Règles générales de la route",
  Niveau.INTERMIDIAIRE,
  {
    comment_circuler:circuler_questions,
    vitesse_distance:vitesse_distance_questions,
  });

//___________________________ thème arrêt et stationnement_________________(Wided)___________

List <Partie> arreter_stationner_parties=[
    Partie("arrert et stationnement25","arrert et stationnement26",null),
    Partie("arrert et stationnement27","arrert et stationnement28",null),
    Partie("arrert et stationnement30","vide",null),
    Partie("arrert et stationnement31","arrert et stationnement32",null),
    Partie("arrert et stationnement33","arrert et stationnement34",null),
    Partie("arrert et stationnement35","arrert et stationnement36",null),
    Partie("arrert et stationnement37","arrert et stationnement38",null),
    Partie("vide","arrert et stationnement39",arret_stationnement_images+"1.png"),
    Partie("vide","arrert et stationnement40",arret_stationnement_images+"2.jpg"),
    Partie("vide","arrert et stationnement41",null),
    Partie("arrert et stationnement42","arrert et stationnement43",null),
    Partie("arrert et stationnement44","arrert et stationnement45",null),
];

class Arreter_sationner_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      video(context, "video6"),
      //commentsarreter(context),
    _partie_Card_sans_image(arreter_stationner_parties[0],5,TextStyles.headingTextStyle,context),
    _partie_Card_sans_image(arreter_stationner_parties[1],10,TextStyles.headingTextStyle4,context),
    _partie_Card_sans_image(arreter_stationner_parties[2],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(arreter_stationner_parties[3],10,TextStyles.headingTextStyle4,context),
    _partie_Card_sans_image(arreter_stationner_parties[4],10,TextStyles.headingTextStyle4,context),
    _partie_Card_sans_image(arreter_stationner_parties[5],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(arreter_stationner_parties[6],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image(arreter_stationner_parties[7],10,TextStyles.headingTextStyle3,context),
    _partie_Card_image(arreter_stationner_parties[8],10,TextStyles.headingTextStyle3,context),
    _partie_Card_sans_image(arreter_stationner_parties[9],10,TextStyles.headingTextStyle3,context),
    _partie_Card_sans_image(arreter_stationner_parties[10],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(arreter_stationner_parties[11],10,TextStyles.headingTextStyle2,context),
  ]));
  }
}
List<Question> arreter_stationner_questions=[
     Question("arrert et stationnement_question_28",["arrert et stationnement_question_29","arrert et stationnement_question_30","arrert et stationnement_question_31"],arreter_stationner,"arrert et stationnement_question_30",1,arret_stationnement_images+"14.png"),
     Question("arrert et stationnement_question_32",["arrert et stationnement_question_33","arrert et stationnement_question_34"],arreter_stationner,"arrert et stationnement_question_34",1,null),
     Question("arrert et stationnement_question_35",["arrert et stationnement_question_36","arrert et stationnement_question_37"],arreter_stationner,"arrert et stationnement_question_36",1,null),
     Question("arrert et stationnement_question_38",["arrert et stationnement_question_39","arrert et stationnement_question_40","arrert et stationnement_question_41"],arreter_stationner,"arrert et stationnement_question_40",1,null),
     Question("arrert et stationnement_question_42",["arrert et stationnement_question_43","arrert et stationnement_question_44"],arreter_stationner,"",1,null),
     Question("arrert et stationnement_question_45",["arrert et stationnement_question_46","arrert et stationnement_question_47"],arreter_stationner,"arrert et stationnement_question_47",1,arret_stationnement_images+"15.jpg"),//15
     Question("arrert et stationnement_question_48",["arrert et stationnement_question_49","arrert et stationnement_question_50"],arreter_stationner,"arrert et stationnement_question_50",1,arret_stationnement_images+"16.jpg"),//16
     Question("arrert et stationnement_question_51",["arrert et stationnement_question_52","arrert et stationnement_question_53", "arrert et stationnement_question_54"],arreter_stationner,"arrert et stationnement_question_54",1,arret_stationnement_images+"17.jpg"),//17
     Question("arrert et stationnement_question_55",["arrert et stationnement_question_56","arrert et stationnement_question_57"],arreter_stationner,"arrert et stationnement_question_56",1,arret_stationnement_images+"18.jpg"),//18
     Question("arrert et stationnement_question_58",["arrert et stationnement_question_59","arrert et stationnement_question_60"],arreter_stationner,"arrert et stationnement_question_59",1,arret_stationnement_images+"19.jpg"),//19
    ];

List<Partie> stationner_reglementation_parties=[
    Partie("arrert et stationnement1","vide",null),
    Partie("arrert et stationnement2","arrert et stationnement3",null),
    Partie("arrert et stationnement4","arrert et stationnement5",arret_stationnement_images+"4.jpg"),
    Partie("arrert et stationnement6","arrert et stationnement7",arret_stationnement_images+"6.png"),
    Partie("arrert et stationnement8","arrert et stationnement9",arret_stationnement_images+"7.png"),
	  Partie("arrert et stationnement10","vide",arret_stationnement_images+"8.png"),
	  Partie("arrert et stationnement11","vide",arret_stationnement_images+"9.png"),
    Partie("arrert et stationnement12","arrert et stationnement13",null),
    Partie("arrert et stationnement14","arrert et stationnement15",null),
    Partie("arrert et stationnement16","arrert et stationnement17",arret_stationnement_images+"10.jpg"),
    Partie("arrert et stationnement18","vide",null),
    Partie("arrert et stationnement19","arrert et stationnement20",arret_stationnement_images+"11.png"),
    Partie("arrert et stationnement21","arrert et stationnement22",arret_stationnement_images+"12.png"),
    Partie("arrert et stationnement23","arrert et stationnement24",null),

];

class Stationner_reglementation_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      video(context, "video7"),
      //ousarreter(context),
    _partie_Card_sans_image(stationner_reglementation_parties[0],5,TextStyles.headingTextStyle,context),
    _partie_Card_sans_image(stationner_reglementation_parties[1],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(stationner_reglementation_parties[2],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(stationner_reglementation_parties[3],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(stationner_reglementation_parties[4],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image(stationner_reglementation_parties[5],15,TextStyles.headingTextStyle4,context),
    _partie_Card_image(stationner_reglementation_parties[6],15,TextStyles.headingTextStyle4,context),
    _partie_Card_sans_image(stationner_reglementation_parties[7],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(stationner_reglementation_parties[8],5,TextStyles.headingTextStyle,context),
    _partie_Card_image2(stationner_reglementation_parties[9],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(stationner_reglementation_parties[10],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(stationner_reglementation_parties[11],10,TextStyles.headingTextStyle4,context),
    _partie_Card_image2(stationner_reglementation_parties[12],10,TextStyles.headingTextStyle4,context),
    _partie_Card_sans_image(stationner_reglementation_parties[13],10,TextStyles.headingTextStyle4,context),
  ]));
  }
}
List<Question> stationner_reglementation_questions =[
    Question("arrert et stationnement_question_1",["arrert et stationnement_question_2","arrert et stationnement_question_3"],stationner_reglementation,"arrert et stationnement_question_3",1,null),
    Question("arrert et stationnement_question_4",["arrert et stationnement_question_5","arrert et stationnement_question_6","arrert et stationnement_question_7"],stationner_reglementation,"arrert et stationnement_question_6",1,null),
    Question("arrert et stationnement_question_8",["arrert et stationnement_question_9","arrert et stationnement_question_10"],stationner_reglementation,"arrert et stationnement_question_9",1,null),
    Question("arrert et stationnement_question_11",["arrert et stationnement_question_12","arrert et stationnement_question_13","arrert et stationnement_question_14"],stationner_reglementation,"arrert et stationnement_question_14",1,null),
    Question("arrert et stationnement_question_15",["arrert et stationnement_question_16","arrert et stationnement_question_17","arrert et stationnement_question_18"],stationner_reglementation,"arrert et stationnement_question_17",1,null),
    Question("arrert et stationnement_question_19",["arrert et stationnement_question_20","arrert et stationnement_question_21"],stationner_reglementation,"arrert et stationnement_question_21",1,null),
    Question("arrert et stationnement_question_22",["arrert et stationnement_question_23","arrert et stationnement_question_24"],stationner_reglementation,"arrert et stationnement_question_24",1,null),
    Question("arrert et stationnement_question_25",["arrert et stationnement_question_26","arrert et stationnement_question_27"],stationner_reglementation,"arrert et stationnement_question_26",1,arret_stationnement_images+"13.jpg"),
    ];


Lecon arreter_stationner= new Lecon("arreter_stationner",arreter_stationner_parties,'assets/lecon_pics/arret_station.png',Niveau.INTERMIDIAIRE,Arreter_sationner_widgets());//Lecon_affichage(name:"Ou s'arrêter ou stationner",list:arreter_stationner_widget,),);
Lecon stationner_reglementation= new Lecon("Stationnement et reglementation",arreter_stationner_parties,'assets/lecon_pics/parking-area1.png',Niveau.INTERMIDIAIRE,Stationner_reglementation_widgets());//Lecon_affichage(name:"Comment stationner  et règlementation ",list:stationner_reglementation_widgets,),);

Themee arret_stationnement= Themee(
  "arrert et stationnement",
  Niveau.INTERMIDIAIRE,
  {
    stationner_reglementation:stationner_reglementation_questions,
    arreter_stationner:arreter_stationner_questions
  });


  //_______________________________ Tests ___________________________________
  Test_Niveau testIntermd1 = new Test_Niveau(
    //indice impaire
    Niveau.INTERMIDIAIRE, 
    Niveau.EXPERT, 
    [
      vitesse_distance_questions[1],
      vitesse_distance_questions[3],
      vitesse_distance_questions[5],
      vitesse_distance_questions[7],
      vitesse_distance_questions[9],
      vitesse_distance_questions[11],
      circuler_questions[1],
      circuler_questions[3],
      circuler_questions[5],
      circuler_questions[7],

      arreter_stationner_questions[1],
      arreter_stationner_questions[3],
      arreter_stationner_questions[5],
      arreter_stationner_questions[7],
      arreter_stationner_questions[9],
      stationner_reglementation_questions[1],
      stationner_reglementation_questions[3],
      stationner_reglementation_questions[5],
      stationner_reglementation_questions[7],
      stationner_reglementation_questions[2],// question répétée
    ]
  );

    Test_Niveau testIntermd2 = new Test_Niveau(
      // indice paire
    Niveau.INTERMIDIAIRE, 
    Niveau.EXPERT, 
    [
      vitesse_distance_questions[0],
      vitesse_distance_questions[2],
      vitesse_distance_questions[4],
      vitesse_distance_questions[6],
      vitesse_distance_questions[8],
      vitesse_distance_questions[10],
      circuler_questions[0],
      circuler_questions[2],
      circuler_questions[4],
      circuler_questions[6],

      arreter_stationner_questions[0],
      arreter_stationner_questions[2],
      arreter_stationner_questions[4],
      arreter_stationner_questions[6],
      arreter_stationner_questions[8],
      stationner_reglementation_questions[0],
      stationner_reglementation_questions[2],
      stationner_reglementation_questions[4],
      stationner_reglementation_questions[6],
      stationner_reglementation_questions[3],// question répétée
    ]
  );