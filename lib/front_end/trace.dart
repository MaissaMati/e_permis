//import 'package:e_permis/front_end/creations/dark_mode/dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'creations/export_all.dart';
import 'drawerPages/export_all.dart';
import 'export_pages.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slimy_card/slimy_card.dart';
import '../back_end/export_all.dart';
import '../instances.dart';
import '../scénarisation/export_all.dart';
import '../main.dart';


class TracePage extends StatefulWidget {
  Apprenant a;
  TracePage(this.a);
  @override
  TracePageState createState() => TracePageState(apprenant : a);
}


class TracePageState extends State<TracePage> {
  final Apprenant apprenant ;
  TracePageState({@required this.apprenant}) ;

  saveSettings() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    await preferences.setBool("dark_theme", dark_theme);
    dark_theme = await preferences.getBool("dark_theme");
    print('\n \n saved dark_theme : $dark_theme');

    //son = await preferences.getBool("son");
    await preferences.setBool("son", son);
  }

  //List<bool> active = [true, false, false];
  bool niv_activation (Niveau niveau){
    List<bool> active = [true, false, false];
    switch (apprenant.getTrace.niveau) {
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
  
  double _pourcentage (Niveau niveau){
    int nbr_lecons_total=0;
    int nbr_lecon_assimiles=0;
    double prctg =0;
    List<Themee> themes = app.list_themes[niveau];
    if(apprenant.getTrace.archive_lecons!=null)
    {
      for(Themee t in themes)
      {
        for(Lecon l in t.list_Lecon.keys)
        {
          nbr_lecons_total++;
          //debugPrint('\n\n he didn\'t get the if statement\n \n');
          if (apprenant.getTrace.archive_lecons.contains(l))  nbr_lecon_assimiles++;
        }
      }
      prctg =nbr_lecon_assimiles/nbr_lecons_total;
    }
    return prctg;
  } 



  Future<bool> _onBackPressed() async{
    print_stat();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(getTranslated(context, "Vous ètes sur?")),
            content: Text(getTranslated(context, "quitter_l'app")),
            actions: <Widget>[
              FlatButton(
                child: Text(getTranslated(context, "NON")),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text(getTranslated(context, "OUI")),
                onPressed: () async {
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  //String m = await preferences.getString("cet_utilisateur");
                  await preferences.setString("cet_utilisateur", apprenant.email);
                  await preferences.setString("ce_mot_passe", apprenant.mot_de_passe);
                  //m = await preferences.getString("cet_utilisateur");
                  //debugPrint('\n  \n what we need : ${m} \n');
                  saveSettings();
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  print_stat(){
      print('\n\n cpt test niveau : ${apprenant.getTrace.cptTestNiveau}');
      print('\n\n score test niveau : ${apprenant.getTrace.scoreTestNiveau}');
      print('\n\n total test niveau : ${apprenant.getTrace.totalTestNiveau}');
    }
  


  @override
  Widget build(BuildContext context) {
    //ThemeChanger theme = Provider.of<ThemeChanger>(context);

    
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: darkblue,
        title: Text(
          getTranslated(context, "Acceuil"),style: TextStyles.appBarTitle,
        ),
        centerTitle: true,
      ),

      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            //new UserAccountsDrawerHeader(accountName: Text('Prénom Nom'), 
            //accountEmail: Text('hello@gmail.dz'),
            new UserAccountsDrawerHeader(
              accountName: Text(apprenant.nom), 
              accountEmail: Text(apprenant.email),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey[400],
                child: Icon(Icons.person, color:  Colors.white,size: 40)
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[darkblue,bleu],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            ),
            //_buildInkwell("Accueil", Icons.history,TracePage(apprenant)),
            Container(
              color: white_grey,
              child:_buildInkwell(getTranslated(context, "Mon profil"), Icons.person,ProfilePage(apprenant)),
            ),
            Divider(color: darkblue,height: 5,),
            Container(
              color: white_grey,
              child:_buildInkwell(getTranslated(context, "parametres"), Icons.settings,SettingsPage(appr: apprenant,)),
            ),
            Container(
              color: white_grey,
              child:_buildInkwell(getTranslated(context, "about_us"), Icons.help,a_propos_de_nous()),
            ),
            Container(
              color: white_grey,
              child:_buildInkwell(getTranslated(context, "contactez nous"),Icons.message,Contact()),
            ),
            Container(
              color: white_grey,
              child:_buildInkwell(getTranslated(context, "deconnecter"),Icons.phonelink_erase,connexion()),
            ),
            Container(
              height: 170,
              color: white_grey,
              child: SizedBox(height: 3,),
            ),
          ],
          )
      ),

      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream, //Stream of SlimyCard
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            color: white,
              //Theme.of(context).cardColor,
              //(theme.getTheme()==my_dark) ?Colors.black38 : Colors.white,
            child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 20),
              _buildSlimyCard(Niveau.DEBUTANT,),
              SizedBox(height: 10),
              _buildSlimyCard(Niveau.INTERMIDIAIRE,),
              SizedBox(height: 10),
              _buildSlimyCard(Niveau.EXPERT,),
              SizedBox(height: 55),
            ],
          ),
          );
        }),
      ),
      ),
      
      
    );
  }

  InkWell _buildInkwell(String mytext, IconData ic,Widget page){
    //Color _color =Colors.black;
    return InkWell(
      onTap:() async {
        if(text == getTranslated(context, "deconnecter"))  {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString(cet_utilisateur, null);
          await preferences.setString(ce_mot_passe, null);

          //saveSettings();
          SystemNavigator.pop();
        }
        Navigator.push(context,MaterialPageRoute(builder: (context) => page ),);
      },
      child:ListTile(
        title: Text(mytext, style: TextStyles.bodyTextStyle),
        leading:Icon(
          ic,
          color: text,
        ),
      ),
    );
  }

  Widget _buildSlimyCard(Niveau niv, ){
    bool active = niv_activation(niv);
    if (active==true) {
      return SingleChildScrollView(
        child: SlimyCard(
        width: 350,
        topCardHeight: 150,
        bottomCardHeight: 450,
        borderRadius: 15,
        slimeEnabled: true,
        color: bleu,
        topCardWidget: topCardWidget(niv, ),
        bottomCardWidget: bottomCardWidget(niv),
      )
      );
    }
    else {
      return Container(
        margin: EdgeInsets.only(left:28, right:28),
        width: 350,
        height: 228,
        child: Card(
          color: Colors.grey,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    topCardWidget(niv,),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: null,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),                         
                  ),
                ),
              ],
            ),
        ),
      );
    
    }
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget(Niveau niveau,) {
    double percent = _pourcentage(niveau);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircularPercentIndicator(
          animation: true,
          animationDuration: 1200,
          radius: 100.0,
          lineWidth: 5.0,
          percent: percent,
          backgroundColor: grey,
          progressColor: red,
          center: Text(
            "${(percent * 100).toStringAsFixed(0)}%",
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          //height: 15,
          width: 25,
        ),
        Container(
            child: Text(
                getTranslated(context, "${niveau.toString().substring(niveau.toString().indexOf('.') + 1)}"),
                style:TextStyles.slimyCardTextStyle)),
        //SizedBox(height: 15),
      ],
    );
  }

  //Widget bottomCardWidget(List<Lecon> list_lecon1, String theme1, List<Lecon> list_lecon2, String theme2) {
  Widget bottomCardWidget(Niveau niveau) {
    List <Themee> list = app.list_themes[niveau];
  Themee t1 = list[0];
  Themee t2 = list[1];
    return CustomScrollView(
      slivers: <Widget>[
        //sizedBox(20),
        themeapp(t1.nom,),
        sizedBox(10),
        gridLecons(t1,context),
        sizedBox(20),
        themeapp(t2.nom,),
        sizedBox(10),
        gridLecons(t2,context),
        sizedBox(30),
        button_niveau(niveau),
    ]);
}

Widget sizedBox(double h){
  return SliverToBoxAdapter(
    child: SizedBox(height: h,)
  );
}

Widget themeapp( String theme_name,){
  return SliverToBoxAdapter(
    child: Container(
      color: bleu,
      child: Padding(
        padding:const EdgeInsets.all(8.0), 
        child: Text(
          getTranslated(context, theme_name), 
          style: TextStyles.appBarTitle
        )
      ),
    ),
  );
}

Widget gridLecons(Themee t, context) { 
  List <Lecon> list = t.list_Lecon.keys.toList();
  Color color = _color(t);
  Color textColor = _textColor(t);
  return SliverGrid.count(
    childAspectRatio: 1.0,
    crossAxisCount: 2,
    crossAxisSpacing: 18,
    mainAxisSpacing: 18,
    children: list.map((data) {
      return InkWell(
        onTap:()  {
          if(t==signalisation)   Navigator.of(context).push(MaterialPageRoute( builder: (context)=>affichage_cour_signalisation(apprenant, data,true),) );
          else Navigator.of(context).push( MaterialPageRoute( builder: (context)=> Lecon_affichage(btn: true,cour: data,x: apprenant,),));//data.page,  ) );  
        }, 
          child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: color,//Color(0xFF213159).withOpacity(0.5), 
            borderRadius: BorderRadius.circular(10)
          ),
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  (data.image!=null)?
              Image.asset(
                //image: AssetImage(list_lecon[index].image),
                 data.image,
                height: 100,
                width: 80, 
                //fit: BoxFit.contain,
              ):  Icon(Icons.ac_unit,size: 100,),
              apprenant.getTrace.archive_lecons== null? 
              SizedBox(height: 1,):
              apprenant.getTrace.archive_lecons.contains(data)? 
              Positioned(
                bottom: 0,
                right: 0,

                child: Icon(Icons.check,color: Colors.green,size: 80,)
                ):SizedBox(height: 1,)
                ],
              ),
              
              //SizedBox(height: 90,),
              Divider(height: 8,color:Colors.black),
              Center(
                //padding: EdgeInsets.only(left:5, right:5),
                child: Text(
                  getTranslated(context, data.nom),
                  style: TextStyle(color: textColor),
                  textAlign: TextAlign.center,
                )
              )
            ],
          ),
          )
        ),
      );
    }).toList());
}

Widget button_niveau(Niveau niveau){
  return SliverToBoxAdapter(
     child: Padding(
      padding:EdgeInsets.only(top:0, bottom: 10),
      child: FlatButton(
      onPressed: (){
        if (_pourcentage(niveau)==1 ){
          Navigator.push(context,MaterialPageRoute(builder: (context) => TestNiveau(a: apprenant, niveau: niveau,/*testniveau: testDebutant*/) ),);
        }else{
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialog(
              title: getTranslated(context, "passer le test du niveau ?"),
              description:
                  getTranslated(context, "les_cours_d'abord"),
              buttonText: getTranslated(context, "d'accord!"),
              icon: Icons.assignment,
              ap: apprenant,//va eter supprimer une fois les liens stabilisés
              page: 'pop',
            ),
          );
        }
      }, 
        child:Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color:Colors.white,width: 3.0,),
          ),
          child:Center(child: Text(getTranslated(context, "testdeniveau"),style: TextStyles.appBarTitle)),
        )
      ),
    )
  );
}
                      
  _color(Themee t) {
    String name = t.nom;
    if((name=="Notions de base")||(name=='Règles générales de la route')||(name=='Croisement et dépassement')) return theme1; 
    else return theme2;  
    }
  }
              
  _textColor(Themee t) {
    String name = t.nom;
    if((name=='Notions de base')||(name=='Règles générales de la route')||(name=='Croisement et dépassement')) return Colors.black; 
    else return Colors.white; 
  }
                

  
          

