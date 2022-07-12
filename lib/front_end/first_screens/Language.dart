import 'package:e_permis/back_end/export_all.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import 'OnboardingScreen.dart';
import 'package:flutter/material.dart' ;

class LanguagePage extends StatelessWidget {
  @override
  Widget build( BuildContext context ) {
    return Scaffold(
        body: Container(
           decoration: BoxDecoration(
             color:Color(0xFF213159),
            ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height:250,),
                  FlatButton(
                    /*onPressed: (){                        
                      Navigator.push( context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
                    },*/
                    onPressed: () async {
                Locale _locale = await setLocale("fr");
                MyApp.setLocale(context, _locale);               
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnboardingScreen()));
              },
                    child :  Container(
                    height: 55,
                    margin: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(50),
                         color: Color(0xFFE7E7E8),
                                  ),
                        child: Center(
                           child: Text("Francais", style: TextStyle(color: Color(0xFFF04B4C), fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
          ),),
                    SizedBox(height:20,),
                    FlatButton(
                      onPressed: () async {
                Locale _locale = await setLocale("ar");
                MyApp.setLocale(context, _locale);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnboardingScreen()));
              },
                      child :  Container(
                        height: 55,
                        margin: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFE7E7E8),
                        ),
                        child: Center(
                          child: Text("العربية", style: TextStyle(color: Color(0xFFF04B4C), fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                      ),),
                  ],
    ),
    ),);}}