import 'package:e_permis/front_end/export_pages.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:flutter/material.dart';
import '../../back_end/export_all.dart';
import '../../main.dart';
import 'package:provider/provider.dart';
import '../creations/export_all.dart';
import '../../scénarisation/export_all.dart';

class TestNiveau extends StatefulWidget {
  final Apprenant a;
  final Niveau niveau;
  TestNiveau({@required this.a, @required this.niveau});
  @override
  State<StatefulWidget> createState() {
    return new TestNiveauState(a: a, niveau: niveau);
  }
}

class TestNiveauState extends State<TestNiveau> {
  final Niveau niveau;
  Test_Niveau testniveau ;
  final Apprenant a;
  int ind;
  var finalScore = 0;
  var questionNumber = 0;
  bool  changeColor = false, buttonactive = true;
  List<Color> color = [white_grey, white_grey, white_grey, white_grey];
  List<String> choi = new List<String>();

  @override
  void initState() {
    buttonactive = true;
    super.initState();
  }

  TestNiveauState({@required this.a, @required this.niveau}){
    int i=0;
    while ((testniveau==null)&&(i < app.list_tests.length))
    {
      Test_Niveau t = app.list_tests[i];
      if(t.niveau == niveau){
        if(a.getTrace.archive_tests == null)  testniveau = t;
        else if (!a.getTrace.archive_tests.contains(t))   testniveau = t;
      }
      i++;
    }
    if(testniveau == null){ //le cas ou tt est archivé
      for(Test_Niveau tst in app.list_tests){
        if((a.getTrace.archive_tests.contains(tst))&&(tst.niveau == niveau)){
          if(testniveau == null)  testniveau=tst;
          a.getTrace.archive_tests.remove(tst);
        }
      }
    }
    testniveau.listquestions.shuffle();
  }

  int total= 0;

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async => false,
         child:
        Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: test_appbar(
          getTranslated(context, "Question")+" ${questionNumber + 1} "+"/"+" ${testniveau.listquestions.length} ",
          context),
      body: WillPopScope(
        onWillPop: null,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: darkblue,
            ),
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
                    child: Column(
                      children: <Widget>[
                        (testniveau.listquestions[questionNumber].image == null)
                            ? Padding(
                                padding: EdgeInsets.all(10),
                              )
                            : Center(
                              child: Image.asset(
                                testniveau.listquestions[questionNumber].image,
                                height: 180,
                              ),
                            ),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          getTranslated(context, testniveau.listquestions[questionNumber].enonce),
                          style: TextStyle(fontSize: 20.0, color: text),
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
                      itemCount: testniveau.listquestions[questionNumber].propositions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          splashColor: bleu,
                          highlightColor: bleu,
                          color: white_grey,
                          disabledColor: color[index],
                          onPressed: buttonactive
                              ? () {
                                  desactiverbutton(index);
                                  total+= testniveau.listquestions[questionNumber].note;
                                  choi.add(testniveau.listquestions[questionNumber].propositions[index]);
                                  ind = index;
                                }
                              : null,
                          child: Text(
                            getTranslated(context, testniveau.listquestions[questionNumber].propositions[index]),
                            style:TextStyle(fontSize: 16.0, color: text),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                    SizedBox(height: 5,),
                    Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: buttonactive ? white : red),
                      child: IconButton(
                        disabledColor: Colors.grey,
                        icon: Icon(
                          Icons.navigate_next,
                          color: buttonactive ? white : Colors.white,
                        ),
                        color: buttonactive ? Colors.white : darkblue,
                        onPressed: () =>
                            buttonactive ? null : updateQuestion(ind),
                      ),
                    )),
                    SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
        ),
        ),
    );
  }

  void desactiverbutton(int index) {
    setState(() {
      buttonactive = !buttonactive;
      color[index] = Color(0xFF3D6098).withOpacity(0.5);
    });
  }

  int totaleTestNiveau(){
    int cpt = 0;
    if(testniveau != null){
      for(Question q in testniveau.listquestions){
        cpt += q.note;
      }
    }
    return cpt;
  }

  void updateQuestion(int index) {
    setState(
      () {
        if (questionNumber == testniveau.listquestions.length - 1) {
          Reponse_Niveau repniv = a.passer_test_Niveau(testniveau, choi);
          //(a.getTrace.archiveReponseNiveau == null)? a.getTrace.archiveReponseNiveau= [repniv]: a.getTrace.archiveReponseNiveau.add(repniv);
          (a.getTrace.archive_tests == null)?  a.getTrace.archive_tests = [testniveau] : a.getTrace.archive_tests.add(testniveau);
          repniv.evaluer();

          switch (testniveau.niveau) {
            case Niveau.DEBUTANT:
              a.getTrace.cptTestNiveau[0]++;
              //a.getTrace.totalTestNiveau[0] = totaleTestNiveau();
              a.getTrace.totalTestNiveau[0] = total;
              a.getTrace.scoreTestNiveau[0] = repniv.note;

              if(repniv.decision){
                a.nv = Niveau.INTERMIDIAIRE.toString();
              }
              break;
            case Niveau.INTERMIDIAIRE:
              a.getTrace.cptTestNiveau[1]++;
              a.getTrace.totalTestNiveau[1] = totaleTestNiveau();
              a.getTrace.scoreTestNiveau[1] = repniv.note;

              if(repniv.decision){
                a.nv = Niveau.EXPERT.toString();
              }
              break;
            case Niveau.EXPERT:
              a.getTrace.cptTestNiveau[2]++;
              a.getTrace.totalTestNiveau[2] = totaleTestNiveau();
              a.getTrace.scoreTestNiveau[2] = repniv.note;

              break;
            default:
              break;
          }
            
          Etape e=Etape(id_Nv: null,mail: a.email,niveau:a.nv.toString());
          Test t=Test(mail: a.email,decision: repniv.decision, num_test: testniveau.numt,id_test: null,not_test: repniv.note,niveau: testniveau.niveau.toString());
           final database= Provider.of<AppDatabase>(context);
              
          database.insertEtape(e);
          database.inserttest(t);
          Navigator.push(  context,
            new MaterialPageRoute(
              builder: (context) => repniv.decision
                  ? 
                  (repniv.test_Niveau.niveau==Niveau.EXPERT)?
                    Finish_page(a):
                    TestNiveauSucces(a, repniv)
                  : TestNiveauEchec(a,repniv ),
            ),
          );
        } else {
          color[index] = white_grey; 
          changeColor = false;
          buttonactive = true;
          questionNumber++;
        }
      },
    );
  }
}

class TestNiveauSucces extends StatefulWidget {
  Apprenant a;
  Reponse_Niveau reponseniveau;
  TestNiveauSucces(this.a, this.reponseniveau);
  @override
  State<StatefulWidget> createState() => new _TestNiveauSuccesState(appr: a,reponseniveau: reponseniveau);
}

class _TestNiveauSuccesState extends State<TestNiveauSucces> {
  final Reponse_Niveau reponseniveau;
  final Apprenant appr;
  _TestNiveauSuccesState({@required this.reponseniveau, @required this.appr});
  @override
  Widget build(BuildContext context) {
    appr.getTrace.niveau = reponseniveau.test_Niveau.niveausuivat;
    return Scaffold(
      appBar: appbar(getTranslated(context, "Resultat Du Test"), context),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Icon(
                  Icons.check,
                  color: bleu,
                  size: 100,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: GradientText(
              getTranslated(context, "Bravo !!"),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              gradient: LinearGradient(
                colors: [ red, bleu,],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 10, 10),
            child: Text(
              getTranslated(context, "test_complet"),
              style: TextStyle(
                  color: darkblue, fontSize: 25, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: GradientText(
              getTranslated(context, "${reponseniveau.test_Niveau.niveausuivat.toString().substring(reponseniveau.test_Niveau.niveausuivat.toString().indexOf('.') + 1)}"),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                colors: [
                  red,
                  bleu,
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 50,),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(18.0),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  TracePage(appr)  ));
              },
              color: red,
              textColor: Colors.black,
              child: Text(
                getTranslated(context, "Génial !"),
                textAlign: TextAlign.center,
                style: TextStyle(color: darkblue, fontSize: 20),
              ),
            ),
        ],
      ),
    
      )
    
    );
  }
}

class TestNiveauEchec extends StatefulWidget {
  Apprenant a;
  Reponse_Niveau reponseniveau;
  TestNiveauEchec(this.a, this.reponseniveau);
  @override
  State<StatefulWidget> createState() => new _TestNiveauEchecState(appr: a,reponseniveau: reponseniveau);
}

class _TestNiveauEchecState extends State<TestNiveauEchec>  {
  final Reponse_Niveau reponseniveau;
  final Apprenant appr;
  _TestNiveauEchecState({@required this.reponseniveau,@required this.appr});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(getTranslated(context, "Resultat Du Test"), context),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Icon(
                  Icons.close,
                  color: bleu,
                  size: 100,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 10, 10),
            child: Text(
              getTranslated(context, "test_fail"),
              style: TextStyle(
                  color: darkblue, fontSize: 25, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: GradientText(
              getTranslated(context, "${reponseniveau.test_Niveau.niveau.toString().substring(reponseniveau.test_Niveau.niveau.toString().indexOf('.') + 1)}"),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                colors: [
                  red,
                  bleu,
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 10, 10),
            child: Text(
              getTranslated(context, "btn_lecon_nn_assim"),
              style: TextStyle(
                color: darkblue,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 10, 10),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(18.0), 
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      getTranslated(context, "voici_lecon_nn_assim"),
                      style: TextStyle(color: darkblue, fontSize: 20),
                    ),
                    content: SingleChildScrollView(
                      child: Container(
                        //width: double.maxFinite,
                        width: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.4,
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                itemCount:reponseniveau.list_non_asm.toSet().toList().length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: new Stack(
                                      children: <Widget>[
                                        new Icon(
                                          Icons.brightness_1, 
                                          size: 40.0, 
                                          color: red
                                        ),
                                        new Positioned(
                                            top: 3.0,
                                            right: 3.0,
                                            left: 3.0,
                                            bottom: 3.0,
                                            child: new Center(
                                              child: new Text(
                                                "${index + 1}",
                                                style: new TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontWeight:  FontWeight.w500
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    title: Text(
                                      getTranslated(context, reponseniveau.list_non_asm.toSet().toList()[index].nom),
                                      style: TextStyle(color: darkblue),
                                    ),
                                    onTap: (){
                                      Navigator.of(context).pop();//la fenetres des lecon nn assimilées
                                      Navigator.of(context).pop();//fail test
                                      Navigator.of(context).pop();//test
                                      if(signalisation.list_Lecon.keys.contains(reponseniveau.list_non_asm.toSet().toList()[index]))   
                                        Navigator.of(context).push(MaterialPageRoute( builder: (context)=>affichage_cour_signalisation(appr, reponseniveau.list_non_asm.toSet().toList()[index],true),) );
                                      else 
                                        Navigator.of(context).push( MaterialPageRoute( builder: (context)=>reponseniveau.list_non_asm.toSet().toList()[index].page,  ) );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        //color: red,
                        onPressed: (){
                          Navigator.of(context).pop();//la fenetres des lecon nn assimilées
                          Navigator.of(context).pop();//fail test
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  TracePage(appr)  ));
                        }, //trace
                        child: Text(
                          getTranslated(context, "fermer"),
                          style: TextStyle(color: red),
                        ),
                      )
                    ],
                  ),
                );
              },
              color: red,
              textColor: Colors.black,
              child: Text(
                getTranslated(context, "les lecons non assimilées"),
                textAlign: TextAlign.center,
                style: TextStyle(color: darkblue, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    )
    );
  }
}
