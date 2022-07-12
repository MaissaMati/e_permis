import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';
import 'export_pages.dart';
import 'first_screens/export_all.dart';
import 'creations/export_all.dart';
import 'package:flutter/material.dart' ; 
import '../back_end/export_all.dart';
import '../instances.dart';

class connexion extends StatefulWidget {  
  /*App app;
  connexion(this.app);*/
  @override
  //_connexionState createState() => _connexionState(application: app);
  _connexionState createState() => _connexionState();
}

class _connexionState extends State<connexion> {
  bool _obscureText = true;
    void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  String mail;
    String mp;
    
    final _formKey = GlobalKey<FormState>();
    bool valid_mail = false;
    //final App application;
    Map<String, Apprenant> apprenants ;
  

  @override
  Widget build(BuildContext context) {
    

    /*_connexionState({@required this.application}) 
    {  apprenants = application.list_apprenants; }*/
    return Scaffold(
      body: Container(
        //width: double.infinity,
        decoration: BoxDecoration(
         color:Color(0xFF213159),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                     child : FadeAnimation(1, Image.asset('assets/images/Logo.png',height:150,width:150,)),


                  ),
                ],
              ),
            ),
            SizedBox(height:15),
            Expanded(
              child: Container(
                //height: 900,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  border: Border(
                    top: BorderSide(width:1.0,color:Colors.white),
                    left: BorderSide(width:1.0,color:Colors.white),
                    right:BorderSide(width:1.0,color:Colors.white),
                    bottom:BorderSide(width:1.0,color:Colors.white),
                  ),
                ),
                child:  SingleChildScrollView(
                  padding: EdgeInsets.only(top:40),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[ 
                        //sized          
                        Container(
                          /*decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.yellow,
                            )
                          ),*/
                          height: 200,
                          width: 280,
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    TextFormField(
                                      onChanged: (String value) {
                                        mail = value;
                                      },
                                      showCursor: true,
                                      cursorColor: Color(0xfff04b4c),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.email,
                                          color: Color(0xfff04b4c),
                                          size: 20,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff04b4c),
                                          )
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          )
                                        ),
                                        border: UnderlineInputBorder(),
                                        labelText: getTranslated(context,"Email"),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          )
                                        ),
                                        contentPadding: EdgeInsets.only(left: 10),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff04b4c),
                                          )
                                        ),
                                      ),
                                      validator:(String value) {
                                        // The form is empty
                                        if (value.isEmpty)    return getTranslated(context,"entrez_mail");
                                        else{
                                          // check if the it has the forme of an email
                                          String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}"+"\\@"+"[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"+"(" +"\\." +
                                                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+";
                                          RegExp regExp = new RegExp(p);
                                          if (!regExp.hasMatch(value))  return getTranslated(context,"mail_nn_valid");
                                          //we check if the email already exists in our app
                                          //else if(!app.list_apprenants.containsKey(value))   return 'Cet email n\'existe pas sur l\'app !' ;
                                          else {
                                            //valid_mail=true; 
                                            return null;
                                          }
                                        }
                                      },
                                      enabled: true,
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      onChanged: (String value) {
                                        mp = value;
                                      },
                                      showCursor: true,
                                      cursorColor: Color(0xfff04b4c),
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          icon : Icon(_obscureText? Icons.visibility:Icons.visibility_off,
                                          color: bleu,)
                                        ),
                                        icon: Icon(
                                          Icons.vpn_key,
                                          color: Color(0xfff04b4c),
                                          size: 20,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff04b4c),
                                          )
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          )
                                        ),
                                        border: UnderlineInputBorder(),
                                        labelText: getTranslated(context,"Mot de passe"),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          )
                                        ),
                                        contentPadding: EdgeInsets.only(left: 10),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff04b4c),
                                          )
                                        ),
                                      ),
                                      validator: (String value) {
                                        if(value.isEmpty) return getTranslated(context,"Mot de passe");
                                        /*else if(    (mail!=null) && (valid_mail)    &&  
                                                    (   (  (app.list_apprenants[mail]).mot_de_passe) != value )   )
                                                    return 'Votre mot de passe est erronée!';*/
                                        else return null;
                                      },
                                      enabled: true,
                                      maxLines: 1,
                                    ),
                                    /*FlatButton(
                                      onPressed: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => motdepasseoublie() ),);
                                      },
                                      child : Text(
                                        getTranslated(context,"mp_oublie"),
                                        style: TextStyle(
                                          color: Colors.grey, 
                                          decoration: TextDecoration.underline,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),*/
                                  ],
                                ),
                              
                            ),
                          ),
                        ),
                        //SizedBox(height:20,),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30),
                              top: Radius.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()){
                              //if (_formKey.currentState.validate()){
                                final database= Provider.of<AppDatabase>(context);
                                List<Apprenant> list= await  database.getAllApprenent();
                                int k=0;
                                bool trouv=false;
                                bool mp_invalide=false;
                            
                                while( list.isEmpty==false  &&k<list.length && trouv==false&&mp_invalide==false)
                                {
                                  if (list[k].email==mail&&list[k].mot_de_passe==mp)
                                  trouv =true;
                                  else{
                                    if (list[k].email==mail&&list[k].mot_de_passe!=mp)
                                    mp_invalide=true;
                                  }
                                  k++;
                                }
                                if (trouv==true){
                                  String n=list[k-1].nom;
                                  Apprenant a= app.inscription(n, mail, mp);
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

                                 Navigator.push(context,MaterialPageRoute(builder: (context) => TracePage(a )));
                                }
                                else{
                                  if (mp_invalide==true){
                                    Alert(
                                      context: context,
                                      type: AlertType.info, 
                                      title: "Votre mot de passe est erronée!",
                                      buttons: [
                                        DialogButton(
                                          child: Text("Réessayer",style: TextStyle(color: Colors.white, fontSize: 15),),
                                          onPressed: () => Navigator.pop(context),
                                          //color: Color.fromRGBO(0, 179, 134, 1.0),
                                        ), 
                                      ],
                                    ).show();
                                  }
                                  else{
                                    Alert(
                                    context: context,
                                    type: AlertType.info, 
                                    title: 'Votre email n\'est pas valide',
                                    buttons: [
                                      DialogButton(
                                        child: Text("Réessayer",style: TextStyle(color: Colors.white, fontSize: 15),),
                                        onPressed: () => Navigator.pop(context),
                                        //color: Color.fromRGBO(0, 179, 134, 1.0),
                                      ),
                                      DialogButton(
                                        child: Text("Inscrire",style: TextStyle(color: Colors.white, fontSize: 15),),
                                        onPressed: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => inscriptionPage() ),),
                                        //  gradient: LinearGradient(colors: [
                                        //  Color.fromRGBO(116, 116, 191, 1.0),
                                        //Color.fromRGBO(52, 138, 199, 1.0)
                                        // ]),
                                      ),
                                    ],).show();
                                  }
                                } 
                             // }
                            }
                          },
                          color: Color(0xFF213159),
                          child: Text(
                            getTranslated(context,"Se connecter"),
                            style: TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),                 
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              getTranslated(context,"pas_de_cmpt"),
                              style: TextStyle(
                                color: Colors.black, 
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            FlatButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => inscriptionPage()));
                          },
                          child: Text(
                            getTranslated(context,"inscrivez vous!"),
                            style:TextStyle(
                              color:Colors.red[800],
                              fontSize: 14,
                            ), 
                          ),
                        ),
                          ],
                        ),  
                      ],
                    ),
                  
                ),
              ),
            ),
          ],
        ),
      ),
  );
  }
  }