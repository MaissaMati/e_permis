import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_permis/back_end/export_all.dart';
import 'package:flutter/material.dart';
import '../creations/export_all.dart';
import '../export_pages.dart';

class Finish_page extends StatefulWidget {
  Apprenant apprenant;
  Finish_page(this.apprenant);
  @override
  _Finish_pageState createState() => _Finish_pageState(apprenant);
}

class _Finish_pageState extends State<Finish_page> {
  final Apprenant x;

  _Finish_pageState(this.x);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector( 
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  TracePage(x)  ));
        },
      child: Container(
        color: bleu,
        child:Stack(
          children:<Widget>[
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Image(image: AssetImage("assets/road.png"),) ,),
            Positioned(
              top:-5,
              right: 0,
              left: 0,
              child: Image(image: AssetImage("assets/party.png"),)),
            Positioned(
              //right:145,
              right: 0,
              left: 0,
              bottom:240,
              child: Text(getTranslated(context, "Bravo !!"),style: TextStyles.felicitation, textAlign: TextAlign.center,),),
            Positioned(
              right:20,
              left:20,
              top: 150,
              child: _typerText(context)),
            Positioned(
              bottom: 25,
              right: 0,
              left: 0,
              child: Text(getTranslated(context,"qliqé")  , textAlign: TextAlign.center, style: TextStyle(color: text, decoration: TextDecoration.underline,),) ,),
          ]
        )
      )
      )
    );
  }
}

Widget _typerText(BuildContext context){
  return SizedBox(
    width: 250.0,
    child: TypewriterAnimatedTextKit( 
      totalRepeatCount: 2,
      pause: Duration(milliseconds:  4000),
      onTap: () {},
      text: [
        getTranslated(context, "felicitation1"),
        getTranslated(context, "felicitation2"),
      ],
      textStyle: TextStyles.felicitation2,
      textAlign: TextAlign.start,
      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
    ),
  );
}