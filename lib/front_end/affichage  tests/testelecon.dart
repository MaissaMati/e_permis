import 'dart:async';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:e_permis/sc%C3%A9narisation/export_all.dart';
import 'package:flutter/material.dart';
import '../../back_end/export_all.dart';
import '../creations/export_all.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import '../../instances.dart';
import '../export_pages.dart';
import '../../main.dart';


class Quiz extends StatefulWidget {
  final Apprenant a;
  final Lecon lecon;
  //final List<Question> list_questions;
  Quiz({@required this.a, @required this.lecon, });
  @override
  State<StatefulWidget> createState() {
    return new QuizState(appren: a, lecon: lecon, );
  }
}

class QuizState extends State<Quiz> {
  final Lecon lecon;
  final Apprenant appren;
  List<Question> list_questions;
  var nbReponseFausse = 0;
  var finalScore = 0;
  var scoretotal = 0;
  var questionNumber = 0;
  bool buttonactive = true;
  List<Color> color = [white_grey, white_grey, white_grey, white_grey];
  Color reponsecolor = Colors.red.withOpacity(0.5);
  int ind;
  @override
  void initState() {
    // starttimer();
    buttonactive = true;
    super.initState();
  }

  QuizState({@required this.appren, @required this.lecon,}){
    //List<Themee> list_th = app.list_themes[lecon.niveau];
    int nbr_qstn_test=2;
    for(Themee t in app.list_themes[lecon.niveau])
    {
      if(t.list_Lecon.keys.contains(lecon))
      {
        debugPrint('\n hiiii from lecon \n');
        List<Question> questions = t.list_Lecon[lecon];
        //on vérifie si toutes les question sont archivée
        int qstn_nn_archv = 0;
        if(appren.getTrace.archive_qstn != null){
          debugPrint('\n archive isnt null \n');
        for(Question q in questions){ //on va compter les qstn non archivée
          debugPrint('\n ');
          //if(appren.getTrace.archive_qstn==null)  qstn_nn_archv++;
           if(!appren.getTrace.archive_qstn.contains(q)) qstn_nn_archv++;  
        }
        if(qstn_nn_archv<=nbr_qstn_test){
          //exemple: il nous reste 3 qstn non archivées et il nous faut 5 pour ce test
          //on ajoute d'abord les 3 qstn restantes
          for(Question q in questions){ //on va supprimer uniquement les qstn de cette lecon
            if(! appren.getTrace.archive_qstn.contains(q))
              (list_questions==null) ?     list_questions=[q]   :  list_questions.add(q);
          }
          
          //jusqu'à ce point tt les qstn de cette lecon sont archivées
          //donc on les suprime de l'archive
          //appren.getTrace.archive_qstn=null;    //on ne peut pas faire cela car l'archive contient des qstn de ts les cours
          for(Question q in questions){ //on va supprimer uniquement les qstn de cette lecon
            appren.getTrace.archive_qstn.remove(q);
          }
          nbr_qstn_test=nbr_qstn_test - qstn_nn_archv;// on met à jours le nbr des qstn à ajouter (nbr_qstn = 5 - 3 = 2 qstn à ajouter encore pour compléter la liste demandée)
        }}
         
        Random random = new Random();
        while(0<nbr_qstn_test){
          int randomNumber = random.nextInt(questions.length); // on prend une qstn au hasard parmis les qstn de la lecon
          if(appren.getTrace.archive_qstn == null){
            if(list_questions==null){
              list_questions=[questions[randomNumber]];
              nbr_qstn_test--;
            }
            else if (!list_questions.contains(questions[randomNumber])) 
            { list_questions.add(questions[randomNumber]); //on vérifie d'abord qu'elle n'apparait pas deux fois dans cette liste  
              nbr_qstn_test--;
            }
          }else{
          if(!appren.getTrace.archive_qstn.contains(questions[randomNumber])) { //on vérifie qu'elle n'est pas archivée 
            //on l'ajoute à la liste des qstns du test de cette lecon
            if(list_questions==null){
              list_questions=[questions[randomNumber]];
              nbr_qstn_test--;
            }
            else if (!list_questions.contains(questions[randomNumber])) 
            { list_questions.add(questions[randomNumber]); //on vérifie d'abord qu'elle n'apparait pas deux fois dans cette liste  
              nbr_qstn_test--;
            }
            
          }}
        }
        debugPrint('\n well calculated \n');
        list_questions.shuffle();
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
         child:Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: test_appbar(
          //"Question ${questionNumber + 1} /${list_questions.length}", 
          getTranslated(context, "Question")+" ${questionNumber + 1} "+"/"+" ${list_questions.length} ",
          context),
      body: Stack(
        children: <Widget>[
          Container(
            color: darkblue,
          ),
          Card(
            color: white,
            elevation: 5.0,
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Container(
                    color: white_grey,
                    width: 300,
                    //height: 200,
                    child: Column(
                      children: <Widget>[
                        (list_questions[questionNumber].image == null)
                            ? Padding(  padding: EdgeInsets.all(10), )
                            : 
                            //Icon(Icons.ac_unit),
                            Center(
                              child: Image.asset(
                                  list_questions[questionNumber].image,
                                  height: 180,
                                ),
                            ),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          getTranslated(context, list_questions[questionNumber].enonce),
                          style: TextStyle(fontSize: 20.0  , color: text),
                          textAlign: TextAlign.center,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 00.0,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount:
                          list_questions[questionNumber].propositions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          highlightColor: bleu,
                          splashColor: bleu,
                          color: white_grey, //color[index],
                          disabledColor: color[index],
                          onPressed: buttonactive
                              ? () {
                                  ind = index;
                                  Reponse_Question rep = appren.repondre_question(list_questions[questionNumber],list_questions[questionNumber].propositions[index]);
                                  //appren.archiver_re_qstn(rep);
                                  //appren.archiver_question( list_questions[questionNumber]     );
                                  rep.evaluer();
                                  finalScore = finalScore + rep.note;
                                  scoretotal += list_questions[questionNumber].note;
                                  if ((rep.decision == false) && (nbReponseFausse != 2)) {
                                    //debugPrint("\n \n Wrong\n \n ");
                                    nbReponseFausse++;
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return reponseFausserich(index);
                                      },
                                    );
                                  } else if ((nbReponseFausse == 2) && (rep.decision == false)) {
                                    //debugPrint("\n Wrong\n \n ");
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return reponseFausserich2();
                                      },
                                    );
                                  } else {
                                    reponsecolor = Color(0xFF3D6098).withOpacity(0.5);
                                    //debugPrint("Correct");
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return reponsejusterich();
                                      },
                                    );
                                  }
                                  desactiverbutton(index);
                                }
                              : null,
                          child: Text(
                            getTranslated(context, list_questions[questionNumber].propositions[index]),
                            style:
                                TextStyle(fontSize: 16.0, color: text),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                /*Padding(
                  padding: EdgeInsets.fromLTRB(250, 0, 0, 10),*/
                  SizedBox(height: 5,),
                  Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: buttonactive ? white : red,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: IconButton(
                      disabledColor: Colors.grey,
                      icon: Icon(
                        Icons.navigate_next,
                        color: buttonactive ? white : Colors.white,
                      ),
                      color: buttonactive ? darkblue : Colors.white,
                      onPressed: () =>
                          buttonactive ? null : updateQuestion(ind),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
         ),
    );
  }


  Future navigateToQuiz(context) async {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => Quiz(lecon: lecon, a: appren, ),
      ),
    );
  }

  RichAlertDialog reponseFausserich(int index) {
    return RichAlertDialog(
      alertTitle: Text(
        getTranslated(context, "Réponse fausse"),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: darkblue, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      alertSubtitle: richSubtitle(""),
      alertType: RichAlertType.ERROR,
      actions: <Widget>[
        FlatButton(
          child: Text(
            getTranslated(context, "retour à la leçon"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: red,
              fontSize: 15,
            ),
          ),
          onPressed: () {
            questionNumber--;
            updateQuestion(index);
            //navigateToAfficherLecon(context);
            Navigator.of(context).pop();
            if(signalisation.list_Lecon.keys.contains(lecon))   Navigator.of(context).push(MaterialPageRoute( builder: (context)=>affichage_cour_signalisation(appren, lecon,false),) );
            else Navigator.of(context).push( MaterialPageRoute( builder: (context)=>  Lecon_affichage(btn: false,cour: lecon,x: appren,)  /*lecon.page,*/  ) );
          },
        ),
        FlatButton(
          child: Text(
            getTranslated(context, "afficher la reponse"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: red,
              fontSize: 15,
            ),
          ),
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return afficherReponserich();
              },
            );
          },
        ),
      ],
    );
  }
  
  RichAlertDialog reponseFausserich2() {
    return RichAlertDialog(
      alertTitle: Text(
        getTranslated(context, "3 Reponses fausses"),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: darkblue, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      alertSubtitle: richSubtitle(""),
      alertType: RichAlertType.ERROR,
      actions: <Widget>[
        FlatButton(
          child: Text(
            getTranslated(context, "retour à la leçon"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: red,
              fontSize: 15,
            ),
          ),
          onPressed: () {
            questionNumber--;
            //navigateToAfficherLecon3(context);
            Navigator.of(context).pop();
            if(signalisation.list_Lecon.keys.contains(lecon))   Navigator.of(context).push(MaterialPageRoute( builder: (context)=>affichage_cour_signalisation(appren, lecon,true),) );
            else Navigator.of(context).push( MaterialPageRoute( builder: (context)=>   Lecon_affichage(btn: true,cour: lecon,x: appren,)   /*lecon.page,*/  ) );
          },
        ),
      ],
    );
  }

  RichAlertDialog afficherReponserich() {
    return RichAlertDialog(
      alertTitle: Text(
        getTranslated(context, "La bonne reponse est : "),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: darkblue, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      alertSubtitle: Text(
        getTranslated(context, "${list_questions[questionNumber].corrige_type}"),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: darkblue,
          fontSize: 15,
        ),
      ),      
      alertType: RichAlertType.INFO,
      actions: <Widget>[
        FlatButton(
          child: Text(
            getTranslated(context, "fermer"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: red,
              fontSize: 15,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  RichAlertDialog reponsejusterich() {
    return RichAlertDialog(
      alertTitle: Text(
        getTranslated(context, "Bonne Reponse"),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: darkblue, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      alertSubtitle: richSubtitle(""),
      alertType: RichAlertType.SUCCESS,
      actions: <Widget>[
        FlatButton(
          child: Text(
            getTranslated(context, "fermer"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: red,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void desactiverbutton(int index) {
    setState(() {
      buttonactive = !buttonactive;
      color[index] = reponsecolor;
    });
  }

  void updateQuestion(int index) {
    setState(
      () {
        if (questionNumber == list_questions.length - 1) { 
          //a.archiver_question(list_questions[questionNumber]);
          if(finalScore>=(scoretotal/2)){
             appren.consulter_lecon(lecon);
             final database= Provider.of<AppDatabase>(context);
           Historique h=Historique(coure:lecon.nom, niveau: lecon.niveau.toString(),  id_cours: null,mail:appren.email) ;         
         database.insertTrace(h);
          }
          debugPrint("\n \n ${getTranslated(context, "suivant")}");
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialog(
              title: getTranslated(context, "votre score est :") +" $finalScore " +"/"+ " $scoretotal",
              //"votre score est : $finalScore / $scoretotal",
              //"votre score est :",
              description:
                  finalScore>=(scoretotal/2)? 
                  getTranslated(context, "test_lecon_success")+getTranslated(context,"${lecon.nom}")+getTranslated(context, "lecon_suivante"): getTranslated(context, "test_lecon_fail"),
                  //"test_lecon_success "/*${lecon.nom}*/+ "lecon_suivante": "essay",//getTranslated(context, "test_lecon_fail"),
              buttonText: getTranslated(context, "suivant"),
              icon: Icons.assignment_turned_in,
              ap: appren,
              page: 'trace',
            ),
          );
        } else {
          reponsecolor = red.withOpacity(0.5);
          color[index] = white_grey;
          buttonactive = true;
          questionNumber++;
        }
      },
    );
  }
}

