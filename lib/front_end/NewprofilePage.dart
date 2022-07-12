import 'dart:ffi';
import 'package:e_permis/front_end/export_pages.dart';

import '../instances.dart';
import 'creations/export_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../back_end/export_all.dart';


class ProfilePage extends StatefulWidget {
  Apprenant apprenant;
  ProfilePage(this.apprenant);
  @override
  MapScreenState createState() => MapScreenState(apprenant);
}

class MapScreenState extends State<ProfilePage>  with SingleTickerProviderStateMixin {
  final Apprenant appr;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  MapScreenState(this.appr);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkblue,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(getTranslated(context, "Mon profil"), style: TextStyles.appBarTitle),
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Container(
              height: 500,
              child: Stack(children: <Widget>[
                Container(
                  height: 200,
                  color: darkblue,
                ),
                Positioned(
                  top: 70,
                  right: 20,
                  left: 20,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        new Container(
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: new Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Container(
                                            width: 140.0,
                                            height: 140.0,
                                            child: CircleAvatar(
                                                backgroundColor: Colors.grey[400],
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 140
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 90.0, right: 100.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: null,
                                                child: new CircleAvatar(
                                                  backgroundColor: Colors.red,
                                                  radius: 25.0,
                                                  child: new Icon(
                                                      Icons.camera_alt,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ]),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          color: Color(0xffFFFFFF),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only( left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:  MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            getTranslated(context, "mes infos"),
                                            style: TextStyles.headingTextStyle2,
                                          ),
                                        ],
                                      ),
                                      new Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          _status
                                              ? _getEditIcon()
                                              : new Container(
                                                  height: 50,
                                                ),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 10, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only( left: 10.0, right: 25.0, top: 25.0),
                                        child: new Text(
                                          getTranslated(context, "Nom"),
                                          style: TextStyles.headingTextStyle2
                                        ),
                                      ),
                                      _status?  Padding(
                                        padding: EdgeInsets.only( left: 10.0, right: 25.0, top: 25.0),
                                        child: new Text(appr.nom,),
                                      ):
                                      Flexible(
                                        child: new TextField(
                                          decoration: const InputDecoration( hintText: "Entez votre pseudo"),
                                          enabled: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only( left: 10, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 30.0, top: 25.0),
                                        child: new Text('E-mail  ',
                                            style:
                                                TextStyles.headingTextStyle2),
                                      ),
                                      _status?  Padding(
                                        padding: EdgeInsets.only( left: 10.0, right: 25.0, top: 25.0),
                                        child: new Text(appr.email,),
                                      ):
                                      Flexible(
                                        child: new TextField(
                                          decoration: const InputDecoration(
                                              hintText: "Entez votre E_mail"),
                                          enabled: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              !_status
                                  ? _getActionButtons()
                                  : new Container(
                                      height: 50,
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            //here Sarrra
            
            _niveau(),

            Container(height: 80, color: darkblue)

            //here
          ],
        ),
      ),
    );
  }

  bool niv_activation (Niveau niveau){
    List<bool> active = [true, false, false];
    switch (appr.getTrace.niveau) {
      case Niveau.DEBUTANT:
        break;
      case Niveau.INTERMIDIAIRE:
        active[1]=true;
        break;
      case Niveau.EXPERT:
        active[1]=true;
        active[2]=true;
        break;
    }
    bool d;
    switch (niveau) {
      case Niveau.DEBUTANT:
        d = active[0];
        break;
      case Niveau.INTERMIDIAIRE:
        d = active[1];
        break;
      case Niveau.EXPERT:
        d = active[2];
        break;
    }
    return d;
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _niveau() {

    bool niv_activation (Niveau niveau){
    List<bool> active = [true, false, false];
    switch (appr.getTrace.niveau) {
      case Niveau.DEBUTANT:
        break;
      case Niveau.INTERMIDIAIRE:
        active[1]=true;
        break;
      case Niveau.EXPERT:
        active[1]=true;
        active[2]=true;
        break;
    }
    bool d;
    switch (niveau) {
      case Niveau.DEBUTANT:
        d = active[0];
        break;
      case Niveau.INTERMIDIAIRE:
        d = active[1];
        break;
      case Niveau.EXPERT:
        d = active[2];
        break;
    }
    return d;
  }

  int _lecon_ass (Niveau niveau){
    int nbr_lecon_assimiles=0;
    List<Themee> themes = app.list_themes[niveau];
    if(appr.getTrace.archive_lecons!=null)
    {
      for(Themee t in themes)
      {
        for(Lecon l in t.list_Lecon.keys)
        {
          if (appr.getTrace.archive_lecons.contains(l))  nbr_lecon_assimiles++;
        }
      }
    }
    return nbr_lecon_assimiles;
  }

  int _lecon_niv (Niveau niveau){
    int nbr_lecons_total=0;
    List<Themee> themes = app.list_themes[niveau];
    if(appr.getTrace.archive_lecons!=null)
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
    double _pourcentage (Niveau niveau){
      return _lecon_ass(niveau)/_lecon_niv(niveau);
    }

    var cardIndex = 0;
    var cardsList = [ Niveau.DEBUTANT,Niveau.INTERMIDIAIRE,Niveau.EXPERT ];
    return Container(
      alignment : Alignment.topRight,
      height: 280.0,
      child: Swiper(
        onTap: (cardIndex) { 
          //go win habin
          Navigator.push(context,MaterialPageRoute(builder: (context) => StatistiquePage(apprenant: appr,niveau: cardsList[cardIndex],) ),);
          debugPrint('\n heeeey  $cardIndex \n');
          return Void;
        },
        loop: false,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(70.0),
                  bottomLeft: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(70.0),
                    bottomLeft: const Radius.circular(20),
                    bottomRight: const Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [red, bleu],
                  ),
                ),
                width: 100.0,
                height: 280.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                  child: CircularPercentIndicator(
                    animateFromLastPercent: true,
                    backgroundColor: grey,
                    progressColor: darkblue,
                    animation: true,
                    animationDuration: 1200,
                    radius: 100.0,
                    lineWidth: 5.0,
                    percent:  _pourcentage(cardsList[index]) ,
                    footer: Column(
                      children: [
                        Text(
                          " ${cardsList[index].toString().substring(cardsList[index].toString().indexOf('.') + 1)}",
                          style: TextStyle(
                            color: grey,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "${_lecon_ass(cardsList[index])} leçons visitées parmis ${_lecon_niv(cardsList[index])}",
                          style: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    //header:
                    center: niv_activation(cardsList[index])
                        ? Icon(
                            Icons.lock_open,
                            color: grey,
                            size: 30,
                          )
                        : Icon(
                            Icons.lock,
                            color: grey,
                            size: 30,
                          ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 3,
        viewportFraction: 0.7,
        scale: 1,
      ),
    );
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Sauvgarder"),
                textColor: Colors.white,
                color: Color(0xff008080),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

//hadi dertha m debut kima kounach mdayrin la trace
//kima narbtou la trace narbto hadi kifkif,
class Niveaux {
  String nomNiveau;
  int nblecon;
  int nbLeconAssimilees;
  bool niveau;
  Niveaux(
    this.nomNiveau,
    this.nblecon,
    this.nbLeconAssimilees,
    this.niveau,
  );
}
