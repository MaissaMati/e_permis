import 'package:e_permis/back_end/export_all.dart';
import 'package:e_permis/front_end/export_pages.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final icon;
  final String page;
  final Apprenant ap;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText, 
    @required this.icon, 
    @required this.ap, 
    @required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
    children: <Widget>[      
      Container(
        padding: EdgeInsets.only(
          top: Consts.avatarRadius + Consts.padding,
          bottom: Consts.padding,
          left: Consts.padding,
          right: Consts.padding,
        ),
        margin: EdgeInsets.only(top: Consts.avatarRadius),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
          boxShadow: [
            BoxShadow(
              color: darkblue,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Text(
              //getTranslated(context, title),
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: darkblue,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              //getTranslated(context, description),
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: darkblue,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 24.0),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: bleu,
                onPressed: () {
                  _pressed(page,context);
                  //_pressed(page);
                  /*Navigator.of(context).pop(); // yroh la qstn
                  Navigator.of(context).pop(); // da5el le cour
                  Navigator.of(context).pop(); // ye5rej la trace*/
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => TracePage(ap) ),);
                },
                child: Text(
                  //getTranslated(context, buttonText),
                  buttonText,
                  style: TextStyle(
                    color: red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        left: Consts.padding,
        right: Consts.padding,
        child: CircleAvatar(
          backgroundColor: darkblue,
          radius: Consts.avatarRadius,
        ),
      ),
      Positioned(
        top: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
        child: Icon(
          icon,
          size: 90,
          color: red,
        ),
      ),
    ],
  ),
    );
  }

  _pressed(String page,BuildContext context){
    switch(page){
      case 'trace':
        //Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.push(context,MaterialPageRoute(builder: (context) => TracePage(ap) ),);
      break;
      case 'pop':
        Navigator.of(context).pop();
      break;
    }
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
