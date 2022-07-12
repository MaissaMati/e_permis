import 'export_all.dart';
//import '../scénarisation/export_all.dart';


class Question {
  // attributs
  String _enonce;
  List<String> _propositions;
  Lecon _lecon;
  String _corrige_type;
  num _note;
  var _image;
  //constructor
  Question(this._enonce, this._propositions, this._lecon, this._corrige_type,
      this._note, this._image);
  //setters & gatters
  String get enonce => _enonce;
  set enonce(String value) => _enonce = value;
  List get propositions => _propositions;
  set propositions(List value) => _propositions = value;
  Lecon get lecon => _lecon;
  set lecon(Lecon value) => this._lecon = value;
  String get corrige_type => _corrige_type;
  set corrige_type(String value) => _corrige_type = value;
  num get note => _note;
  set note(num value) => _note = value;
  dynamic get image => _image;
  set image(var Image) => this._image = image;
  // methods
  void afficher() => print("enonce : $_enonce \nproposition\n$_propositions");
  void afficher_corrige_type() => print("corrige type : $corrige_type");
  // redefinitions
  bool operator ==(o) =>
      (o is Question) &&
      (o._corrige_type == this._corrige_type) &&
      (this._enonce == o._enonce) &&
      (o._lecon == this._lecon) &&
      (o._propositions == this._propositions) &&
      (o._note == this._note);
  int get hachCode =>
      _enonce.hashCode +
      _propositions.hashCode +
      _lecon.hachCode +
      _corrige_type.hashCode +
      _note.hashCode;
}

//****************************************************************************************************************************************************************** */

class Reponse_Question {
  // attributs
  Apprenant _apprenant;
  String _choix;
  bool _decision;
  num _note; 
  Question _question;
  // getters & setters
  Apprenant get apprenant => _apprenant;
  set apprenant(Apprenant apprenant) => this._apprenant = apprenant;
  String get choix => _choix;
  set choix(String choix) => this._choix = choix;
  bool get decision => _decision;
  set decision(bool decision) => this._decision = decision;
  num get note => _note;
  set note(num _num) => this._note = _num;
  Question get question => _question;
  set question(Question value) => this._question = value;
  // constructor
  Reponse_Question(
      this._apprenant, this._choix, this._decision, this._note, this._question);
  // methods
  void evaluer() {
    if (this._choix == this._question.corrige_type) {
      this._note = question.note;
      this._decision = true;
    } else {
      this._decision = false;
    }
  }

  // redefinitions

  bool operator ==(o) =>
      (o is Reponse_Question) &&
      (o._apprenant == this._apprenant) &&
      (o._decision == this._decision) &&
      (o._note == this._note) &&
      (o._choix == this._choix) &&
      (o._question == this._question);
  int get hachCode =>
      //_apprenant.hachCode +
      _note.hashCode +
      _choix.hashCode +
      _decision.hashCode +
      _question.hachCode;
}

//****************************************************************************************************************************************************************** */

class Test_Niveau {
  // attributs
  Niveau _niveau;
  Niveau _niveausuivat;
  int _numt;
  List<Question> _list_questions;
  //constructor
  Test_Niveau(this._niveau, this._niveausuivat, this._list_questions);
  // getters & setters
  int get numt=>_numt;
  set numt(int i)=>this._numt=i;
  Niveau get niveau => _niveau;
  set niveau(Niveau niveau) => this._niveau = niveau;
  Niveau get niveausuivat => _niveausuivat;
  set niveausuivat(Niveau niveausuivat) => this._niveausuivat = niveausuivat;
  List get listquestions => _list_questions;
  set listquestions(List value) => _list_questions = value;
  // methods
  // redefinitions
  bool operator ==(o) =>
      (o is Test_Niveau) &&
      (o._list_questions == this._list_questions) &&
      (o._niveau == this._niveau);
  int get hachCode => _list_questions.hashCode + _niveau.hashCode;
}

//****************************************************************************************************************************************************************** */

class Reponse_Niveau {
  // attributs
  Apprenant _apprenant;
  List<Reponse_Question> _list_reponses;
  bool _decision;
  num _note;
  List<Lecon> _list_non_asm;
  Test_Niveau _test_niveau;
  // getters & setters
  Apprenant get apprenant => _apprenant;
  set apprenant(Apprenant apprenant) => this._apprenant = apprenant;
  List get list_reponses => _list_reponses;
  set list_reponses(List value) => this._list_reponses = value;
  bool get decision => _decision;
  set decision(bool decision) => this._decision = decision;
  num get note => _note;
  set note(num _num) => this._note = _num;
  List get list_non_asm => _list_non_asm;
  set list_non_asm(List value) => this._list_non_asm = value;
  Test_Niveau get test_Niveau => _test_niveau;
  set test_Niveau(Test_Niveau value) => this._test_niveau = value;
  // constructor
  Reponse_Niveau(this._apprenant, this._list_reponses, this._decision,
      this._note, this._list_non_asm, this._test_niveau);
  // methods
  void evaluer() {
    int total=0;
    for (int i = 0; (i <= this._list_reponses.length - 1); i++) {
      this._list_reponses.elementAt(i).evaluer();
      print('\n qstn $i resultat : ${this._list_reponses.elementAt(i).decision}');
      if (this._list_reponses.elementAt(i).decision == true) {
        this.note += list_reponses.elementAt(i).note;
      } else {
        this.list_non_asm.add(this.list_reponses.elementAt(i).question.lecon);
      }
      total += list_reponses.elementAt(i).question.note;
    }
    if (this._note >= (total/2)) {
      this._decision = true;
    }
  } 

  // redefinitions
  bool operator ==(o) =>
      (o is Reponse_Niveau) &&
      (o._apprenant == this._apprenant) &&
      (o._decision == this._decision) &&
      (o._list_non_asm == this._list_non_asm) &&
      (o._list_reponses == this._list_reponses) &&
      (o._note == this._note) &&
      (o._test_niveau == this._test_niveau);
  int get hachCode =>
      //_apprenant.hachCode +
      _list_reponses.hashCode +
      _decision.hashCode +
      _note.hashCode +
      _list_non_asm.hashCode +
      _test_niveau.hachCode;
}


