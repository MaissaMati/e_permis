//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'back_end/export_all.dart';
import 'scénarisation/export_all.dart';

/*Partie partie1 = Partie("partie1","contenu1", "images");
Partie partie2 = Partie("partie2","contenu1", "images");
Partie partie3 = Partie("partie3","contenu1", "images");
Lecon l = Lecon("_nom1", [partie1, partie2, partie3], "images",Niveau.EXPERT,null);
Lecon l2 = Lecon("_nom2", [partie1, partie2, partie3], "images",Niveau.DEBUTANT,null);
Lecon l3 = Lecon("_nom3", [partie1, partie2, partie3], "images",Niveau.INTERMIDIAIRE,null);
Question q1 = new Question(
    "Que_signifie_ce_panneau_",
    [
      "Marcher dans les deux sens",
      "Danger non spécifié ",
      "Pas de circulation à droite",
    ],
    l,
    "Marcher dans les deux sens",
    2,
    null);
Question q2 = new Question(
    "Quelle véhicule peut-on conduire avec le permis B",
    [
      "des véhicules dont le poids total autorisé en charge n’excédant pas 3500 kg",
      "véhicules de transport de marchandises de plus de 3500 kg",
      "véhicules de transport de voyageurs ayant plus de 9 place assises ",
      "motocyclettes"
    ],
    l2,
    "des véhicules dont le poids total autorisé en charge n’excédant pas 3500 kg",
    2,
    null);
Question q3 = new Question(
    "Le minimum requis pour l’acuité visuelle pour les catégories A, B et F est",
    ["6/10", "7/10", "8/10", "9/10"],
    l3,
    "6/10",
    2,
    null);
Question q4 = new Question(
    "Le minimum requis pour l’acuité visuelle pour les catégories C, D et F est",
    ["6/10", "7/10", "8/10", "9/10"],
    l,
    "8/10",
    2,
    null);
Question q5 = new Question(
    "Que_signifie_ce_panneau_",
    [
      "Marcher dans les deux sens",
      "Danger non spécifié ",
      "Pas de circulation à droite",
      "danger"
    ],
    l2,
    "Marcher dans les deux sens",
    2,
    null);
List<Question> qs = [q1, q2, q3, q4, q5];

Question q6 = new Question(
    "Question_1_test_debutant",
    [
      "propos 1",
      "propos 2",
      "propos 3",
    ],
    panneaux_danger,  "propos 1",   2,    null);

  Question q7 = new Question(
    "Question_2_test_debutant",
    [
      "propos 1",
      "propos 2",
      "propos 3",
      "propos 4",
    ],
    panneaux_danger,  "propos 1",   2,    null);
  Question q8 = new Question(
    "Question_3_test_debutant",
    [
      "propos 1",
      "propos 2",
    ],
    panneaux_danger,  "propos 1",   2,    null);
  List<Question> qstn_debutant = [q6, q7, q8,];

  Question q9 = new Question(
    "Question_1_test_intermediaire",
    [
      "propos 1",
      "propos 2",
      "propos 3",
    ],
    panneaux_danger,  "propos 1",   2,    null);

  Question q10 = new Question(
    "Question_2_test_intermediaire",
    [
      "propos 1",
      "propos 2",
      "propos 3",
      "propos 4",
    ],
    panneaux_danger,  "propos 1",   2,    null);
  Question q11 = new Question(
    "Question_3_test_intermediaire",
    [
      "propos 1",
      "propos 2",
    ],
    panneaux_danger,  "propos 1",   2,    null);
  List<Question> qstn_intermediaire_danger = [q9, q10, q11,];

  Question q12 = new Question(
    "Question_1_test_expert",
    [
      "propos 1",
      "propos 2",
      "propos 3",
    ],
    panneaux_danger,  "propos 1",   2,    null);

  Question q13 = new Question(
    "Question_2_test_expert",
    [
      "propos 1",
      "propos 2",
      "propos 3",
      "propos 4",
    ],
    panneaux_danger,  "propos 1",   2,    null);
  Question q14 = new Question(
    "Question_3_test_expert",
    [
      "propos 1",
      "propos 2",
    ],
    vehicule,  "propos 1",   2,   null);
    Question q15 = new Question(
    "Question_1_test_expert",
    [
      "propos 1",
      "propos 2",
      "propos 3",
    ],
    panneaux_danger,  "propos 1",   2,    null);

  Question q16 = new Question(
    "Question_2_test_expert",
    [
      "propos 1",
      "propos 2",
      "propos 3",
      "propos 4",
    ],
    panneaux_obligation,  "propos 1",   2,    null);
  Question q17 = new Question(
    "Question_3_test_expert",
    [
      "propos 1",
      "propos 2",
    ],
    panneaux_danger,  "propos 1",   2,   null);
  List<Question> qstn_expert_feu = [
    Question("vitesse_question1",["vitesse_question2","vitesse_question3"],vitesse_distance,"vitesse_question3",1,/*vitesse_distance_images+"q4.jpg"*/null),
    Question("vitesse_question4",["vitesse_question5","vitesse_question6"],vitesse_distance,"vitesse_question5",1,null),
    Question("vitesse_question7",["vitesse_question8","vitesse_question9"],vitesse_distance,"vitesse_question9",1,null),
    Question("arrert et stationnement_question_28",["arrert et stationnement_question_29","arrert et stationnement_question_30","arrert et stationnement_question_31"],arreter_stationner,"arrert et stationnement_question_30",1,/*arret_stationnement_images+"14.png"*/null),
    Question("arrert et stationnement_question_32",["arrert et stationnement_question_33","arrert et stationnement_question_34"],arreter_stationner,"arrert et stationnement_question_34",1,null),
    Question("arrert et stationnement_question_35",["arrert et stationnement_question_36","arrert et stationnement_question_37"],arreter_stationner,"arrert et stationnement_question_36",1,null), 
  ];
  //[q12, q13, q14,q15, q16, q17];*/

  /*Niveau expert = Niveau.EXPERT;
  Niveau intermediaire = Niveau.INTERMIDIAIRE;
  Niveau debutant = Niveau.DEBUTANT;
*/

  //Test_Niveau testDebutant = new Test_Niveau(Niveau.DEBUTANT, Niveau.INTERMIDIAIRE, panneaux_danger_qstn);
  /*Test_Niveau testDebutant = new Test_Niveau(Niveau.DEBUTANT, Niveau.INTERMIDIAIRE, qstn_intermediaire_danger);
  Test_Niveau testIntermd = new Test_Niveau(Niveau.INTERMIDIAIRE, Niveau.EXPERT, qstn_intermediaire_danger);
  Test_Niveau testExpert = new Test_Niveau(Niveau.DEBUTANT, Niveau.INTERMIDIAIRE, qstn_expert_feu);*/

  //List<Test_Niveau> testcategorisation = [testExpert, testIntermd];

  //Reponse_Niveau repniv =  new Reponse_Niveau(apprenant, [], true, 10, [l, l2, l3, l4], testniveau);

  //Apprenant a= Apprenant('aaaaaaaaaaaaa','a@esi.dz','mpa',Trace(debutant, notions_base , [conducteur,vehicule] , null , null));
  /*Apprenant b= Apprenant('nom_apprenant', 'ex_mail@esi.dz', 'ex_mp', Trace(debutant, notions_base , [panneaux_danger, vehicule,conducteur,panneaux_obligation,panneaux_indication_direction,panneaux_interdiction,signal_circulation] , null,[q1,q2],null,null)); 
  Apprenant c= Apprenant("ccccccccccccc","c@esi.dz","mpc",Trace(null,null,null,null,null,null,null));
  Apprenant d= Apprenant("ddddddddddddd","d@esi.dz","mpd",null);
  Apprenant e= Apprenant("eeeeeeeeeeeee","e@esi.dz","mpe",null);*/
  //Map <String , Apprenant> list_apprenants /*= {/*a.email:a ,*/ b.email:b , c.email:c , d.email:d , e.email:e}*/;

  //****************************************************************************************************************** */
  
  

  //Admin admin = Admin('adminmail','adminmp',app);

  //Question q = Question(null, null, null, null, null, null);
  //***************************************************************************************************************** */
  //Apprenant p = Apprenant('nom_apprenant', 'ex_mail@esi.dz', 'ex_mp', Trace(expert, notions_base , [vehicule,conducteur,panneaux_danger,categorie_permis,panneaux_obligation,panneaux_indication_direction,panneaux_interdiction,signal_circulation] , null,[q1,q2],[],[])); 

  //***************************************************************************************************************** */
  
  //bool son = true;
  //ThemeData(accentColor: Colors.black38,);