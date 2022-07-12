//import 'package:e_permis/maissa/trace.dart';
//import 'creations/export_all.dart';
import 'package:e_permis/front_end/creations/colors.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'first_screens/OnboardingScreen2.dart';
import 'package:flutter/material.dart';
import '../back_end/export_all.dart';
import 'export_pages.dart';
import '../main.dart';
//import 'package:e_permis/classes.dart';
//import 'package:e_permis/sarra/testcategorisation.dart';
import '../instances.dart';
//import '../yousra/connexion .dart';


class inscriptionPage extends StatefulWidget {
  /*final List<Test_Niveau> testcategorisation;
  App app;
  inscriptionPage({@required this.app,@required this.testcategorisation});*/
  @override
  //_inscriptionPageState createState() => _inscriptionPageState(application: app , testcategorisation: testcategorisation);
  _inscriptionPageState createState() => _inscriptionPageState();
}

class _inscriptionPageState extends State<inscriptionPage> {
  //final List<Test_Niveau> testcategorisation;
  String nom;
  String mail;
  String mp;
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  //final App application;
  Map<String, Apprenant> apprenants = app.list_apprenants;

  /*_inscriptionPageState({@required this.application , @required this.testcategorisation}) 
  {  apprenants = application.list_apprenants; }*/

  void _showDialog(BuildContext context) { 
    showDialog(   
      context: context,   
      builder: (BuildContext context) {     // return object of type Dialog 
        return AlertDialog(       
          title: new Text("Message"),  
          content: new Text('my map : \n$apprenants'),       
          actions: <Widget>[         
            new FlatButton(           
              child: new Text("Close"),           
              onPressed: () {             
                Navigator.of(context).pop();           
              },         
            ),       
          ],     
        );   
      }, 
    ); 
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (ctx) => Container(
        height: 800,
        child:Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            ClipPath(
              clipper: CurvedBottomClipper(),
              child: Container(
                /*decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),*/
                color: Color(0xff213159),
                height: 220.0,
              ),
            ),
            Positioned(
              left: 0.5,
              right: 0.5,
              top :0,
              child:Column(
                children: <Widget>[
                  Container(
                    color: Color(0xff213159),
                    height: 120,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CircleAvatar(
                    radius: 61,
                    backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: Icon(
                          Icons.person_add,
                          size: 65,
                          color: red,
                        )
                        /*IconButton(
                          icon: Icon(Icons.person_add), 
                          onPressed: () {},
                          iconSize: 58,
                          color: Colors.grey,
                      ),*/
                    ),
                  ),
                  SizedBox(height: 25.0, ),
                  Container(
                    height: 380,
                    width: 300,
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            onSaved: (String value) {
                              nom = value;
                            },
                            autovalidate: _validate,
                            showCursor: true,
                            cursorColor:Color(0xfff04b4c),
                            obscureText: false,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Color(0xfff04b4c),
                                size: 30,
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
                              labelText: getTranslated(context, "Nom"),
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
                              if(value.isEmpty) return getTranslated(context, "entrez_nom");
                              else if(value.length < 3) return getTranslated(context, "nom_court");
                              else if(value.length > 20) return getTranslated(context, "nom_long") ;
                              else return null;
                            },
                            enabled: true,
                            maxLines: 1,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            onSaved: (String value) {
                              mail = value;
                            },
                            showCursor: true,
                            cursorColor: Color(0xfff04b4c),
                            obscureText: false,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Color(0xfff04b4c),
                                size: 30,
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
                              labelText: getTranslated(context, "Email"),
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
                              if (value.isEmpty)    return getTranslated(context, "entrez_mail");
                              else{
                                // check if the it has the forme of an email
                                String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}"+"\\@"+"[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"+"(" +"\\." +
                                          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+";
                                RegExp regExp = new RegExp(p);
                                if (!regExp.hasMatch(value))  return getTranslated(context, "mail_nn_valid");
                                //we check if the email already exists in our app
                                //else if(apprenants.containsKey(value))   return 'Cet email est déjà utilisé !' ;
                                else return null;
                              }
                            },
                            enabled: true,
                            maxLines: 1,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onSaved: (String value) {
                              mp = value;
                            },
                            showCursor: true,
                            cursorColor: Color(0xfff04b4c),
                            obscureText: false,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key,
                                color: Color(0xfff04b4c),
                                size: 30,
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
                              labelText: getTranslated(context, "Mot de passe"),
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
                              if(value.isEmpty) return getTranslated(context, "entrez_mp");
                              else if(value.length < 6) return getTranslated(context, "mp_court");
                              else if(value.length > 20) return getTranslated(context, "mp_long");
                              else return null;
                            },
                            enabled: true,
                            maxLines: 1,
                          ),
                        SizedBox(height: 20,),
                        RaisedButton(
                    onPressed: () async{ 
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        final database= Provider.of<AppDatabase>(context);
                        List<Apprenant>  list=  await database.getAllApprenent();
                        int k =0;
                        bool trouv=false;
                        while(k<list.length &&list.isEmpty==false && trouv==false )
                        {
                          if (list[k].email==mail) {
                            trouv=true;
                          }
                          k++;
                        }
                        if (trouv==true){
                          Alert(
                            context: context,
                            type: AlertType.info, 
                            title: "Votre email est déja utilisé !",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Réessayer",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                onPressed: () => Navigator.pop(context),
                                //color: Color.fromRGBO(0, 179, 134, 1.0),
                              ),
                              DialogButton(
                                child: Text(
                                  "connecter",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => connexion() ),),
                              ),
                            ],
                          ).show();
                        }
                        else{
                          Apprenant chaima = app.inscription(nom, mail, mp);
                          int res= await database.insertApprenent(chaima);
                          if(res!=0)
                          Scaffold.of(ctx).showSnackBar(SnackBar(content: Text('Compte créer avec succés'),),);
                          Navigator.push(context,MaterialPageRoute(builder: (context) => OnboardingScreen2(chaima) ),);
                        } 
                      }   
                    },
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                    child: Text(
                      getTranslated(context, "inscrire"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),  
                    ),
                    color: Color(0xff213159),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                        top: Radius.circular(30),
                      ),  
                    ),
                  ),
                  SizedBox(height: 10,),
                  FlatButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => connexion() ),);
                    },
                    child: Text(
                      getTranslated(context, "j'ai_un_cmpt"),
                      style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                        ],
                      ),
                   
                      )
                    ),
                  ), 
                  
                ],
              ),
            ),
          ],  
        ),
      )
      )
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  //source : stackOverFlow
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 3 / 5;
    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);
    final path = Path();
    path.addRect(filledRectangle);
    path.arcTo(roundingRectangle, 3.14, -3.14, true);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}

