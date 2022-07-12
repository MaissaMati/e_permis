import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../back_end/export_all.dart';
import '../creations/export_all.dart';
import '../../main.dart';




class TestCatego extends StatefulWidget {
  //final List<Test_Niveau> testcategorisation;
  final Apprenant apnt;
  TestCatego({@required this.apnt, /*@required this.testcategorisation*/});
  @override
  State<StatefulWidget> createState() {
    return new TestCategoState(appren: apnt,/* testcategorisation: testcategorisation*/);
  }
}

class TestCategoState extends State<TestCatego> {
  final List<Test_Niveau> testcategorisation = app.test_categorisation;
  final Apprenant appren;
  var finalScore = 0, questionNumber = 0, niv = 0;
  int num = 0;
  int ind;
  String c;
  bool changeColor = false, buttonactive = true;
  TestCategoState({@required this.appren,});
  List<Color> color = [Colors.white, Colors.white, Colors.white, Colors.white];
  List<List<String>> choix = new List<List<String>>();
  List<String> choi = new List<String>();
  int number(List<Test_Niveau> testcategorisation) {
    int num = 0;
    for (int i = 0; i <= testcategorisation.length - 1; i++) {
      num = num + testcategorisation[i].listquestions.length;
    }
    return num;
  }

  @override
  void initState() {
    buttonactive = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
         child:Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: test_appbar(
        getTranslated(context, "Question")+" ${num + questionNumber + 1} "+"/"+" ${number(testcategorisation)} ",
        context,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF213159),
            ),
          ),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child:  Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Container(
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        (testcategorisation[niv].listquestions[questionNumber].image == null)
                            ? Padding(
                                padding: EdgeInsets.all(10),
                              )
                            : Center(
                              child: Image.asset(
                                  testcategorisation[niv].listquestions[questionNumber].image,
                                  height: 180,
                                ),
                            ),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          getTranslated(context, testcategorisation[niv].listquestions[questionNumber].enonce),
                          style: TextStyle(fontSize: 20.0),
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
                      itemCount: testcategorisation[niv].listquestions[questionNumber].propositions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          splashColor: Color(0xFF3D6098),
                          highlightColor: Color(0xFF3D6098),
                          color: Colors.white,
                          disabledColor: color[index],
                          onPressed: buttonactive ? () {
                                  appren.archiver_question(testcategorisation[niv].listquestions[questionNumber]);
                                  desactiverbutton(index);
                                  c = testcategorisation[niv].listquestions[questionNumber].propositions[index];
                                  choi.add(c);
                                  debugPrint("${choi[questionNumber]}");
                                  ind = index;
                                }
                              : null,
                          child: Text(
                            getTranslated(context, testcategorisation[niv].listquestions[questionNumber].propositions[index]),
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
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
                          color: buttonactive ? Colors.white : Color(0xFFF04B4C)),
                      child: IconButton(
                        disabledColor: Colors.grey,
                        icon: Icon(Icons.navigate_next,
                            color: buttonactive ? Colors.white : Color(0xFF213159)),
                        color: buttonactive ? Colors.white : Color(0xFF213159),
                        onPressed: () =>
                            buttonactive ? null : updateQuestion(ind),
                      ),
                    )
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

  void desactiverbutton(int index) {
    setState(() {
      buttonactive = !buttonactive;
      color[index] = Color(0xFF3D6098).withOpacity(0.5);
    });
  }

  void updateQuestion(int index) {
    setState(
      () {
        if ((questionNumber == testcategorisation[niv].listquestions.length - 1) && (niv == testcategorisation.length - 1)) {
          List<String> s = choi.sublist(testcategorisation[niv - 1].listquestions.length);
          choix.add(s);
          Niveau niveau = appren.passer_test_categorisation(testcategorisation, choix);
          appren.getTrace.niveau=niveau;
          appren.nv=niveau.toString();
          Etape e=Etape(id_Nv: null,mail: appren.email,niveau:appren.nv.toString());
          final database= Provider.of<AppDatabase>(context);
          database.insertEtape(e);
          print('ih');
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialog(
              title: getTranslated(context, "${niveau.toString().substring(niveau.toString().indexOf('.') + 1)}"),
              description:
                  getTranslated(context, "niveau_determine"),
              buttonText: getTranslated(context, "decouvrer_niveau"),
              icon: Icons.assignment_turned_in,
              ap:appren,
              page: 'trace',
            ),
          );
        } else if ((questionNumber == testcategorisation[niv].listquestions.length - 1) && (niv <= testcategorisation.length - 1)) {
          choix.add(choi);
          color[index] = Colors.white;
          changeColor = false;
          buttonactive = true;
          num = questionNumber + 1;
          questionNumber = 0;
          niv++;
        } else {
          color[index] = Colors.white;
          changeColor = false;
          buttonactive = true;
          questionNumber++;
        }
      },
    );
  }
  
}
