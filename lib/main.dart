import 'package:e_permis/front_end/InscriptionPage.dart';
import 'package:e_permis/front_end/connexion%20.dart';
import 'package:e_permis/front_end/first_screens/export_all.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'back_end/export_all.dart';
import 'package:provider/provider.dart';
import 'front_end/creations/export_all.dart';
//import 'front_end/creations/dark_mode/dark.dart';
import 'front_end/export_pages.dart';
import 'package:flutter/material.dart';
import 'instances.dart';
import 'scénarisation/export_all.dart';

int initScreen;
String cet_utilisateur;
String ce_mot_passe;
bool son;
bool dark_theme;
Apprenant last_apprenant= new Apprenant(email: null,mot_de_passe: null,nom: null,id_app: null,nv: null);

App app = App(
    //les themes selon les niveaux
    { Niveau.DEBUTANT     :    [notions_base,signalisation] , 
      Niveau.INTERMIDIAIRE:    [regles_generales_route,arret_stationnement] , 
      Niveau.EXPERT       :    [croisement_depassement,priorite]    }, 
    //les tests des niveaux
    [ testDebutant1,testDebutant2,
      testIntermd1 ,testIntermd2 ,
      testExpert1  ,testExpert2  ], 
    //test de catego
    testcategorisation, 
    //liste des apprenants
    null
  );


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  initScreen = await preferences.getInt("initScreen");
  if ( initScreen == 0 || initScreen == null){
      await preferences.setBool("dark_theme", false);
      await preferences.setBool("son", true);
    }
  await preferences.setInt("initScreen", 1);

  cet_utilisateur = await preferences.getString('cet_utilisateur');
  await preferences.setString("cet_utilisateur", null);

  dark_theme = await preferences.getBool("dark_theme");
  print('\n \n $dark_theme \n \n');

  son = await preferences.getBool("son");
  await preferences.setBool("son", true);

  setColors();
  
  runApp(Provider(
    create: (_)=>AppDatabase(),
    child: MyApp()));
  
}

class MyApp extends StatefulWidget {
  const MyApp({Key key,  }) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    //init_apprenants();

    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E_permis",
        locale: _locale,
        supportedLocales: [        
          Locale("fr", "FR"),
          Locale("ar", "SA"),          
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },       
        
        home: (initScreen==0 || initScreen == null)? 
          Splash() : connexion(),
          /*(cet_utilisateur == null) ?  
            connexion() : TracePage( last_apprenant),*/
        
    );
    }
  }


 /*init_apprenants() async{
                                final database= Provider.of<AppDatabase>(context);
                                List<Apprenant> list= await  database.getAllApprenent();
                                int k=0;
                                bool trouv=false;
                            
                                while( list.isEmpty==false  &&k<list.length && trouv==false)
                                {
                                  if (list[k].email==cet_utilisateur)
                                  trouv =true;
                                  k++;
                                }
                                if (trouv==true){
                                  String n=list[k-1].nom;
                                  Apprenant a= app.inscription(n, cet_utilisateur, ce_mot_passe);
                               List<Etape> etape=await database.getAllEtape() ;
                               List<Etape>la=List<Etape>();
                                 int m=0;
                                 while(m<etape.length)
                                 {
                                   if(etape[m].mail==a.email)
                                   la.add(etape[m]);
                                   m++;
                                 }
                                 m=0;
                                 bool c=false;
                                 while(m<la.length && c==false)
                                 { 
                                    print('\n ${la[m].niveau}');
                                   if(la[m].niveau =='Niveau.EXPERT')
                                    { a.getTrace.niveau = Niveau.EXPERT;
                                    c=true;}
                                    m++;
                                 }
                                 if(c==false)
                                 {
                                   m=0;
                                   c=false;
                                 while(m<la.length && c==false)
                                 {
                                   if(la[m].niveau=='Niveau.INTERMIDIAIRE')
                                    {a.getTrace.niveau = Niveau.INTERMIDIAIRE;
                                    c=true;}
                                    m++;
                                 }

                                 }
                                

                                  List<Historique> totel = await database.getAllTraces();
                                  List<Historique>cours=List<Historique>();
                                
                                  int u=0;
                                  while(u<totel.length)
                                  {
                                    if (totel[u].mail==a.email)
                                   cours.add(totel[u]);
                                   u++;

                                  }

                                  
                                   
                                  if (cours.isEmpty==false)
                                  {
                                  int i=0;
                                  
                                  
                                  bool find=false; 
                                  Niveau n= Niveau.DEBUTANT;
                                  List <Themee> them = app.list_themes[n];
                                
                                 while(i<cours.length) 

                                {  
                                  String h=cours[i].niveau;
                                  if(h=='Niveau.DEBUTANT')
                                    n= Niveau.DEBUTANT;
                                   if(h=='Niveau.INTERMIDIAIRE') 
                                   n=Niveau.INTERMIDIAIRE;
                                   if(h=='Niveau.EXPERT') 
                                   n=Niveau.EXPERT;

                                  List <Themee> them = app.list_themes[n];
                                
                                   int j=0;
                                   find=false;
                                  while (j<them.length&&find==false) {
                                   int r=0;
                                   List <Lecon> lis= them[j].list_Lecon.keys.toList();                        
                                  while (r<lis.length&&!find) 
                                  {  if(cours[i].coure==lis[r].nom)
                                    {a.consulter_lecon(lis[r]);
                                      find=true;}
                                      r++;}j++;} i++;}
                                 
                                }
                                List<Evaluation> evaluation=await database.getAllquestions();
                                List<Evaluation> evl= List<Evaluation>();
                                int i=0;
                                while (i<evaluation.length){
                                if(evaluation[i].mail==a.email)
                                 evl.add(evaluation[i]);
                                 i++;
                                }
                                if(evl.isEmpty==false){
                                int i=0;
                                while(i<evl.length){
                                if (evl[i].repanse==false) {
                                String cour=evl[i].coure;
                                 int niv=evl[i].note;
                                 String en=evl[i].enonce;
                                 String cr=evl[i].couriger;
                                 Niveau n= Niveau.DEBUTANT;
                                 if(niv==1)
                                    n= Niveau.DEBUTANT;
                                   if(niv==2) 
                                   n=Niveau.INTERMIDIAIRE;
                                   if(niv==3) 
                                   n=Niveau.EXPERT;
                                  List <Themee> them = app.list_themes[n];
                                   int j=0;
                                  bool find=false;
                                  while (j<them.length&&find==false) {
                                   int r=0;
                                   List <Lecon> lis= them[j].list_Lecon.keys.toList();                        
                                  while (r<lis.length&&!find) 
                                  {  if(cour==lis[r].nom)
                                    {List<Question> qs=them[j].list_Lecon[lis [r]];
                                      int l=0;
                                      while( l<qs.length &&!find){ 
                                        if(qs[l].enonce== en&& qs[l].corrige_type==cr){
                                        a.consulter_question(qs[l]);
                                         find=true;
                                        }
                                       l++;
                                      }
                                      }
                                      r++;}
                                      j++;
                                      }
                                  
                                  }
                                  i++;
                                  print('\n \n hii \n \n ');
                                }
                                }
                                     List<Test> test=await database.getAlltest();
                                     i=0;
                                     List <Test> t=List<Test>();
                                     bool fin=false;
                                     while(i<test.length)
                                     {
                                       if(test[i].mail==a.email)
                                      { t.add(test[i]);
                                       }
                                       i++;
                                       print('\n \n hii 11111\n \n ');
                                     }
                                     i=0;
                                     if(t.isEmpty==false)
                                     { 
                                   List<Test_Niveau> li= app.list_tests;
                                      print('\n \n hii 22222  piiip : i = $i   length = ${t.length}\n \n ');
                                      while(i<t.length)
                                      {
                                        print('\n \n we re iiin \n \n ');
                                        fin=false;
                                        int j=0;
                                        while(j<li.length&&!fin)
                                        {
                                          print('\n \n we re deeeeeep iiin \n \n ');
                                          if( li[j].numt==t[i].num_test&&li[j].niveau.toString()==t[i].niveau)
                                          {
                                            print('\n \n we re iiifff \n \n ');
                                            (a.getTrace.archive_tests == null )? a.getTrace.archive_tests=[li[j]]:  //added by me
                                            a.getTrace.archive_tests.add(li[j]);
                                            print('\n \n we re after affect \n \n ');
                                            fin=true;
                                          }
                                          j++;
                                          print('\n \n hii piiiip  j= $j    fin = $fin\n \n ');
                                        }
                                          i++;
                                          print('\n got u 111\n \n');
                                       }
                                     }
                                   
                                      List<Test> tes=await database.getAlltest();
                                     i=0;
                                     List <Test> te=List<Test>();
                                     bool fn=false;
                                     print('\n \n hii 444444\n \n ');
                                     while(i<tes.length)
                                     {
                                       if(tes[i].mail==a.email)
                                      { te.add(tes[i]);
                                       }
                                       i++;
                                       print('\n got u 222\n \n');

                                     }
                                    List <Test> te_d=List<Test>(); 
                                     List <Test> te_i=List<Test>(); 
                                      List <Test> te_e=List<Test>(); 
                                    int o=0;
                                    while(o<te.length)
                                     {
                                        if(te[o].niveau== 'Niveau.DEBUTANT')
                                       te_d.add(te[o]);
                                       else if(te[o].niveau== 'Niveau.INTERMIDIAIRE') //'Niveau.Niveau.INTERMIDIAIRE') 
                                        te_i.add(te[o]);  //te_d.add(te[o]);
                                        else if(te[o].niveau== 'Niveau.EXPERT')   //added by me
                                        te_e.add(te[o]);  // added by me
                                       o++; //i++;   modified by me    
                                       print('\n got u 333\n \n');

                                     }
                                      a.getTrace.cptTestNiveau[0]=te_d.length;
                                      a.getTrace.cptTestNiveau[1]=te_i.length;
                                     a.getTrace.cptTestNiveau[2]=te_e.length;
                                     if (te_d.isEmpty==false)
                                     { Test td=te_d[te_d.length-1];
                                       
                                        List<Test_Niveau> li= app.list_tests;
                                      int i=0;
                                      while(i<li.length)//while(i<t.length)
                                      {
                                        if( li[i].numt==td.num_test&&li[i].niveau.toString()==td.niveau)
                                        {
                                          a.getTrace.scoreTestNiveau[0] = td.not_test;
                                          int cpt=0;
                                          if( li[i]!=null)
                                          {
                                            for(Question q in li[i].listquestions)
                                            cpt=cpt+q.note;//cpt=cpt=q.note;
                                          } 
                                          a.getTrace.totalTestNiveau[0] = cpt;
                                        
                                        }
                                        i++;
                                     }
                                     }
                                 if (te_i.isEmpty==false)
                                     { Test ti=te_d[te_i.length-1];
                                       
                                        List<Test_Niveau> li= app.list_tests;
                                      int i=0;
                                       while(i<t.length)
                                      {
                                        
                                        if( li[i].numt==ti.num_test&&li[i].niveau.toString()==ti.niveau)
                                        {
                                          a.getTrace.scoreTestNiveau[1] = ti.not_test;
                                          int cpt=0;
                                          if( li[i]!=null)
                                          {
                                            for(Question q in li[i].listquestions)
                                            cpt=cpt+q.note;
                                          } 
                                          a.getTrace.totalTestNiveau[1] = cpt;
                                         
                                        }
                                        i++;
                                     }
                                     }
                                    if (te_e.isEmpty==false)
                                    { 
                                      Test te=te_e[te_e.length-1];
                                      List<Test_Niveau> li= app.list_tests;
                                      int i=0;
                                      while(i<t.length )
                                      {
                                        if( li[i].numt==te.num_test&&li[i].niveau.toString()==te.niveau)
                                        {
                                          a.getTrace.scoreTestNiveau[2] = te.not_test;
                                          int cpt=0;
                                          if( li[i]!=null)
                                          {
                                            for(Question q in li[i].listquestions)
                                            cpt=cpt+q.note;
                                          } 
                                          a.getTrace.totalTestNiveau[2] = cpt;                                         
                                        }
                                        i++;
                                      }
                                     }

                                     last_apprenant = a;

                                     (last_apprenant.nom== null || last_apprenant.getTrace== null)? print('\n \n we r screwed '):print('\n \n we made it');
                                  //TracePage(a );
                                }
                                }*/
  


}
