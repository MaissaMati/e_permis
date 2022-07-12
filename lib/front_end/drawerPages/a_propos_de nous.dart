import 'package:e_permis/back_end/export_all.dart';
import '../creations/export_all.dart';
import 'package:flutter/material.dart'; 
class a_propos_de_nous extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
                   leading:  IconButton(
                       icon: Icon(
                         Icons.arrow_back_ios,
                         color: Colors.white,
                               ),
                         onPressed: (){
                           Navigator.pop(context);
                         }, ),
                      actions: <Widget>[
                              Padding(
                                   padding: EdgeInsets.only(right: 20.0,bottom:0,top: 0),
                                             child: Icon(Icons.people,size:30, ),),],
                   title: Text(getTranslated(context, "about_us"),textAlign: TextAlign.center,),
                   shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)), ),
                   backgroundColor: darkblue,

                    ),
                    backgroundColor: white_grey,
      body: SingleChildScrollView(
            
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              

                   SizedBox(height: 30,),
                     Padding(
                         padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                               Text(
                                 getTranslated(context, "about_us_1"),
                                 style: TextStyle(
                                  fontSize:19,
                                  fontWeight:FontWeight.w500,
                                  color: text,
                                  )
                                ,),
                               SizedBox(height: 20,),
                               Text(
                                 getTranslated(context, "about_us_2"),
                                 style: TextStyle(
                                   fontSize:19,
                                   fontWeight:FontWeight.w500,
                                   color: text,
                                  )
                                ),
                              ],), ),
                    /*Padding(
                     padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 0,),*/
                              Divider(height:50,color: text,),
                              Text(getTranslated(context, "membres"),style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: text),),
                              Divider(height:50,color: text,),
                              Text(getTranslated(context, "dalal"),style: TextStyle(fontSize:19,color: text),textAlign: TextAlign.center),
                              Text(getTranslated(context, "yousra"),style: TextStyle(fontSize:19,color: text),textAlign: TextAlign.center),
                              Text(getTranslated(context, "wided"),style: TextStyle(fontSize:19,color: text),textAlign: TextAlign.center),
                              Text(getTranslated(context, "sarra"),style: TextStyle(fontSize:19,color: text),textAlign: TextAlign.center),
                              Text(getTranslated(context, "maissa"),style: TextStyle(fontSize:19,color: text),textAlign: TextAlign.center),
                              Text(getTranslated(context, "chaima"),style: TextStyle(fontSize:19,color: text),textAlign: TextAlign.center,),
                              SizedBox(height: 20,),
                            ],
                          ), 
                        ),
            //],
            //),
          //),
    );
    
    /*Material(
        child : Container(
        decoration: new BoxDecoration(
           image: new DecorationImage(
            image: new AssetImage('assets/images/fond2.png'),
         fit: BoxFit.fill,
          ),
          ),
          child: SingleChildScrollView(
            
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              

                   SizedBox(height: 30,),
                     Padding(
                         padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                               Text(getTranslated(context, "about_us_1"),style: TextStyle(fontSize:19,fontWeight:FontWeight.w500),),
                               SizedBox(height: 20,),
                               Text(getTranslated(context, "about_us_2"),style: TextStyle(fontSize:19,fontWeight:FontWeight.w500)),
                              ],), ),
                    SizedBox(height:0,),
                    Padding(
                     padding: EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 0,),
                              Divider(height:50,color: bleu,),
                              Text(getTranslated(context, "membres"),style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                              Divider(height:50,color: bleu,),
                              Text(getTranslated(context, "dalal"),style: TextStyle(fontSize:19),textAlign: TextAlign.center),
                              Text(getTranslated(context, "yousra"),style: TextStyle(fontSize:19),textAlign: TextAlign.center),
                              Text(getTranslated(context, "wided"),style: TextStyle(fontSize:19),textAlign: TextAlign.center),
                              Text(getTranslated(context, "sarra"),style: TextStyle(fontSize:19),textAlign: TextAlign.center),
                              Text(getTranslated(context, "maissa"),style: TextStyle(fontSize:19),textAlign: TextAlign.center),
                              Text(getTranslated(context, "chaima"),style: TextStyle(fontSize:19,),textAlign: TextAlign.center,),],), ),


            ],
            ),
          ),
            ),
            );
            }*/
  }
}