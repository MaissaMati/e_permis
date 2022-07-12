import 'package:e_permis/back_end/export_all.dart';
import 'package:flutter/material.dart';
import '../export_pages.dart';
import 'colors.dart';

AppBar appbar(String text, BuildContext context, {bool trace, Apprenant apprenant}) {
  return AppBar(
      elevation: 0.2,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          if (trace!=null) Navigator.push(context,MaterialPageRoute(builder: (context) => TracePage(apprenant),));
          else Navigator.pop(context);
        },
      ),
      title: Text(
        //getTranslated(context, text),
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: darkblue);
}

AppBar test_appbar(String text, BuildContext context, {bool trace, Apprenant apprenant}) {
  return AppBar(
      elevation: 0.2,
      centerTitle: true,
      /*leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          if (trace!=null) Navigator.push(context,MaterialPageRoute(builder: (context) => TracePage(apprenant),));
          else Navigator.pop(context);
        },
      ),*/
      title: Text(
        //getTranslated(context, text),
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: darkblue);
}
/*AppBar appbar(String text) {
  return AppBar(
    elevation: 0.2,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        // go back
      },
    ),
    title: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            //Color(0xFF989E9C),
            Color(0xffd2b2fc),
            Color(0xFF00F2A9),
          ],
        ),
      ),
    ),
  );
}*/