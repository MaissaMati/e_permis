//import 'package:e_permis/sarra/testelecon.dart';
import 'package:flutter/material.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import '../../front_end/export_pages.dart';
import '../../back_end/export_all.dart';
import '../creations/export_all.dart';
import '../../scénarisation/export_all.dart';

class affichage_cour_signalisation extends StatefulWidget {
  Apprenant x;
  Lecon cour;
  bool btn;
  affichage_cour_signalisation(this.x,this.cour,this.btn);
  @override
  _affichage_cour_signalisationState createState() => _affichage_cour_signalisationState(x,cour,btn);
}

class _affichage_cour_signalisationState extends State<affichage_cour_signalisation> with SingleTickerProviderStateMixin {
  final Apprenant appren;
  final Lecon lecon;
  final bool _btntest;
  TabController _tabController;

  _affichage_cour_signalisationState(this.appren,this.lecon,this._btntest);
  @override
  void initState() {
    super.initState();
    _tabController= TabController(length: _btntest? _lecon_nbTab(lecon):_lecon_nbTab(lecon)-1, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xffe7e7e7),
      appBar: AppBar(
        backgroundColor: darkblue,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          getTranslated(context, lecon.nom),
          style: TextStyles.appBarTitle,
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          //indicatorColor: Colors.transparent,
          labelColor: tab_label,//darkblue,
          labelPadding: EdgeInsets.only(right: 40.0, left:40.0),
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
            color: white,
          ),
          tabs: _lecon_tabs (lecon),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _lecon_children(),
      ),
    );
  }
              
  Widget _panneauxGrid (List<Partie> list_parties, context){
    return Container( 
      color: white,
      padding: EdgeInsets.all(15.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index)=>_panneauCard(list_parties, context,index),
        primary: false,
        itemCount: list_parties.length,
      ),
    );
  }
                          
  Widget _panneauCard( List<Partie> list_parties, context, index) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0
          )
        ],
        color: Colors.white,
      ),
      child: InkWell(
        onTap: ()  {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  PanneauDetail(list_parties[index])  ));
        },
        child: Center(
          child: Image(image: AssetImage(list_parties[index].image),height: 80,width: 80, )
        ),
      ),
    );
  }
                
  Widget _boutonDeTest(context,cour){
    return Container(
      color: white,
      child: Center(
          child: Container(
            //color: white,
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFF04B4C),width: 7),
              color: white,
            ),
            //padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Center(
                child: Image.asset(
                  "assets/lecon_pics/test3.png",
                  height: 200,
                  width: 120,
                ),
            ),
                //SizedBox(height: 100,),
                Container(
                  width: 260,
                  child: Text(
                    getTranslated(context, "vs_etes_pret?"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: text,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height:40),
                RaisedButton(
                  onPressed: (){
                    if(appren.getTrace.archive_lecons == null ){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz(a: appren, lecon: cour, )  ), );
                    }else{
                      appren.getTrace.archive_lecons.contains(lecon)? 
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: //(BuildContext context) {   return _testpasse();     },
                          (BuildContext context) => CustomDialog(
                            title:  getTranslated(context, "passer_test?"),
                            description:  getTranslated(context, "test_deja_passe"),
                            buttonText: getTranslated(context, "d'accord!"),
                            icon: Icons.assignment_turned_in, 
                            ap:appren,
                            page: 'pop',
                          ),
                        ):
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz(a: appren, lecon: cour, )  ), );
                    }
                  },
                  padding: EdgeInsets.only(left:20,right:20,top:5,bottom:5),
                  child:Text(getTranslated(context, "Allons y"),    style: TextStyle(fontSize: 25),),
                  color: red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                      top: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
    ),
    );
  }

  Widget _testpasse() {
    return RichAlertDialog(
      alertTitle: Text(
        "Vous avez déjà passé ce test, vous ne puvez pas le refaire !!",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: darkblue, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      alertSubtitle: richSubtitle(""),
      alertType: RichAlertType.ERROR,
      actions: <Widget>[
        FlatButton(
          child: Text(
            "D'accord !",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: red,
              fontSize: 15,
            ),
          ),
          onPressed: () {
            //navigateToAfficherLecon(context);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            "voir mes réponses",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: red,
              fontSize: 15,
            ),
          ),
          onPressed: () {
            /*showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return afficherReponserich();
              },
            );*/
          },
        ),
      ],
    );
  }
                        
  _lecon_tabs(Lecon lecon) {
    String name=lecon.nom;
    switch(name)
    { case 'Dangers':{
        if (_btntest){
        return [
          Tab(    child: Text(getTranslated(context, "Dangers"),style: TextStyles.tabBarText,),  ),
          Tab(    child: Text(getTranslated(context, "Tomporaires"),style: TextStyles.tabBarText),          ),
          Tab(    child: Text(getTranslated(context, "Passage à niveau"),style: TextStyles.tabBarText),     ),
          Tab(    child: Text(getTranslated(context, "Test"),style: TextStyles.tabBarText),                 ),
        ];
        }else{
          return [
          Tab(    child: Text(getTranslated(context, "Dangers"),style: TextStyles.tabBarText,),  ),
          Tab(    child: Text(getTranslated(context, "Tomporaires"),style: TextStyles.tabBarText),     ),
          Tab(    child: Text(getTranslated(context, "Passage à niveau"),style: TextStyles.tabBarText),          ),
        ];
        }
      } break;
      case "Obligations":{
        if (_btntest){
        return [
          Tab(    child: Text(getTranslated(context, "Obligations"),style: TextStyles.tabBarText,),  ),
          Tab(    child: Text(getTranslated(context, "Fin obligations"),style: TextStyles.tabBarText),          ),
          Tab(    child: Text(getTranslated(context, "Test"),style: TextStyles.tabBarText),                 ),
        ];
        }else{
        return [
          Tab(    child: Text(getTranslated(context, "Obligations"),style: TextStyles.tabBarText,),  ),
          Tab(    child: Text(getTranslated(context, "Fin obligations"),style: TextStyles.tabBarText),          ),
        ];
        }
      } break;
      case "Indications & Directions":{
        if (_btntest){
        return [
          Tab(    child: Text(getTranslated(context, "Indications"),style: TextStyles.tabBarText,),  ),
          Tab(    child: Text(getTranslated(context, "Directions"),style: TextStyles.tabBarText),    ),
          Tab(    child: Text(getTranslated(context, "Test"),style: TextStyles.tabBarText),          ),
        ];
        }else{
        return [
          Tab(    child: Text(getTranslated(context, "Indications"),style: TextStyles.tabBarText,),  ),
          Tab(    child: Text(getTranslated(context, "Directions"),style: TextStyles.tabBarText),    ),
        ];
        }
      } break;
      case "Interdictions":{
        if (_btntest){
        return [
          Tab(    child: Text(getTranslated(context, "Interdictions"),style: TextStyles.tabBarText,),  ),
          Tab(    child: Text(getTranslated(context, "Fin interdictions"),style: TextStyles.tabBarText),    ),
          Tab(    child: Text(getTranslated(context, "Arrèt & Stationnement"),style: TextStyles.tabBarText),    ),
          Tab(    child: Text(getTranslated(context, "Test"),style: TextStyles.tabBarText),          ),
        ];
        }else{
        return [
          Tab(    child: Text(getTranslated(context, "Interdictions"),style: TextStyles.tabBarText,),  ),
          Tab(    child: Text(getTranslated(context, "Fin interdictions"),style: TextStyles.tabBarText),    ),
          Tab(    child: Text(getTranslated(context, "Arrèt & Stationnement"),style: TextStyles.tabBarText),    ),
        ];
        }
      } break;
      case 'Signeaux de circulation':{
      if (_btntest) {
        return [
          Tab(    child: Text(getTranslated(context, "Feux tricolores"),style: TextStyles.tabBarText,),   ),
          Tab(    child: Text(getTranslated(context, "Agents"),style: TextStyles.tabBarText),      ),
          Tab(    child: Text(getTranslated(context, "Priorité"),style: TextStyles.tabBarText,),   ),
          Tab(    child: Text(getTranslated(context, "Signal-horizontale"),style: TextStyles.tabBarText),      ),
          Tab(    child: Text(getTranslated(context, "Test"),style: TextStyles.tabBarText),     ),
        ];
      }else{
        return [
          Tab(    child: Text(getTranslated(context, "Feux tricolores"),style: TextStyles.tabBarText,),   ),
          Tab(    child: Text(getTranslated(context, "Agents"),style: TextStyles.tabBarText),      ),
          Tab(    child: Text(getTranslated(context, "Priorité"),style: TextStyles.tabBarText,),   ),
          Tab(    child: Text(getTranslated(context, "Signal-horizontale"),style: TextStyles.tabBarText),      ),
        ];
      }
      } break;
    }
  }
    
  _lecon_children() {
    String name=lecon.nom;
    switch(name)
    { case 'Dangers':{
        if (_btntest){
        return [
          _panneauxGrid(panneaux_danger_parties, context),
          _panneauxGrid(panneaux_temporaire, context),
          _panneauxGrid(panneaux_passage_a_niveau, context), 
          _boutonDeTest(context,panneaux_danger),               
        ];
        }else{
          return [
          _panneauxGrid(panneaux_danger_parties, context),
          _panneauxGrid(panneaux_temporaire, context),
          _panneauxGrid(panneaux_passage_a_niveau, context), 
        ];
        }
      } break;
      case "Obligations":{
        if (_btntest){
        return [
          _panneauxGrid(panneaux_obligations_parties, context),
          _panneauxGrid(panneaux_fin_obligations_parties, context),
          _boutonDeTest(context,panneaux_obligation), 
        ];
        }else{
        return [
          _panneauxGrid(panneaux_obligations_parties, context),
          _panneauxGrid(panneaux_fin_obligations_parties, context),
        ];
        }
      } break;
      case "Indications & Directions":{
        if (_btntest){
        return [
          _panneauxGrid(panneaux_indication_parties, context),
          _panneauxGrid(panneaux_direction_parties, context),
          _boutonDeTest(context,panneaux_indication_direction), 
        ];
        }else{
        return [
          _panneauxGrid(panneaux_indication_parties, context),
          _panneauxGrid(panneaux_direction_parties, context),
        ];
        }
      } break;
      case "Interdictions":{
        if (_btntest){
        return [
          _panneauxGrid(panneaux_interdiction_parties, context),
          _panneauxGrid(panneaux_fin_dinterdiction_parties, context),
          _panneauxGrid(panneaux_interdiction_arret_et_stationnement_parties, context), 
          _boutonDeTest(context,panneaux_interdiction),             
        ];
        }else{
        return [
          _panneauxGrid(panneaux_interdiction_parties, context),
          _panneauxGrid(panneaux_fin_dinterdiction_parties, context),
          _panneauxGrid(panneaux_interdiction_arret_et_stationnement_parties, context), 
          ];
        }
      } break;
      case 'Signeaux de circulation':{
      if (_btntest) {
        return [
          _panneauxGrid(panneaux_feux_parties, context),
          _panneauxGrid(panneaux_agent_parties, context),
          _panneauxGrid(panneaux_priorite_parties, context), 
          _panneauxGrid(panneaux_s_horizontale_parties, context), 
          _boutonDeTest(context,signal_circulation), 
        ];
      }else{
        return [
          _panneauxGrid(panneaux_feux_parties, context),
          _panneauxGrid(panneaux_agent_parties, context),
          _panneauxGrid(panneaux_priorite_parties, context), 
          _panneauxGrid(panneaux_s_horizontale_parties, context), 
        ];
      }
      } break;
    }
  }
    
  _lecon_nbTab(Lecon lecon) {
    String name=lecon.nom;
    switch(name)
    { case "Dangers":                    {  return 4;  } break;
      case "Obligations":                {  return 3;  } break;
      case "Indications & Directions":   {  return 3;  } break;
      case "Interdictions":              {  
        debugPrint('\n hiiii \n ');
        return 4;  } break;
      case 'Signeaux de circulation':    {  return 5;  } break;
    }
  }

}

class PanneauDetail extends StatelessWidget {

  Partie partie;

  PanneauDetail(this.partie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff213159),
      appBar: AppBar(
        backgroundColor: Color(0xff213159),
        elevation: 0.0,
        centerTitle: true,
      ),

      body: Container(
        width: 410,
        padding: EdgeInsets.only(left:20,right:20,bottom: 50),
        child:Card(
          elevation: 10,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:40,bottom: 20 ),
                child: Image(image: AssetImage(partie.image),height: 250,width: 250,)
              ),
              Padding(
                padding: EdgeInsets.only(top:50,left:20, right:20),
                child: Text(
                  getTranslated(context, partie.nom), 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22
                  )
                  //TextStyles.bodyTextStyle
                )
              ),
            ]
          ),
        )
      )
    );
  }
}
