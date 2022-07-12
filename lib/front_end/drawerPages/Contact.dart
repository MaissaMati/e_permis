import 'package:e_permis/back_end/export_all.dart';
import 'package:e_permis/front_end/creations/colors.dart';
import 'package:flutter/material.dart'  ;
import 'package:gradient_text/gradient_text.dart';

class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold (
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
                         padding: EdgeInsets.only(right: 20.0,),

                           child: Icon(
                               Icons.message,size:30, ),

                      ),],

                       title: Text(getTranslated(context, "contactez nous"),textAlign: TextAlign.center,),
                     shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)), ),
                     backgroundColor: darkblue,
                         ),
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100,),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80),
                  GradientText(
                    getTranslated(context, "Les coordonées"),
                    gradient: LinearGradient(colors:[red,bleu]),
                    style: TextStyle(fontSize:40,   fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 55,width: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon( Icons.phone, color: Color(0xFF3D6098),size: 30.0, ),
                      Text('0011223344',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height:40,width: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon( Icons.email, color: Color(0xFF3D6098),size: 30.0, ),
                      Text('Epermis@gmail.dz',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height:40),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image (
                          image:AssetImage('assets/images/facebook.png',),  
                          height:40,
                        ),
                      ),
                      Expanded( child: Text('E_permis_',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}