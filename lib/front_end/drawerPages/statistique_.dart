import 'package:e_permis/back_end/export_all.dart';
import 'package:e_permis/front_end/creations/colors.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:e_permis/front_end/creations/export_all.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../creations/export_all.dart';
import '../../instances.dart';

class StatistiquePage extends StatefulWidget {
  final Apprenant apprenant;
  final Niveau niveau;
  StatistiquePage({@required this.apprenant, @required this.niveau});
  @override
  _StatistiquePageState createState() =>
      _StatistiquePageState(apprenant: apprenant, niveau: niveau);
}

class _StatistiquePageState extends State<StatistiquePage> {
  final Apprenant apprenant;
  final Niveau niveau;
  _StatistiquePageState({@required this.apprenant, @required this.niveau,});

  /*bool decisionTestNiveau(Apprenant apprenant, Niveau niveau) {
    bool decision = false;
    if (apprenant.getTrace.archiveReponseNiveau != null) {
      for (Reponse_Niveau r in apprenant.getTrace.archiveReponseNiveau) {
        if (r.test_Niveau.niveau == niveau) {
          decision = r.decision;
        }
      }
    }
    return decision;
  }*/

  int totalTestNiveau(Apprenant apprenant, Niveau niveau) {
    /*int notetotal = 0;
    int nbtest = 0;
    if (apprenant.getTrace.archiveReponseNiveau != null) {
      for (Reponse_Niveau r in apprenant.getTrace.archiveReponseNiveau) {
        if (r.test_Niveau.niveau == niveau) {
          nbtest++;
          if (nbtest != 1) {
            notetotal = 0;
          }
          for (Question q in r.test_Niveau.listquestions) {
            notetotal += q.note;
          }
        }
      }
    }*/
    switch(niveau){
      case Niveau.DEBUTANT:
        return apprenant.getTrace.totalTestNiveau[0];
      break;
      case Niveau.INTERMIDIAIRE:
        return apprenant.getTrace.totalTestNiveau[1];
      break;
      case Niveau.EXPERT:
        return apprenant.getTrace.totalTestNiveau[2];
      break;
    }
    
  }

  int resultatTestNiveau(Apprenant apprenant, Niveau niveau) {
    /*int cpt = 0;
    int nbtest = 0;
    if (apprenant.getTrace.archiveReponseNiveau != null) {
      for (Reponse_Niveau r in apprenant.getTrace.archiveReponseNiveau) {
        if (r.test_Niveau.niveau == niveau) {
          nbtest++;
          if (nbtest != 1) {
            cpt = 0;
          }
          for (Reponse_Question rep in r.list_reponses) {
            if (rep.decision == true) {
              cpt += rep.note;
            }
          }
        }
      }
    }*/
    switch(niveau){
      case Niveau.DEBUTANT:
        return apprenant.getTrace.scoreTestNiveau[0];
      break;
      case Niveau.INTERMIDIAIRE:
        return apprenant.getTrace.scoreTestNiveau[1];
      break;
      case Niveau.EXPERT:
        return apprenant.getTrace.scoreTestNiveau[2];
      break;
    }
  }

  int foisTestNiveau(Apprenant apprenant, Niveau niveau) {
    /*int cpt = 0;
    if (apprenant.getTrace.archive_tests != null) {
      for (Test_Niveau r in apprenant.getTrace.archive_tests) {
        if (r.niveau == niveau) {
          cpt++;
        }
      }
    }
    return cpt;*/
    switch(niveau){
      case Niveau.DEBUTANT:
        return apprenant.getTrace.cptTestNiveau[0];
      break;
      case Niveau.INTERMIDIAIRE:
        return apprenant.getTrace.cptTestNiveau[1];
      break;
      case Niveau.EXPERT:
        return apprenant.getTrace.cptTestNiveau[2];
      break;
    }
  }

  /*Reponse genererdonneesgraph(Apprenant apprenant, Lecon l) {
    var repv = 0;
    var nbqst = 0;
    if (apprenant.getTrace.archiveReponse != null) {
      for (Reponse_Question rep in apprenant.getTrace.archiveReponse) {
        if (rep.question.lecon == l) {
          nbqst++;
          if (rep.decision == true) {
            repv++;
          }
        }
      }
    }
    return Reponse(l.nom.substring(0, 4), repv, nbqst);
  }

  List<Reponse> generateDatagraph(Apprenant apprenant, Niveau niveau) {
    List<Reponse> reponse = new List<Reponse>();
    if (apprenant.getTrace.archive_lecons != null) {
      for (Lecon l in apprenant.getTrace.archive_lecons) {
        if (l.niveau == niveau) {
          reponse.add(genererdonneesgraph(apprenant, l));
        }
      }
    }
    return reponse;
  }*/

  int nbr_lecon_niv (){
    int nbr_lecons_total=0;
    List<Themee> themes = app.list_themes[niveau];
    if(apprenant.getTrace.archive_lecons!=null)
    {
      for(Themee t in themes)
      {
        for(Lecon l in t.list_Lecon.keys)
        {
          nbr_lecons_total++;
        }
      }
    }
    return nbr_lecons_total;
  }

  List<Lecon> lecon_niv (){
    List<Lecon> lecons_total= new List<Lecon>() ;
    List<Themee> themes = app.list_themes[niveau];
    if(apprenant.getTrace.archive_lecons!=null)
    {
      for(Themee t in themes)
      {
        for(Lecon l in t.list_Lecon.keys)
        {
          lecons_total.add(l);
        }
      }
    }
    return lecons_total;
  }

  bool assimile(Lecon l){
    if(apprenant.getTrace.archive_lecons == null)   return false;
    else if (apprenant.getTrace.archive_lecons.contains(l))  return true;
    else return false;
  }

  double _pourcentage(Niveau niveau) {
    int nbrLeconsTotal = 0;
    int nbrLeconAssimiles = 0;
    double prctg = 0;
    List<Themee> themes = app.list_themes[niveau];
    if ((apprenant.getTrace.archive_lecons != null)) {
      for (Themee t in themes) {
        for (Lecon l in t.list_Lecon.keys) {
          nbrLeconsTotal++;
          if (apprenant.getTrace.archive_lecons.contains(l))
            nbrLeconAssimiles++;
        }
      }
      prctg = nbrLeconAssimiles / nbrLeconsTotal;
    }
    return prctg;
  }

  Material circle(String title, double pourcentage) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: bleu,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "${(_pourcentage(niveau) * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AnimatedCircularChart(
                      holeLabel: "dsk",
                      percentageValues: true,
                      size: const Size(100.0, 100.0),
                      initialChartData: [
                        CircularStackEntry(
                          <CircularSegmentEntry>[
                            CircularSegmentEntry(pourcentage * 100, bleu),
                            CircularSegmentEntry(
                                (100 - pourcentage * 100), red),
                          ],
                        ),
                      ],
                      chartType: CircularChartType.Pie,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material montext(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: bleu,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material graphe() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    /*Padding(
                      padding: EdgeInsets.all(
                        8.0,
                      ),*/Center(
                      child: Text(
                        "votre avancement dans les leçons",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: bleu,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //Padding(
                      //padding: EdgeInsets.all(8.0),
                      Center(
                      child: SizedBox(
                        height: 200,
                        width: 300,
                        child: ListView.builder(
                itemCount: nbr_lecon_niv(),
                itemBuilder: (BuildContext context, int index) {
                return Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //lecon_niv[index];
                    Text(
                      getTranslated(context,lecon_niv()[index].nom),
                      style: TextStyle(fontSize: 16),
                    ),
                    assimile(lecon_niv()[index])?
                      Icon(
                        Icons.check_circle,
                        color: Colors.greenAccent,
                      ):Icon(
                        Icons.report,
                        color: Colors.red,
                      ),
                  ],
                ) ;
               },
              ),
                        /*child: SfCartesianChart(
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.top,
                          ),
                          primaryXAxis: CategoryAxis(),
                          series: <ChartSeries>[
                            LineSeries<Reponse, String>(
                                color: bleu,
                                name: "Bonnes reponses",
                                enableTooltip: true,
                                dataSource:
                                    generateDatagraph(apprenant, niveau),
                                xValueMapper: (Reponse rep, _) => rep.nom,
                                yValueMapper: (Reponse rep, _) => rep.reponse,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true)),
                            LineSeries<Reponse, String>(
                              color: red,
                              name: "Mauvaise reponses",
                              enableTooltip: true,
                              dataSource: generateDatagraph(apprenant, niveau),
                              xValueMapper: (Reponse rep, _) => rep.nom,
                              yValueMapper: (Reponse rep, _) =>
                                  rep.reponsetotal - rep.reponse,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                            )
                          ],
                        ),*/
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("statistiques", context),
      body: AnimatedContainer(
        color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: graphe(),
            ),*/
            Center(
              child: graphe(),
              
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 0.0),
              child: circle(
                  "${niveau.toString().substring(niveau.toString().indexOf('.') + 1)}",
                  _pourcentage(niveau)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: foisTestNiveau(apprenant, niveau) == 0
                  ? montext(
                      "vous n'avez pas encore\npasser le test\n de niveau", "")
                  : montext("vous avez passer\nle test de niveau",
                      "${foisTestNiveau(apprenant, niveau)} fois"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: montext("Votre score\ndans le test niveau",
                  "${resultatTestNiveau(apprenant, niveau)}/${totalTestNiveau(apprenant, niveau)}"),
            ),
            
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 350.0),
            StaggeredTile.extent(2, 270.0),
            StaggeredTile.extent(2, 130.0),
            StaggeredTile.extent(2, 130.0),
          ],
        ),
        duration: Duration(),
      ),
    );
  }
}

class Reponse {
  Reponse(this.nom, this.reponse, this.reponsetotal);
  final String nom;
  final int reponse;
  final int reponsetotal;
}
