import 'dart:async';
import '../creations/export_all.dart';
import 'Language.dart';
import 'package:flutter/material.dart' ;
import 'package:gradient_text/gradient_text.dart';

class Splash extends StatefulWidget
{
  _splashstate  createState() =>  _splashstate ();
}
class _splashstate extends State<Splash> {
  @override
  void initState() {
  super.initState();
   Timer(Duration(seconds:10),()=>Navigator.push(context, MaterialPageRoute(builder : (BuildContext context)
   {return LanguagePage();})));
  }
  @override
  Widget build(BuildContext context) {
    return   Material(
      child : Container(
        /*decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:200,),
            FadeAnimation(8,Image.asset('assets/images/Logo.png',height:150,width:200,)),
            SizedBox(height:40.0,),
            FadeAnimation(1,
              GradientText(
                'E-permis',
                gradient: LinearGradient(
                  //colors:[Color(0xFF213159),Color(0xFFF04B4C)]
                  colors: [red,bleu]
                ),
                style: TextStyle(
                  fontSize:40,
                  fontWeight: FontWeight.w400
                ),
              )
            ),
            SizedBox(height:40.0,),
          ],
        ),
      ),
    );
  }
}

