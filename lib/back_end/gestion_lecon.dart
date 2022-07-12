import 'package:flutter/material.dart';

import 'export_all.dart';
//import '../scénarisation/export_all.dart';


enum Niveau { DEBUTANT, INTERMIDIAIRE, EXPERT }

//****************************************************************************************************************************************************************** */

class Themee {
  //attributs
  String _nom;
  Map<Lecon, List<Question>> _list_Lecons;
  Niveau _niveau;
  //constructor
  Themee(this._nom, this._niveau, this._list_Lecons);
  //seters & gaters
  String get nom => _nom;
  set nom(String value) => _nom = value;
  Niveau get niveau => _niveau;
  set niveau(Niveau niveau) => this._niveau = niveau;
  Map<Lecon, List<Question>> get list_Lecon => _list_Lecons;
  set list_Lecon(Map<Lecon, List<Question>>list_lecon) => this._list_Lecons = list_lecon;
  // methods
  // redefinitions
  bool operator ==(o) =>
      (o is Themee) &&
      (o._list_Lecons == this._list_Lecons) &&
      (o._niveau == this._niveau) &&
      (o._nom == this._nom);
  int get hachCode => _niveau.hashCode + _list_Lecons.hashCode + _nom.hashCode;
}

//****************************************************************************************************************************************************************** */
 
class Lecon {
  // attributs
  String _nom;
  String _image;
  List<Partie>    _list_parties;
  Niveau niveau;
  Widget _page;
  
  //constructor
  Lecon(this._nom, this._list_parties, this._image,this.niveau,this._page);
  //getters and setters
  String get nom => _nom;
  set nom(String value) => _nom = value;
  List get list_parties => _list_parties;
  set list_parties(List value) => _list_parties = value;
  String get image => _image;
  set image(String image) => this._image = image;
  Widget get page => _page;
  set page(Widget value) => _page = value;
  
  // methods
  void afficher() =>
      print("nom: $_nom\n");
  // redefinitions
  bool operator ==(o) =>(o is Lecon) && (o._list_parties == this._list_parties) &&(o._nom == this._nom);
  int get hachCode =>_nom.hashCode +_list_parties.hashCode;
}

//****************************************************************************************************************************************************************** */

class Partie {  
  // attributs
     String          _nom;
     String          _contenu;
     String          _image;
  //constructor
     Partie(this._nom,this._contenu,this._image);
  //getters and setters
       String get nom => _nom;
       set nom(String value) => _nom = value;
       String get contenu => _contenu;
       set contenu(String value) => _contenu = value; 
       String get image => _image;
       set image (String image)=>this._image=image;
  // redefinitions
      bool operator ==(o) =>(o is Partie)&&(o._contenu==this._contenu)&&(o._nom==this._nom);
      int get hachCode => _nom.hashCode+_contenu.hashCode;
} 
