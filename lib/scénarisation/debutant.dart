import 'package:e_permis/back_end/export_all.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
//import '../front_end/export_pages.dart';
import '../back_end/export_all.dart';
import '../instances.dart';
import '../front_end/creations/export_all.dart';
import 'export_all.dart';

//______________list des dossier images___________________
final String notion_base_images="assets/niveau_debutant/notion_base/";

final String danger_images="assets/niveau_debutant/signalisation/danger/danger/";
final String passage_niveau_images = "assets/niveau_debutant/signalisation/danger/passage_niveau/";
final String temporaire_images="assets/niveau_debutant/signalisation/danger/temporaire/";
final String direction_images= "assets/niveau_debutant/signalisation/direction_indication/direction/";
final String indication_images= "assets/niveau_debutant/signalisation/direction_indication/indication/";
final String feux_images= "assets/niveau_debutant/signalisation/feux_agents/feux/";
final String agents_images = "assets/niveau_debutant/signalisation/feux_agents/agents/";
final String arret_stationnementp_images= "assets/niveau_debutant/signalisation/interdiction/arret_stationnement/";
final String fin_interdiction_images="assets/niveau_debutant/signalisation/interdiction/fin_interdiction/";
final String interdiction_images= "assets/niveau_debutant/signalisation/interdiction/interdiction/";
final String obligation_images= "assets/niveau_debutant/signalisation/obligation/";
//final String fin_obligation_images= "assets/niveau_debutant/signalisation/obligation/fin_oblig/";
final String priorite_images= "assets/niveau_debutant/signalisation/priorite/";
final String s_horizontal_images= "assets/niveau_debutant/signalisation/s_horizontal/";


//______________list des Widget__________________________________//

Widget signalist(BuildContext context) {
  return Card(
    elevation: 0.0,
    child: Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(getTranslated(context,"apperçu"),style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox (height: 30,),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(getTranslated(context,"video1" )),
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

//----------------------------Niveau débutant---------------------------------------

//___________________________ thème Notions de base_____________(Sarra)_______________

List<Partie> categorie_permis_parties=[
  Partie("categorie_permis1","vide",null),
  Partie("categorie_permis2","categorie_permis3",notion_base_images+"1.png"),
  Partie("categorie_permis4","categorie_permis5",notion_base_images+"2.png"),
  Partie("categorie_permis6","categorie_permis7",notion_base_images+"3.jpg"),
  Partie("categorie_permis8","categorie_permis9",notion_base_images+"4.png"),
  Partie("categorie_permis10","categorie_permis11",notion_base_images+"5.png"),
  Partie("categorie_permis12","categorie_permis13",notion_base_images+"6.jpg"),
  Partie("categorie_permis14","categorie_permis15",null),
  Partie("categorie_permis16","categorie_permis17",null),
];
List<Question> categorie_permis_questions=[
  Question("categorie_permis_questions1",["categorie_permis_questions2","categorie_permis_questions3","categorie_permis_questions4","categorie_permis_questions5"],categorie_permis,"categorie_permis_questions4",1,null),
  Question("categorie_permis_questions6",["categorie_permis_questions7","categorie_permis_questions8","categorie_permis_questions9","categorie_permis_questions10"],categorie_permis,"categorie_permis_questions9",1,null),
  Question("categorie_permis_questions11",["categorie_permis_questions12","categorie_permis_questions13","categorie_permis_questions14","categorie_permis_questions15"],categorie_permis,"categorie_permis_questions12",1,null),
  Question("categorie_permis_questions16",["categorie_permis_questions17","categorie_permis_questions18","categorie_permis_questions19","categorie_permis_questions20"],categorie_permis,"categorie_permis_questions17",1,null),
  Question("categorie_permis_questions21",["categorie_permis_questions22","categorie_permis_questions23","categorie_permis_questions24"],categorie_permis,"categorie_permis_questions22",1,null),
  Question("categorie_permis_questions25",["categorie_permis_questions26","categorie_permis_questions27","categorie_permis_questions28"],categorie_permis,"categorie_permis_questions28",1,null),
  Question("categorie_permis_questions29",["categorie_permis_questions30","categorie_permis_questions31","categorie_permis_questions32","categorie_permis_questions33"],categorie_permis,"categorie_permis_questions30",1,null),
  Question("categorie_permis_questions34",["categorie_permis_questions35","categorie_permis_questions36","categorie_permis_questions37","categorie_permis_questions38"],categorie_permis,"categorie_permis_questions37",1,null),
];
class Categorie_permis_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
      _partie_Card_sans_image(categorie_permis_parties[0],5,TextStyles.headingTextStyle,context),
      _partie_Card_image(categorie_permis_parties[1],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image(categorie_permis_parties[2],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image(categorie_permis_parties[3],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image(categorie_permis_parties[4],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image(categorie_permis_parties[5],10,TextStyles.headingTextStyle2,context),
      _partie_Card_image(categorie_permis_parties[6],10,TextStyles.headingTextStyle2,context),
      _partie_Card_sans_image(categorie_permis_parties[7],5,TextStyles.headingTextStyle,context),
      _partie_Card_sans_image(categorie_permis_parties[8],5,TextStyles.headingTextStyle,context),
    ]));
  }
}


List<Partie> conducteur_parties=[
  Partie("conducteur1","conducteur2",notion_base_images+"7.png"),
  Partie("conducteur3","vide",null),
  Partie("conducteur4","conducteur5",notion_base_images+"8.png"),
  Partie("conducteur6","conducteur7",null),
  Partie("conducteur8","conducteur9",null),
  Partie("conducteur10","conducteur11",null),
  Partie("conducteur12","conducteur13",null),
  Partie("conducteur14","conducteur15",null), 
  Partie("conducteur16","conducteur17",notion_base_images+"9.png"),
  Partie("conducteur18","conducteur19",null), 
  Partie("conducteur20","conducteur21",null),
];
class Conducteur_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
    _partie_Card_image(conducteur_parties[0],5,TextStyles.headingTextStyle,context),
    _partie_Card_sans_image(conducteur_parties[1],5,TextStyles.headingTextStyle,context),
    _partie_Card_image(conducteur_parties[2],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(conducteur_parties[3],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(conducteur_parties[4],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(conducteur_parties[5],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(conducteur_parties[6],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(conducteur_parties[7],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image(conducteur_parties[8],5,TextStyles.headingTextStyle,context),
    _partie_Card_sans_image(conducteur_parties[9],5,TextStyles.headingTextStyle,context),
    _partie_Card_sans_image(conducteur_parties[10],5,TextStyles.headingTextStyle,context),
  ]));
  }
}

List <Question> conducteur_questions=[     
    Question("conducteur_question1",["conducteur_question2","conducteur_question3","conducteur_question4","conducteur_question5"],conducteur,"conducteur_question3",1,null),
    Question("conducteur_question6",["conducteur_question7","conducteur_question8","conducteur_question9"],conducteur,"conducteur_question7",1,null),
    Question("conducteur_question10",["conducteur_question11","conducteur_question12"],conducteur,"conducteur_question12",1,null),
    Question("conducteur_question13",["conducteur_question14","conducteur_question15"],conducteur,"conducteur_question14",1,null),
    Question("conducteur_question16",["conducteur_question17","conducteur_question18"],conducteur,"conducteur_question17",1,null),
    Question("conducteur_question19",["conducteur_question20","conducteur_question21"],conducteur,"conducteur_question21",1,null),
    Question("conducteur_question22",["conducteur_question23","conducteur_question24","conducteur_question25"],conducteur,"conducteur_question24",1,null),
    Question("conducteur_question26",["conducteur_question27","conducteur_question28"],conducteur,"conducteur_question29",1,null),
    Question("conducteur_question30",["conducteur_question31","conducteur_question32","conducteur_question33"],conducteur,"conducteur_question31",1,null),
    Question("conducteur_question34",["conducteur_question35","conducteur_question36","conducteur_question37"],conducteur,"conducteur_question37",1,null),
    Question("conducteur_question38",["conducteur_question39","conducteur_question40","conducteur_question41","conducteur_question42"],conducteur,"conducteur_question40",1,null),
    Question("conducteur_question43",["conducteur_question44","conducteur_question45","conducteur_question46"],conducteur,"conducteur_question44",1,null),
    Question("conducteur_question47",["conducteur_question48","conducteur_question49","conducteur_question50"],conducteur,"conducteur_question48",1,null),
  ];


List<Partie> vehicule_parties=[
  Partie("vehicule1","vide",notion_base_images+"11.png"), 
  Partie("vehicule2","vide",notion_base_images+"12.PNG"),
  Partie("vehicule3","vehicule4",notion_base_images+"14.jpg"), 
  Partie("vehicule5","vehicule6",notion_base_images+"15.jpg"), 
  Partie("vehicule7","vehicule8",notion_base_images+"16.jpg"),
  Partie("vehicule9","vehicule10",notion_base_images+"17.jpg"), 
  Partie("vehicule11","vehicule12",notion_base_images+"18.jpg"), 
  Partie("vehicule13","vide",notion_base_images+"19.PNG"),
  Partie("vehicule14","vehicule15",null), 
  Partie("vehicule16","vehicule17",notion_base_images+"21.jpg"), 
  Partie("vehicule18","vehicule19",notion_base_images+"22.jpg"), 
  Partie("vehicule20","vehicule21",null), 
  Partie("vehicule22","vehicule23",null), 
  Partie("vehicule24","vehicule25",notion_base_images+"25.jpg"), 
];

class Vehicule_widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
    delegate: SliverChildListDelegate([
    _partie_Card_image(vehicule_parties[0],5,TextStyles.headingTextStyle,context),
    _partie_Card_image(vehicule_parties[1],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(vehicule_parties[2],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(vehicule_parties[3],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(vehicule_parties[4],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(vehicule_parties[5],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(vehicule_parties[6],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image(vehicule_parties[7],5,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(vehicule_parties[8],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(vehicule_parties[9],10,TextStyles.headingTextStyle2,context),
    _partie_Card_image2(vehicule_parties[10],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(vehicule_parties[11],10,TextStyles.headingTextStyle2,context),
    _partie_Card_sans_image(vehicule_parties[12],10,TextStyles.headingTextStyle2,context),
    Image(image: AssetImage(notion_base_images+"23.jpg"),),
    Image(image: AssetImage(notion_base_images+"24.jpg"),),
    _partie_Card_image(vehicule_parties[13],10,TextStyles.headingTextStyle,context),
  ]));
  }
}
List<Question> vehicule_questions=[
  Question("vehicule_question_1",["vehicule_question_2","vehicule_question_3","vehicule_question_4"],vehicule,"vehicule_question_3",1,null),
  Question("vehicule_question_5",["vehicule_question_6","vehicule_question_7","vehicule_question_8","vehicule_question_9"],vehicule,"vehicule_question_6",1,notion_base_images+"26.jpg"),
  Question("vehicule_question_10",["vehicule_question_11","vehicule_question_12","vehicule_question_13"],vehicule,"vehicule_question_13",1,null),
  Question("vehicule_question_14",["vehicule_question_15","vehicule_question_16","vehicule_question_17"],vehicule,"vehicule_question_17",1,null),
  Question("vehicule_question_18",["vehicule_question_19","vehicule_question_20","vehicule_question_21"],vehicule,"vehicule_question_21",1,null),
  Question("vehicule_question_22",["vehicule_question_23","vehicule_question_24","vehicule_question_25","vehicule_question_26"],vehicule,"vehicule_question_26",1,notion_base_images+"27.jpg"),
  Question("vehicule_question_28",["vehicule_question_29","vehicule_question_30","vehicule_question_31"],vehicule,"vehicule_question_31",1,null),
  Question("vehicule_question_32",["vehicule_question_33","vehicule_question_34","vehicule_question_35","vehicule_question_36"],vehicule,"vehicule_question_34",1,notion_base_images+"28.jpg"),
  Question("vehicule_question_38",["vehicule_question_39","vehicule_question_40","vehicule_question_41"],vehicule,"vehicule_question_40",1,null),
  Question("vehicule_question_42",["vehicule_question_43","vehicule_question_44"],vehicule,"vehicule_question_44",1,null),
  Question("vehicule_question_45",["vehicule_question_46","vehicule_question_47"],vehicule,"vehicule_question_47",1,null),
  Question("vehicule_question_48",["vehicule_question_49","vehicule_question_50"],vehicule,"vehicule_question_50",1,null),
  Question("vehicule_question_51",["vehicule_question_52", "vehicule_question_53"],vehicule,"vehicule_question_53",1,null),
  Question("vehicule_question_54",["vehicule_question_55", "vehicule_question_56"],vehicule,"vehicule_question_56",1,null),
  Question("vehicule_question_57",["vehicule_question_58","vehicule_question_59","vehicule_question_60"],vehicule,"vehicule_question_58",1,null),
  Question("vehicule_question_61",["vehicule_question_62","vehicule_question_63"],vehicule,"vehicule_question_62",1,null),
  Question("vehicule_question_64",["vehicule_question_65","vehicule_question_66","vehicule_question_67"],vehicule,"vehicule_question_65",1,null),
  Question("vehicule_question_68",["vehicule_question_69","vehicule_question_70","vehicule_question_71"],vehicule,"vehicule_question_70",1,null),
  Question("vehicule_question_72",["vehicule_question_73","vehicule_question_74"],vehicule,"vehicule_question_73",1,null),
  Question("vehicule_question_75",["vehicule_question_76","vehicule_question_77","vehicule_question_78"],vehicule,"vehicule_question_76",1,null),
  Question("vehicule_question_81",["vehicule_question_82","vehicule_question_83","vehicule_question_84"],vehicule,"vehicule_question_82",1,null),
  Question("vehicule_question_85",["vehicule_question_86","vehicule_question_87"],vehicule,"vehicule_question_87",1,null),
  Question("vehicule_question_88",["vehicule_question_89","vehicule_question_90","vehicule_question_91"],vehicule,"vehicule_question_90",1,null),
  Question("vehicule_question_92",["vehicule_question_93","vehicule_question_94"],vehicule,"vehicule_question_94",1,null),
  Question("vehicule_question_95",["vehicule_question_96","vehicule_question_97"],vehicule,"vehicule_question_96",1,null),
  Question("vehicule_question_98",["vehicule_question_99","vehicule_question_100","vehicule_question_101"],vehicule,"vehicule_question_99",1,null),
];



/*List<Partie> notion_mecanique=[
  Partie("1.Le moteur tire sa force de 3 éléments : ","",null), 
  Partie("• L’essence :","que vous mettez dans le réservoir est aspirée par une pompe jusqu’au carburateur.",null), 
  Partie("•	L’air : ","épuré par le filtre arrive directement au carburateur, l’essence est vaporisée par l’air et ce mélange gazeux ainsi obtenu va se répartir dans chaque cylindre.",null), 
  Partie("•	L’électricité : ","est fournie par l’alternateur passe par le régulateur va s’emmagasiner dans la batterie en mettant le contact vous libérer ce courant qui passe dans la babine pour alimenter l’allumer : celui-ci distribue le courant à chaque bougie ; le démarreur permet de lancer le moteur, il est branché directement sur la batterie ",null), 
  Partie("2.Les équipements utiles au dépannage du véhicule :","•	Des pinces crocodiles pour recharger la batterie.\n•	Du liquide de refroidissement, de l’huile moteur et du lave glace.\n•	Une roue de secours en bon état et le matériel pour changer la roue.\n•	Des chaînes à neige si je me déplace l’hiver.\n•	Des ampoules et fusibles de rechange en cas de panne.",null), 
];
List<Partie> accident_route_parties=[
  Partie("Que doit-on faire en cas d’accident ?","En plus de l’arrêt immédiat il faut :\n  •	En plus de l’arrêt immédiat il faut :\n  •	Présenter ses papiers (nom, prénom, adresse) ;\n  •	Protéger le lieu de l’accident \n  •	Alerter de toute urgence la police, la gendarmerie s’il y a des pertes en vie humaine.\n  •	Secourir les blessés",null),
];*/

Lecon categorie_permis= new Lecon("categorie_permis",categorie_permis_parties,"assets/lecon_pics/permis.png",Niveau.DEBUTANT,Categorie_permis_widgets());//Lecon_affichage(name:"Catégorie de permis",list:categorie_permis_widgets,),);
Lecon conducteur=new Lecon("conducteur",conducteur_parties,"assets/lecon_pics/conducteurr.png",Niveau.DEBUTANT,Conducteur_widgets());//Lecon_affichage(name:"Le conducteur ",list:conducteur_widgets,),);
Lecon vehicule= new Lecon("vehicule",vehicule_parties,"assets/lecon_pics/vehicule.png",Niveau.DEBUTANT,Vehicule_widgets());//Lecon_affichage(name:"Le véhicule",list:vehicule_widgets,),);
//Lecon notions_mecanique= new Lecon("Notions mécaniques",notion_mecanique,"assets/lecon_pics/mecaniq.png",Niveau.DEBUTANT,conducteur_widgets);//Lecon_affichage(name:"Notions mécaniques",list:conducteur_widgets,),);
//Lecon accident_route= new Lecon("Accidents de la route",accident_route_parties,"assets/lecon_pics/accident.png",Niveau.DEBUTANT,vehicule_widgets);//Lecon_affichage(name:"Accidents de la route",list:vehicule_widgets,),);

Themee notions_base= new Themee(
  "Notions de base",
  Niveau.DEBUTANT,
  {
    categorie_permis:categorie_permis_questions,
    conducteur:conducteur_questions,
    vehicule:vehicule_questions,
    //notions_mecanique:[],
    //accident_route:[],
  });

//___________________________ thème signalisation___________________________________

List <Partie> panneaux_danger_parties=[
  Partie("danger1",null,danger_images+'1.png'),
  Partie("danger2",null,danger_images+'2.png'),
  Partie("danger3",null,danger_images+'3.png'),
  Partie("danger4",null,danger_images+"4.png"),
  Partie("danger5",null,danger_images+'5.png'),
  Partie("danger6",null,danger_images+'6.jpg'),
  Partie("danger7",null,danger_images+'7.gif'),
  Partie("danger8",null,danger_images+'8.jpg'),
  Partie("danger9",null,danger_images+'9.png'),
  Partie("danger10",null,danger_images+'10.png'),
  Partie("danger11",null,danger_images+'11.png'),
  Partie("danger12",null,danger_images+'12.png'),
  Partie("danger13",null,danger_images+'13.png'),
  Partie("danger14",null,danger_images+'14.png'),
  Partie("danger15",null,danger_images+'15.png'),
  Partie("danger16",null,danger_images+'16.png'),
  Partie("danger17",null,danger_images+'17.png'),
  Partie("danger18",null,danger_images+'18.png'),
  Partie("danger19",null,danger_images+'19.jpg'),
  Partie("danger20",null,danger_images+'20.png'),
  Partie("danger21",null,danger_images+'21.png'),
  Partie("danger22",null,danger_images+'22.jpg'),
  Partie("danger23",null,danger_images+'23.jpg'),
  Partie("danger24",null,danger_images+'24.png'),
  Partie("danger25",null,danger_images+'25.png'),
  Partie("danger26",null,danger_images+'26.jpg'),
  Partie("danger27",null,danger_images+'27.png'),
  Partie("danger28",null,danger_images+'28.png'),
  Partie("danger29",null,danger_images+'29.jpg'),
  Partie("danger30",null,danger_images+'30.png'),
];
List <Partie> panneaux_passage_a_niveau=[
  Partie("passage_a_niveau1",null,passage_niveau_images+'1.png'),
  Partie("passage_a_niveau2",null,passage_niveau_images+'2.gif'),
  Partie("passage_a_niveau3",null,passage_niveau_images+'3.png'),
  Partie("passage_a_niveau4",null,passage_niveau_images+'4.gif'),
  Partie("passage_a_niveau5",null,passage_niveau_images+'5.jpg'),
  Partie("passage_a_niveau6",null,passage_niveau_images+'6.jpg'),
  Partie("passage_a_niveau7",null,passage_niveau_images+'7.jpg'),
  Partie("passage_a_niveau8",null,passage_niveau_images+'8.png'),
  Partie("passage_a_niveau9",null,passage_niveau_images+'9.png'),
  Partie("passage_a_niveau10",null,passage_niveau_images+'10.jpg'),
  Partie("passage_a_niveau11",null,passage_niveau_images+'11.png'),
  Partie("passage_a_niveau12",null,passage_niveau_images+'12.jpg'),
  Partie("passage_a_niveau13",null,passage_niveau_images+'13.png'),
  Partie("passage_a_niveau14",null,passage_niveau_images+'14.jpg'),  
];
List <Partie> panneaux_temporaire=[
  Partie("panneaux_temporaire1",null,temporaire_images+'1.png'),
  Partie("panneaux_temporaire2",null,temporaire_images+'2.gif'),
  Partie("panneaux_temporaire3",null,temporaire_images+'3.png'),
  Partie("panneaux_temporaire4",null,temporaire_images+'4.jpg'),
  Partie("panneaux_temporaire5",null,temporaire_images+'5.png'),
  Partie("panneaux_temporaire6",null,temporaire_images+'6.jpg'),
  Partie("panneaux_temporaire7",null,temporaire_images+'7.gif'),
  Partie("panneaux_temporaire8",null,temporaire_images+'8.jpg'),
  Partie("panneaux_temporaire9",null,temporaire_images+'9.jpg'),
  Partie("panneaux_temporaire10",null,temporaire_images+'10.jpg'),
  Partie("panneaux_temporaire11",null,temporaire_images+'11.jpg'),
  Partie("panneaux_temporaire12",null,temporaire_images+'12.jpg'),
  Partie("panneaux_temporaire13",null,temporaire_images+'13.jpg'),
  Partie("panneaux_temporaire14",null,temporaire_images+'14.png'),  
  Partie("panneaux_temporaire15",null,temporaire_images+'15.png'),  
  Partie("panneaux_temporaire16",null,temporaire_images+'16.png'),  
  Partie("panneaux_temporaire17",null,temporaire_images+'17.png'),  
  Partie("panneaux_temporaire18",null,temporaire_images+'18.jpg'),  
  Partie("panneaux_temporaire19",null,temporaire_images+'19.jpg'),  
  Partie("panneaux_temporaire20",null,temporaire_images+'20.jpg'),  
  Partie("panneaux_temporaire21",null,temporaire_images+'21.png'),  
  Partie("panneaux_temporaire22",null,temporaire_images+'22.jpg'),
  Partie("panneaux_temporaire23",null,temporaire_images+'23.jpg'), 
];

List<Question> danger_questions=[
  
Question("danger_questions1",["danger_questions2","danger_questions3"],panneaux_danger,"danger_questions2",1,danger_images+"5.png"),	
Question("ce_panneau_annonce",["danger_questions4","danger_questions5"],panneaux_danger,"danger_questions5",1,danger_images+"8.jpg"),	
Question("danger_questions6"	,["danger_questions7","danger_questions8"],panneaux_danger,"danger_questions8",1,danger_images+"10.png"),	
Question("danger_questions9",["danger_questions10","danger_question100"],panneaux_danger,"danger_question100",1,danger_images+"11.png"	),
Question("danger_questions13",["danger_questions14","danger_questions15","danger_questions16"],panneaux_danger,"danger_questions15",1,danger_images+"15.png"),	
Question("danger_questions17",["danger_questions18","danger_questions19"],panneaux_danger,"danger_questions18",1,danger_images+"20.png"	),
Question("ce_panneau_annonce",["danger_questions20","danger_questions21"],panneaux_danger,"danger_questions20",1,danger_images+"21.png"	),
Question("ce_panneau_annonce",["danger_questions22","danger_questions23","danger_questions24"],panneaux_danger,"danger_questions23",1,danger_images+"24.png"),	
Question("ce_panneau_annonce",["danger_questions25","danger_questions26","danger_questions27"],panneaux_danger,"danger_questions27",1,danger_images+"25.png"),

Question("ce_panneau_signifie",["danger_questions28","danger_questions29","danger_questions30"],panneaux_danger,"danger_questions29",1,temporaire_images+"1.png"),//
Question("danger_questions31",["danger_questions32","danger_questions33","danger_questions34"],panneaux_danger,"danger_questions32",1,temporaire_images+"2.gif"),//
Question("danger_questions35",["danger_questions36","danger_questions37","danger_questions38"],panneaux_danger,"danger_questions38",1,temporaire_images+"2.gif"),
Question("ce_panneau_signifie",["danger_questions39","danger_questions40","danger_questions41"],panneaux_danger,"danger_questions40",1,temporaire_images+"5.png"),
Question("cepanneau",["danger_questions42","danger_questions43","danger_questions44"],panneaux_danger,"danger_questions44",1,temporaire_images+"9.jpg"),
Question("cepanneau",["danger_questions45","danger_questions46"],panneaux_danger,"danger_questions46",1,temporaire_images+"10.jpg"),
Question("danger_questions47",["danger_questions48","danger_questions49"],panneaux_danger,"danger_questions48",1,temporaire_images+"11.jpg"),
Question("danger_questions50",["danger_questions51","danger_questions52","danger_questions53"],panneaux_danger,"danger_questions51",1,temporaire_images+"14.png"),

Question("danger_questions54",["danger_questions55","danger_questions56","danger_questions57"],panneaux_danger,"danger_questions57",1,passage_niveau_images+"14.jpg"),
Question("danger_questions58",["danger_questions59","danger_questions60","danger_questions61"],panneaux_danger,"danger_questions59",1,passage_niveau_images+"9.png"	),
Question("danger_questions62",["danger_questions63","danger_questions64","danger_questions65"],panneaux_danger,"danger_questions64",1,passage_niveau_images+"3.png"),
Question("danger_questions66",["danger_questions67","danger_questions68","danger_questions69"],panneaux_danger,"danger_questions69",1,passage_niveau_images+"1.png"),
];

List <Partie> panneaux_direction_parties=[
  Partie("direction1",null,direction_images+'1.jpg'),
  Partie("direction2",null,direction_images+'2.jpg'),
  Partie("direction3",null,direction_images+'3.jpg'),
  Partie("direction4",null,direction_images+'4.jpg'),
  Partie("direction5",null,direction_images+'5.jpg'),
  Partie("direction6",null,direction_images+'6.jpg'), 
  Partie("direction7",null,direction_images+'7.png'),
  Partie("direction8",null,direction_images+'8.png'),
  Partie("direction9",null,direction_images+'9.png'),
  Partie("direction10",null,direction_images+'10.jpg'),
  Partie("direction11",null,direction_images+'11.jpg'),
  Partie("direction12",null,direction_images+'12.jpg'),
  Partie("direction13",null,direction_images+'13.jpg'),
  Partie("direction14",null,direction_images+'14.gif'),
  Partie("direction15",null,direction_images+'15.jpg'),
  Partie("direction16",null,direction_images+'16.png'),
  Partie("direction17",null,direction_images+'17.png'),
  Partie("direction18",null,direction_images+'18.jpg'),
];
List <Partie> panneaux_indication_parties=[
  Partie("indication1",null,indication_images+'1.png'),
  Partie("indication2",null,indication_images+'2.png'),
  Partie("indication3",null,indication_images+'3.png'),
  Partie("indication4",null,indication_images+'4.gif'),
  Partie("indication5",null,indication_images+'5.png'),
  Partie("indication6",null,indication_images+'6.png'),
  Partie("indication7",null,indication_images+'7.png'),
  Partie("indication8",null,indication_images+'8.png'),
  Partie("indication9",null,indication_images+'9.png'),
  Partie("indication10",null,indication_images+'10.png'),
  Partie("indication11",null,indication_images+'11.png'),
  Partie("indication12",null,indication_images+'12.png'),
  Partie("indication13",null,indication_images+'13.png'),
  Partie("indication14",null,indication_images+'14.png'),
  Partie("indication15",null,indication_images+'15.png'),
  Partie("indication16",null,indication_images+'16.gif'),
  Partie("indication17",null,indication_images+'17.png'),
  Partie("indication18",null,indication_images+'18.png'),
  Partie("indication19",null,indication_images+'19.png'),
  Partie("indication20",null,indication_images+'20.png'),
  Partie("indication21",null,indication_images+'21.png'),
  Partie("indication22",null,indication_images+'22.png'),
  Partie("indication23",null,indication_images+'23.png'),
  Partie("indication24",null,indication_images+'24.png'),
  Partie("indication25",null,indication_images+'25.png'),
  Partie("indication26",null,indication_images+'26.png'),
  Partie("indication27",null,indication_images+'27.png'),
  Partie("indication28",null,indication_images+'28.png'),
  Partie("indication29",null,indication_images+'29.png'),
  Partie("indication30",null,indication_images+'30.png'),
  Partie("indication31",null,indication_images+'31.png'),
  Partie("indication32",null,indication_images+'32.png'),
];

List<Question> indication_direction_questions=[
  
Question("ce_panneau_signifie",["indication_direction_question1","indication_direction_question2","indication_direction_question3"],panneaux_indication_direction,"indication_direction_question2",1,indication_images+"1.png"),
Question("ce_panneau_signifie",["indication_direction_question4","indication_direction_question5","indication_direction_question6"],panneaux_indication_direction,"indication_direction_question4",1,indication_images+"5.png"),
Question("ce_panneau_signifie",["indication_direction_question7","indication_direction_question8","indication_direction_question9"],panneaux_indication_direction,"indication_direction_question8",1,indication_images+"6.png"),	
Question("indication_direction_question10",["indication_direction_question11","indication_direction_question12"],panneaux_indication_direction,"indication_direction_question12",1,indication_images+"8.png"),	
Question("ce_panneau_signifie", ["indication_direction_question13","indication_direction_question14","indication_direction_question15"],panneaux_indication_direction,"indication_direction_question15",1,indication_images+"10.png"),	
Question("indication_direction_question16",["indication_direction_question17","indication_direction_question18","indication_direction_question19"],panneaux_indication_direction,"indication_direction_question17",1,indication_images+"12.png"),
Question("indication_direction_question20",["indication_direction_question21","indication_direction_question22"	,"indication_direction_question23"],panneaux_indication_direction,"indication_direction_question23",1,indication_images+"14.png"),		
Question("indication_direction_question24",["indication_direction_question25","indication_direction_question26","indication_direction_question27"],panneaux_indication_direction,"indication_direction_question26",1,indication_images+"15.png"),
Question("indication_direction_question43",["indication_direction_question28","indication_direction_question29","indication_direction_question30"],panneaux_indication_direction,"indication_direction_question28",1,indication_images+"18.png"),
Question("indication_direction_question31",["indication_direction_question32","indication_direction_question33","indication_direction_question34"],panneaux_indication_direction,"indication_direction_question34",1,indication_images+"19.png"),	
Question("indication_direction_question43",["indication_direction_question35","indication_direction_question36","indication_direction_question37"],panneaux_indication_direction,"indication_direction_question36",1,indication_images+"22.png"),
Question("indication_direction_question43",["indication_direction_question38","indication_direction_question39"],panneaux_indication_direction,"indication_direction_question39",1,indication_images+"23.png"),
Question("indication_direction_question43",["indication_direction_question40","indication_direction_question41","indication_direction_question42"],panneaux_indication_direction,"indication_direction_question40",1,indication_images+"29.png"),	
Question("indication_direction_question47",["indication_direction_question48","indication_direction_question49"],panneaux_indication_direction,"indication_direction_question49",1,indication_images+"31.png"),
Question("indication_direction_question50",["indication_direction_question51","indication_direction_question52"],panneaux_indication_direction,"indication_direction_question51",1,indication_images+"13.png"),
	
Question("indication_direction_question53",["indication_direction_question54","indication_direction_question55"],panneaux_indication_direction,"indication_direction_question54",1,direction_images+"3.jpg"),
Question("indication_direction_question56",["indication_direction_question57","indication_direction_question58"],panneaux_indication_direction,"indication_direction_question58",1,direction_images+"5.jpg"),
Question("indication_direction_question59",["indication_direction_question60","indication_direction_question61","indication_direction_question62"],panneaux_indication_direction,"indication_direction_question62",1,direction_images+"6.jpg"),	
Question("indication_direction_question63",["indication_direction_question64","indication_direction_question65","indication_direction_question66"],panneaux_indication_direction,"indication_direction_question65",1,direction_images+"8.png"),
Question("indication_direction_question67",["indication_direction_question68","indication_direction_question69","indication_direction_question70"],panneaux_indication_direction,"indication_direction_question69",1,direction_images+"10.jpg"),
Question("indication_direction_question71",["indication_direction_question72","indication_direction_question73","indication_direction_question74","indication_direction_question75"],panneaux_indication_direction,"indication_direction_question72",1,direction_images+"11.jpg"),
Question("indication_direction_question76",["indication_direction_question77","indication_direction_question78","indication_direction_question79"],panneaux_indication_direction,"indication_direction_question77",1,direction_images+"14.gif"),
Question("indication_direction_question80",["indication_direction_question81","indication_direction_question82","indication_direction_question83"],panneaux_indication_direction,"indication_direction_question82",1,direction_images+"14.gif"),
Question("indication_direction_question84",["indication_direction_question85","indication_direction_question86","indication_direction_question87","indication_direction_question88"],panneaux_indication_direction,"indication_direction_question87",1,direction_images+"15.jpg"),				
];

List <Partie> panneaux_agent_parties=[
  Partie("agent1",null,agents_images+'1.jpg'),
  Partie("agent2",null,agents_images+'2.jpg'),
  Partie("agent3",null,agents_images+'3.jpg'),
  Partie("agent4",null,agents_images+'4.jpg'),
  Partie("agent5",null,agents_images+'5.jpg'),
  Partie("agent6",null,agents_images+'6.jpg'),
];
List <Partie> panneaux_feux_parties=[
  Partie("feu1",null,feux_images+'1.gif'),
  Partie("feu2",null,feux_images+'2.jpg'),
  Partie("feu3",null,feux_images+'3.jpg'),
  Partie("feu4",null,feux_images+'4.jpg'),
  Partie("feu5",null,feux_images+'5.gif'),
  Partie("feu6",null,feux_images+'6.gif'),
];
List <Partie> panneaux_interdiction_arret_et_stationnement_parties=[
	Partie("arrèt et stationnement1",null,arret_stationnementp_images+'1.png'),
	Partie("arrèt et stationnement2",null,arret_stationnementp_images+'2.png'),
	Partie("arrèt et stationnement3",null,arret_stationnementp_images+'3.jpg'),
	Partie("arrèt et stationnement4",null,arret_stationnementp_images+'4.png'),
	Partie("arrèt et stationnement5",null,arret_stationnementp_images+'5.png'),
	Partie("arrèt et stationnement6",null,arret_stationnementp_images+'6.jpg'),
	Partie("arrèt et stationnement7",null,arret_stationnementp_images+'7.jpg'),
	Partie("arrèt et stationnement8",null,arret_stationnementp_images+'8.png'),
	Partie("arrèt et stationnement9",null,arret_stationnementp_images+'9.png'),
	Partie("arrèt et stationnement10",null,arret_stationnementp_images+'10.png'),
	Partie("arrèt et stationnement11",null,arret_stationnementp_images+'11.jpg'),
 	Partie("arrèt et stationnement12",null,arret_stationnementp_images+'12.jpg'),
	Partie("arrèt et stationnement13",null,arret_stationnementp_images+'13.jpg'),
	Partie("arrèt et stationnement14",null,arret_stationnementp_images+'14.jpg'),
	Partie("arrèt et stationnement15",null,arret_stationnementp_images+'15.gif'),
	Partie("arrèt et stationnement16",null,arret_stationnementp_images+'16.gif'),
];



List <Partie> panneaux_fin_dinterdiction_parties=[
	Partie("fin_interdiction1",null,fin_interdiction_images+'1.png'),
	Partie("fin_interdiction2",null,fin_interdiction_images+'2.jpg'),
	Partie("fin_interdiction3",null,fin_interdiction_images+'3.jpg'),
	Partie("fin_interdiction4",null,fin_interdiction_images+'4.gif'),
	Partie("fin_interdiction5",null,fin_interdiction_images+'5.jpeg'),
	Partie("fin_interdiction6",null,fin_interdiction_images+'6.jpg'),
];
List <Partie> panneaux_interdiction_parties=[
	Partie("interdiction1",null,interdiction_images+'1.png'),	
	Partie("interdiction2",null,interdiction_images+'2.png'),
	Partie("interdiction3",null,interdiction_images+'3.png'),
	Partie("interdiction4",null,interdiction_images+'4.png'),
	Partie("interdiction5",null,interdiction_images+'5.png'),
	Partie("interdiction6",null,interdiction_images+'6.png'),
	Partie("interdiction7",null,interdiction_images+'7.png'),
	Partie("interdiction8",null,interdiction_images+'8.png'),
	Partie("interdiction9",null,interdiction_images+'9.png'),
	Partie("interdiction10",null,interdiction_images+'10.png'),
	Partie("interdiction11",null,interdiction_images+'11.png'),
	Partie("interdiction12",null,interdiction_images+'12.png'),
	Partie("interdiction13",null,interdiction_images+'13.png'),
	Partie("interdiction14",null,interdiction_images+'14.png'),
	Partie("interdiction15",null,interdiction_images+'15.png'),
	Partie("interdiction16",null,interdiction_images+'16.jpg'),
	Partie("interdiction17",null,interdiction_images+'17.png'),
	Partie("interdiction18",null,interdiction_images+'18.png'),
	Partie("interdiction19",null,interdiction_images+'19.png'),
	Partie("interdiction20",null,interdiction_images+'20.png'),
	Partie("interdiction21",null,interdiction_images+'21.png'),
	Partie("interdiction22",null,interdiction_images+'22.png'),
	Partie("interdiction23",null,interdiction_images+'23.png'),
	Partie("interdiction24",null,interdiction_images+'24.png'),
	Partie("interdiction25",null,interdiction_images+'25.png'),
	Partie("interdiction26",null,interdiction_images+'26.jpg'),
	Partie("interdiction27",null,interdiction_images+'27.jpg'),
	Partie("interdiction28",null,interdiction_images+'28.png'),
	Partie("interdiction29",null,interdiction_images+'29.png'),
	Partie("interdiction30",null,interdiction_images+'30.gif'),
	Partie("interdiction31",null,interdiction_images+'31.png'),
	Partie("interdiction32",null,interdiction_images+'32.jpg'),
	Partie("interdiction33",null,interdiction_images+'33.png'),
	Partie("interdiction34",null,interdiction_images+'34.png'),
];

List<Question> interdiction_questions=[
  Question("ce_panneau_signifie",["interdiction_question1","interdiction_question2","interdiction_question3"],panneaux_interdiction,"interdiction_question1",1,interdiction_images+"1.png"),	
Question("interdiction_question7",["interdiction_question8","interdiction_question9"],panneaux_interdiction,"interdiction_question8",1,interdiction_images+"5.png"),
Question("interdiction_question10",["interdiction_question11","interdiction_question12"],panneaux_interdiction,"interdiction_question11",1,interdiction_images+"6.png"),	
Question("interdiction_question13",["interdiction_question14","interdiction_question15"],panneaux_interdiction,"interdiction_question14",1,interdiction_images+"8.png"),	
Question("ce_panneau_signifie",["interdiction_question16","interdiction_question17","interdiction_question18"],panneaux_interdiction,"interdiction_question18",1,interdiction_images+"14.png"),
Question("interdiction_question19",["interdiction_question20","interdiction_question21","interdiction_question22"],panneaux_interdiction,"interdiction_question20",1,interdiction_images+"18.png"),
Question("ce_panneau_signifie",["interdiction_question23","interdiction_question24","interdiction_question25"],panneaux_interdiction,"interdiction_question25",1,interdiction_images+"19.png"),
Question("interdiction_question26",["interdiction_question27","interdiction_question28","interdiction_question29"],panneaux_interdiction,"interdiction_question28",1,interdiction_images+"20.png"),
Question("interdiction_question30",["interdiction_question31","interdiction_question32","interdiction_question33"],panneaux_interdiction,"interdiction_question32",1,interdiction_images+"21.png"),
Question("interdiction_question37",["interdiction_question38","interdiction_question39"],panneaux_interdiction,"interdiction_question39",1,interdiction_images+"25.png"),	
Question("cepanneau",["interdiction_question40","interdiction_question41"],panneaux_interdiction,"interdiction_question41",1,interdiction_images+"28.png"),	
Question("interdiction_question42",["interdiction_question43","interdiction_question44"],panneaux_interdiction,"interdiction_question44",1,interdiction_images+"31.png"),	
Question("interdiction_question45",["interdiction_question46","interdiction_question47"],panneaux_interdiction,"interdiction_question46",1,interdiction_images+"32.jpg"),	

Question("interdiction_question48",["interdiction_question49","interdiction_question50","interdiction_questiona"],panneaux_interdiction,"interdiction_question49",1,arret_stationnementp_images+"1.png"),
Question("interdiction_question51",["interdiction_question52","interdiction_question53","interdiction_question54"],panneaux_interdiction,"interdiction_question54",1,arret_stationnementp_images+"2.png"),
Question("interdiction_question55",["interdiction_question56","interdiction_question57"],panneaux_interdiction,"interdiction_question57",1,arret_stationnementp_images+"6.jpg"),	
Question("interdiction_question58" ,["interdiction_question59","interdiction_question60"],panneaux_interdiction,"interdiction_question60",1,arret_stationnementp_images+"10.png"),	
Question("ce_panneau_signifie",["interdiction_question61","interdiction_question62"],panneaux_interdiction,"interdiction_question61",1,arret_stationnementp_images+"11.jpg"),
];

List <Partie> panneaux_obligations_parties=[
	Partie("obligation1",null,obligation_images+'1.jpg'),
	Partie("obligation2",null,obligation_images+'2.jpg'),
	Partie("obligation3",null,obligation_images+'3.jpg'),
	Partie("obligation4",null,obligation_images+'4.jpg'),
	Partie("obligation5",null,obligation_images+'5.png'),
	Partie("obligation6",null,obligation_images+'6.jpg'),
	Partie("obligation7",null,obligation_images+'7.jpg'),
	Partie("obligation8",null,obligation_images+'8.jpg'),
	Partie("obligation9",null,obligation_images+'9.jpg'),
	Partie("obligation10",null,obligation_images+'10.jpg'),
	Partie("obligation11",null,obligation_images+'11.png'),
	Partie("obligation12",null,obligation_images+'12.jpg'),
	Partie("obligation14",null,obligation_images+'14.jpg'),
	Partie("obligation16",null,obligation_images+'16.jpg'),
	Partie("obligation18",null,obligation_images+'18.jpg'),
	Partie("obligation20",null,obligation_images+'20.jpg'),
	Partie("obligation22",null,obligation_images+'22.jpg'),
	Partie("obligation24",null,obligation_images+'24.png'),
	Partie("obligation25",null,obligation_images+'25.png'),
];

List<Question> obligation_questions=[
Question("obligation_question1",["obligation_question2","obligation_question3"],panneaux_obligation,"obligation_question3",1,obligation_images+"16.jpg"),
Question("obligation_question4",["obligation_question5","obligation_question6"],panneaux_obligation,"obligation_question3",1,obligation_images+"1.jpg"),
Question("ce_panneau_signifie",["obligation_question7","obligation_question8","obligation_question9"],panneaux_obligation,"obligation_question9",1,obligation_images+"12.jpg"),
Question("cepanneau",["obligation_question10","obligation_question11"],panneaux_obligation,"obligation_question10",1,obligation_images+"18.jpg"),
Question("cepanneau",["obligation_question12","obligation_question13"],panneaux_obligation,"obligation_question12",1,obligation_images+"21.jpg"),		
Question("cepanneau",["obligation_question14","obligation_question15"],panneaux_obligation,"obligation_question15",1,obligation_images+"5.png"),	
Question("obligation_question16",["obligation_question17","obligation_question18"],panneaux_obligation,"obligation_question18",1,obligation_images+"6.jpg"),		
Question("obligation_question19",["vrai","faux"],panneaux_obligation,"vrai",1,obligation_images+"14.jpg"	),
Question("obligation_question20",["obligation_question21","obligation_question22"],panneaux_obligation,"obligation_question22",1,obligation_images+"20.jpg"),	
Question("ce_panneau_signifie",["obligation_question23","obligation_question24","obligation_question25"],panneaux_obligation,"obligation_question25",1,obligation_images+"23.jpg"),
];

List <Partie> panneaux_fin_obligations_parties=[
	Partie("obligation13",null,obligation_images+'13.jpg'),
	Partie("obligation15",null,obligation_images+'15.jpg'),
	Partie("obligation17",null,obligation_images+'17.jpg'),
	Partie("obligation19",null,obligation_images+'19.jpg'),
	Partie("obligation21",null,obligation_images+'21.jpg'),
	Partie("obligation23",null,obligation_images+'23.jpg'),
];

List <Partie> panneaux_priorite_parties=[	
	Partie("priorité1",null,priorite_images+'1.gif'),
	Partie("priorité2",null,priorite_images+'2.gif'),
	Partie("priorité3",null,priorite_images+'3.png'),
	Partie("priorité4",null,priorite_images+'4.jpg'),
	Partie("priorité5",null,priorite_images+'5.jpg'),
	Partie("priorité6",null,priorite_images+'6.jpg'),
	Partie("priorité7",null,priorite_images+'7.jpg'),
	Partie("priorité8",null,priorite_images+'8.jpg'),
	Partie("priorité9",null,priorite_images+'9.jpg'),
	Partie("priorité10",null,priorite_images+'10.jpg'),
	Partie("priorité11",null,priorite_images+'11.jpg'),
];
List <Partie> panneaux_s_horizontale_parties=[
	Partie("s_horizontale1",null,s_horizontal_images+'1.jpg'),
	Partie("s_horizontale2",null,s_horizontal_images+'2.jpg'),
	Partie("s_horizontale3",null,s_horizontal_images+'3.jpg'),
	Partie("s_horizontale4",null,s_horizontal_images+'4.jpg'),
	Partie("s_horizontale5",null,s_horizontal_images+'5.jpg'),
	Partie("s_horizontale6",null,s_horizontal_images+'6.jpg'),
	Partie("s_horizontale7",null,s_horizontal_images+'7.jpg'),
	Partie("s_horizontale8",null,s_horizontal_images+'8.jpg'),
	Partie("s_horizontale9",null,s_horizontal_images+'9.jpg'),
	Partie("s_horizontale10",null,s_horizontal_images+'10.jpg'),
	Partie("s_horizontale11",null,s_horizontal_images+'11.jpg'),
	Partie("s_horizontale12",null,s_horizontal_images+'12.jpg'),
];

List<Question> circulation_questions=[				
Question("q1",["q2","q3"],signal_circulation,"q3",1,priorite_images+"1.gif"),
Question("q4",["q5","q6","q7","q8"],signal_circulation,"q6",1,priorite_images+"1.gif"),
Question("q9",["q10","q11"],signal_circulation,"q10",1,priorite_images+"2.gif"),
Question("q12",["q13","q14" ],signal_circulation,"q14",1,priorite_images+"2.gif"),		
Question("q15",["q16","q17","q18"],signal_circulation,"q18",1,priorite_images+"3.png"),
Question("q19",["q20","q21","q22","q23"],signal_circulation,"q21",1,priorite_images+"3.png"),
Question("q24",["q25","q26"],signal_circulation,"q25",1,priorite_images+"3.png"),	
Question("q27",["q28","q29","q290"],signal_circulation,"q29",1,priorite_images+"4.jpg"),
Question("q30",["q31","q32"],signal_circulation,"q31",1,priorite_images+"4.jpg"),	
Question("q33",["q34","q35","q36"],signal_circulation,"q35",1,priorite_images+"5.jpg"),	
Question("q37",["q38","q39"],signal_circulation,"q39",1,priorite_images+"10.jpg"),

					
//feux
Question("q44",["q45","q46"],signal_circulation,"q46",1,feux_images+"5.gif"),
Question("q47",["q48","q49","q50"],signal_circulation,"q50",1,feux_images+"6.gif"),
//Question("q51",["q52" ,"q53"] ,"q52" ,1,"7"),// ici quelle photo?
					
					
//agents					
Question("q54",["q55","q56","q57"],signal_circulation,"q57",1,agents_images+"1.jpg"),
Question("q58",["q59","q60","q61"],signal_circulation,"q59",1,agents_images+"3.jpg"),
Question("q62",["q63","q64","q65"],signal_circulation,"q64",1,agents_images+"5.jpg"),
Question("q66",["q67","q68"],signal_circulation,"q68",1,agents_images+"6.jpg"),
					
					
//s_horizentale					
Question("q69",["q70","q71","q72"],signal_circulation,"q71",1,s_horizontal_images+"2.jpg"),
Question("q76",["q77","q78"],signal_circulation,"q78",1,s_horizontal_images+"6.jpg"),	
Question("q79",["q80","q81"],signal_circulation,"q80",1,s_horizontal_images+"7.jpg"),
Question("q82",["q83","q84" ],signal_circulation,"q83",1,s_horizontal_images+"8.jpg"),	
Question("q85",["q86","q87"],signal_circulation,"q87",1,s_horizontal_images+"9.jpg"),
Question("q88",["q89","q90","q91"],signal_circulation,"q91",1,s_horizontal_images+"marquage16.jpg"),// quelle photo
//Question("q92",["q93","q94"],signal_circulation,"q93",1,s_horizontal_images+"17"),// ici quelle photo
];

Lecon panneaux_danger = new Lecon("Dangers",[],"assets/lecon_pics/danger.png",Niveau.DEBUTANT,null);
Lecon panneaux_interdiction = new Lecon("Interdictions",null,"assets/lecon_pics/interdiction.png",Niveau.DEBUTANT,null);
Lecon panneaux_obligation = new Lecon("Obligations",[],"assets/lecon_pics/obligation.png",Niveau.DEBUTANT,null);
Lecon panneaux_indication_direction = new Lecon("Indications & Directions",[],"assets/lecon_pics/road-sign.png",Niveau.DEBUTANT,null);
Lecon signal_circulation = new Lecon("Signeaux de circulation", [] , "assets/lecon_pics/traffic-jam.png", Niveau.DEBUTANT, null);
//Lecon feu = new Lecon("Feux tricolores",[],'assets/lecon_pics/traffic-lights.png',Niveau.DEBUTANT,null);
//Lecon panneaux_priorite = new Lecon("Priorité",null,"assets/lecon_pics/yield.png",Niveau.DEBUTANT,null);
//Lecon signalisation_horizontal = new Lecon("Signalisation horizontale",null,"assets/lecon_pics/motorway.png",Niveau.DEBUTANT,null);

/*List <Question> panneaux_danger_qstn=[
/*Question("ce panneau m'avertit que je vais rencontrer une succession des virages :",["à 500m d’où est implanté la plaque","la distance entre les deux virages est de 500m  ",],panneaux_danger,"à 500m d’où est implanté la plaque",2,"assets/danger/5.png"),
Question("ce panneau annonce :",["un rétrécissement qui peut etre des deux cotés de la chaussée","un rétrécissement uniquement du coté gauche de la chaussée",],panneaux_danger,"un rétrécissement uniquement du coté gauche de la chaussée",2,"assets/danger/8.jpg"),
Question("lorsque je rencontre ce panneau :",["je ne peut pas m'engager dans la voie où  est implenté le panneau","je dois ralentir et faire attention aux dangers divers ",],panneaux_danger,"je dois ralentir et faire attention aux dangers divers ",2,"assets/danger/10.png"),*/
Question("ce panneau annonce :",["sortie des animaux sauvages ","sortie des animaux domestiques",],panneaux_danger,"sortie des animaux sauvages ",2,"assets/danger/21.png"),
Question("ce panneau annonce",["une obligation de céder le passage aux cyclos","une voie obligatoire pour les cyclos","une traversée possible de cyclos venant de la droite",],panneaux_danger,"une traversée possible de cyclos venant de la droite",2,"assets/danger/25.png"),
/*Question('ce panneau indique que je suis proche d\'une rivière non sécuriser ', ['vrai, il n\'existe pas de trettoire de sécurité', 'faux, c\'est un pont mobile '], panneaux_danger, 'faux, c\'est un pont mobile ', 2, "assets/danger/11.png"),
Question('ce panneau annonce :', ['un débouché sur un quai ou une berge', 'un risque de tomber d\'une falaise'], panneaux_danger, 'un débouché sur un quai ou une berge', 2, "assets/danger/12.png"),*/
Question('ce panneau signifie un danger  de :', ['chaussée glissante en hiver','des virages successives','chaussée glissante en permanence'], panneaux_danger, 'chaussée glissante en permanence', 2, "assets/danger/15.png"),
Question('lorsque je rencontre ce panneau je dois ', ['ralentir est faire attention à la sortie des animaux ','accélérer pour s\'enfuire des animaux qui peuvent sortir'], panneaux_danger, 'ralentir est faire attention à la sortie des animaux ', 2, "assets/danger/20.png"),
Question('ce panneau signifie :', ['un passage des piétons à 150m en ville','présence possible d\'enfants sur la chaussée','un passage des piétons à 50m en ville'], panneaux_danger ,'présence possible d\'enfants sur la chaussée', 2, "assets/danger/24.png"),

Question('qu\'est que signifie ce panneau ?', ['route barrée à cause des travaux','danger de travaux sur la route ','danger d\'entassement des pièrres sur la route'], panneaux_danger ,'danger de travaux sur la route ', 3, "assets/temporaire/1.png"),
Question('sur la route où ce panneau est implanté :', ['danger de projection de gravillon','danger de crevaison des pneus','danger d\'inondation'], panneaux_danger, 'danger de projection de gravillon', 3, "assets/temporaire/2.gif"),
Question('si je rencontre ce panneau', ['je garde mon allure','je change de chaussée','je ralenti pour évier de déraper'], panneaux_danger, 'je ralenti pour évier de déraper', 3, "assets/temporaire/2.gif"),
Question('ce pannaux signifie :', ['un accident ','il ya une voiture renversée sur la chaussée','danger de dérapage des voitures'], panneaux_danger, 'un accident ', 3, "assets/temporaire/5.png"),
/*Question('ce panneau :', ['m\'oblige à circuler sur une seule voie','m\'indique que je peut circuler sur plusieurs voies ','m\'annonce un possible bouchon sur la chaussée'], panneaux_danger, 'm\'annonce un possible bouchon sur la chaussée', 3, "assets/temporaire/9.jpg"),
Question('ce panneau :', ['positionne des travaux temporaires ','positionne une déviation permanente',], panneaux_danger, 'positionne des travaux temporaires ', 2, "assets/temporaire/10.jpg"),
Question('cette signalisation est implanté en cas de :', ['virage dangereux à droite ','déviation à droite à cause des travaux'],panneaux_danger, 'déviation à droite à cause des travaux', 3, "assets/temporaire/11.jpg"),
Question('le role de cette balise est :', ['est permanente','délimite une zone de traveaux','délimite la chaussée'], panneaux_danger, 'délimite une zone de traveaux', 2, "assets/temporaire/14.png"),
Question('en présence de deux panneaux identiques , l\'un temporaire et l\'autre permanent, je dois prendre en compte en premier:', ['le panneau permanent','le panneau temporaire'], panneaux_danger, 'le panneau temporaire', 2, null),

Question('ce panonceau m\'avertis d\'une ligne électrifiée située à :', ['10m au dessus de la route ','plus de 5m au dessus de la route ','moins de 6m au dessus de la route'], panneaux_danger, 'moins de 6m au dessus de la route', 3, "assets/passage_niveau/14.jpg"),
Question('ce panneau m\'informe d\'un passage à niveau ', ['avec barrière à fonctionnement manuel','avec demi-barrière ','avec barrière à fonctionnement automatique'], panneaux_danger, 'avec barrière à fonctionnement manuel', 3, "assets/passage_niveau/9.png"),
Question('cette signal m\'informe que', ['l\'arrèt est obligatoire sur ce passage à niveau','le passage à niveau comporte une seule voie','le passage à niveau comporte deux voies qui se croisent'], panneaux_danger, 'le passage à niveau comporte une seule voie', 3, "assets/passage_niveau/3.png"),*/
Question('ce panneau annonce un passage à niveau :', ['avec barrière à fonctionnement automatique','avec barrière à fonctionnement manuel','sans barièrre'], panneaux_danger, 'sans barièrre', 2, "assets/passage_niveau/1.png"),
];*/
Themee signalisation = new Themee(
  "Signalisation", 
  Niveau.DEBUTANT,
  {
    panneaux_danger:danger_questions,
    panneaux_interdiction:interdiction_questions,
    panneaux_obligation:obligation_questions,
    panneaux_indication_direction:indication_direction_questions,
    signal_circulation: circulation_questions,
    //feu:qstn_expert_feu,
    //panneaux_priorite:[],
    //signalisation_horizontal:[]
  }); 



//___________________________________ Tests ____________________________________
Test_Niveau testDebutant1 = new Test_Niveau(
    // 8 questions notions de base et 12 questions signalisation
    Niveau.DEBUTANT, 
    Niveau.INTERMIDIAIRE, 
    [
      categorie_permis_questions[1],
      categorie_permis_questions[5],
      conducteur_questions[0],
      conducteur_questions[7],
      vehicule_questions[5],
      vehicule_questions[10],
      vehicule_questions[11],
      vehicule_questions[15],

      danger_questions[0],
      danger_questions[5],
      danger_questions[9],
      interdiction_questions[2],
      interdiction_questions[8],
      obligation_questions[4],
      obligation_questions[2],
      circulation_questions[7],
      circulation_questions[13],
      indication_direction_questions[15],
      indication_direction_questions[12],
      indication_direction_questions[2],
    ],
  );
  
    Test_Niveau testDebutant2 = new Test_Niveau(
    // 8 questions notions de base et 12 questions signalisation
    Niveau.DEBUTANT, 
    Niveau.INTERMIDIAIRE, 
    [
      categorie_permis_questions[3],
      categorie_permis_questions[6],
      conducteur_questions[3],
      conducteur_questions[10],
      vehicule_questions[2],
      vehicule_questions[8],
      vehicule_questions[20],
      vehicule_questions[21],

      danger_questions[2],
      danger_questions[19],
      danger_questions[20],
      interdiction_questions[9],
      interdiction_questions[11],
      obligation_questions[0],
      obligation_questions[4],
      circulation_questions[10],
      circulation_questions[20],
      indication_direction_questions[1],
      indication_direction_questions[18],
      indication_direction_questions[20],
    ],
  );