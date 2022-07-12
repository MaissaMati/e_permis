import 'package:e_permis/front_end/creations/export_all.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

//bool dark_theme= true;

Color red ;
Color darkblue ;
Color bleu ;
Color grey, red_grey ;
Color white ,bleu_red;
Color semi_white,grey_white ;
Color theme1,white_grey, grey_black;
Color theme2, tab_label,text,bleu_text;

changeTheme() async{
  dark_theme = !dark_theme;
  setColors();
  print('\n \n changed theme : (new) $dark_theme');
}

setColors() async{
  white = dark_theme? Colors.black: Colors.white;
  grey  = dark_theme? Color(0xFF333333) : Color(0xFFE7E7E7);
  semi_white = dark_theme? Colors.black : Color(0xFFE7E7E7);
  bleu  = dark_theme? Color(0xFF121212) : Color(0xFF3D6098);
  darkblue  = dark_theme? Colors.blue[900] : Color(0xFF213159);
  red  = dark_theme?  Colors.blue[700] : Color(0xFFF04B4C);
  theme1  = dark_theme? Colors.blue[200] : Colors.red[200];
  theme2  = dark_theme? Colors.blue : Colors.red[300];
  tab_label = dark_theme? Colors.white : Color(0xFF213159);
  text = dark_theme? Colors.white : Colors.black;
  bleu_text = dark_theme? Colors.blue[200] : Color(0xFF3D6098);
  white_grey = dark_theme? Color(0xFF121212) : Colors.white;
  grey_white = dark_theme? Colors.white: Color(0xFF121212) ;
  grey_black = dark_theme? Color(0xFF121212) : Color(0xFFE5E5E5);
  bleu_red = dark_theme? Color(0xFFF04B4C) : Color(0xFF213159);
  red_grey = dark_theme? Color(0xFF6A6866) : Color(0xFFF04B4C);

  TextStyles.setTextStyles();
}

ThemeData my_theme =  ThemeData.light();  //ThemeData.dark();