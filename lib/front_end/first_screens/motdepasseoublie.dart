import 'package:e_permis/back_end/export_all.dart';
import 'package:flutter/material.dart'  ;
class motdepasseoublie extends StatelessWidget{
  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
             width: double.infinity,
             decoration: BoxDecoration(
             color:Color(0xFF213159), ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                          SizedBox(height:50,),
                        Row(children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white,), 
                            onPressed: (){}, 
                          ),
                          SizedBox(width:40 ,),
                          Text(getTranslated(context, "recup_mp"),style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                        ],),

                  Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                     children:[
                       SizedBox(height:200 ,),
                       Container(
                         height: 70,
                         width: 300,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 50,right:50),
                   padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                     decoration: BoxDecoration(

                     border: Border.all(color: Colors.white),
                       borderRadius: BorderRadius.circular(12.0),
                      shape: BoxShape.rectangle,
                     color: Colors.white,
             ),
                            child: TextField(
                           style: TextStyle(color: Colors.black, fontSize: 16.0),
                            decoration: InputDecoration(
                              hintText: getTranslated(context,"Email"),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xFF213159),
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  maxLines: null,
                        ),
                   ),
                       SizedBox(height: 20,),
                       Text(getTranslated(context,"mp_recupere_"),style: TextStyle(color:Colors.white,),textAlign: TextAlign.center,),
                      SizedBox(height:120),
                       CircleAvatar(
                         radius:30,
                         backgroundColor: Colors.white,
                           child :IconButton(
                                icon: Icon(Icons.arrow_forward_ios, color:Colors.black,), onPressed: (){
                       }, ),),
                     ]
                    ,),],
                ),),);}}



