import 'package:flutter/material.dart';
import 'colors.dart';


class TextStyles {

  TextStyles._();
  static setTextStyles(){
    bodyTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: text,//Colors.black,
      fontFamily: 'Ubuntu',
    );

    headingTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: red,//Color(0xfff04b4c),
      fontFamily: 'Ubuntu',
    );

    headingTextStyle2 = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: bleu_text,
      fontFamily: 'Ubuntu',
    );
  }

  static final TextStyle felicitation = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    fontFamily: 'Ubuntu',
  );

    static final TextStyle felicitation2 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: 'Ubuntu',
  );

  static final TextStyle appNameTextStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    color: Colors.white.withOpacity(0.7),
    fontFamily: 'Ubuntu',
  );
  static final TextStyle tabBarText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'Ubuntu',
  );

  static  TextStyle bodyTextStyle /*= TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: text,//Colors.black,
    fontFamily: 'Ubuntu',
  )*/;

  static final TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Ubuntu',
  );
  static TextStyle headingTextStyle /*= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: red,//Color(0xfff04b4c),
    fontFamily: 'Ubuntu',
  )*/;
  static TextStyle headingTextStyle2 /*= TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: bleu_text,
    fontFamily: 'Ubuntu',
  )*/;
  static final TextStyle headingTextStyle3 = TextStyle(
    fontSize: 0,
    fontWeight: FontWeight.w600,
    color: Colors.transparent,
    fontFamily: 'Ubuntu',
  );
  static final TextStyle headingTextStyle4 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: bleu.withOpacity(0.6),
    fontFamily: 'Ubuntu',
  );
   static final TextStyle shadowTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black.withOpacity(0.5),
    fontFamily: 'Ubuntu',
  );

  //Text Styles utilser dans la trace___________________ 
  static final TextStyle card_titreTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Ubuntu',
  );
  static final TextStyle card_soustitresTextStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: grey.withOpacity(0.6),
    fontFamily: 'Ubuntu',
  );
  //____________________________________________________
  static final TextStyle slimyCardTextStyle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w600,
    color: Colors.white.withOpacity(0.7),
    fontFamily: 'Ubuntu',
  );

}