import 'export_all.dart';
import '../scénarisation/export_all.dart';
import '../main.dart';
import 'BDD/db.dart';


class App {
  // attributs
  Map<Niveau, List<Themee>> _list_themes;
  List<Test_Niveau> _list_tests;
  List<Test_Niveau> _test_categorisation;
  Map<String, Apprenant> _apprenants;
  //constructor
  App(this._list_themes, this._list_tests,this._test_categorisation, this._apprenants);
  //setters & getters
  Map get list_themes => _list_themes;
  set list_themes(Map list_themes) => this._list_themes = list_themes;
  List get list_tests => _list_tests;
  set list_tests(List value) => _list_tests = value;
  List get test_categorisation => _test_categorisation;
  set test_categorisation(List value) => _test_categorisation = value;
  Map get list_apprenants => _apprenants;
  set apprenants(Map value) => _apprenants = value;
  // methods
  Apprenant inscription(String nom, String email, String mp) {
    Apprenant apprenant = Apprenant.withtrace(nom, email, mp, Trace(Niveau.DEBUTANT,null, null, null,null,null, [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0],),null,null);
    (list_apprenants == null)? _apprenants={email:apprenant, }:
    list_apprenants.putIfAbsent(email, () => apprenant);
    return apprenant;
  }
  Apprenant connexion(String email, String mp) { 
    Apprenant piip = list_apprenants[email];
    //cet_utilisateur = piip; 
    return piip;
  }
}

//****************************************************************************************************************************************************************** */

class Language {
  final int id;
 
  final String name;
  final String languageCode;

  Language(this.id,  this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "Francais", "fr"),      
      Language(2, "اَلْعَرَبِيَّةُ‎", "ar"),
      
    ];
  }
}

//****************************************************************************************************************************************************************** */

class Admin {
  // attributs
  String _email;
  String _mp;
  App app;
  //constructor
  Admin(this._email, this._mp,this.app);
  // getters & setters
  String get getEmail => _email;
  set Email(String email) => this._email = email;
  String get getMp => _mp;
  set Mp(String mp) => this._mp = mp;
  App get getApp => app;
  set Application(App app) => this.app = app;
  // methods
  //void modifier_lecon(Lecon lecon) {}
  //void ajouter_lecon(Lecon lecon) {}
  Apprenant rechercher_apprenant(String email) =>  app.list_apprenants[email];
  void supprimer_apprenant(Apprenant apprenant) => app.list_apprenants.remove(apprenant.email);
  // redefinitions
  bool operator ==(o) =>
      (o is Admin) && (o._email == this._email) && (o._mp == this._mp);
  int get hachCode => _email.hashCode + _mp.hashCode;
}

//****************************************************************************************************************************************************************** */
/*
class Apprenant { 
  String _nom;
  String _email;
  String _mot_de_passe;
  Trace _trace;
  //constructor
  Apprenant(this._nom, this._email, this._mot_de_passe, this._trace);
  //seters and geters
  String get nom => _nom;
  set nom(String value) => _nom = value;
  String get email => _email;
  set email(String value) => _email = value;
  String get mot_de_passe => _mot_de_passe;
  set mot_de_passe(String value) => _mot_de_passe = value;
  Trace get getTrace => _trace;
  set setTrace(Trace trace) => this._trace = trace;
  // methods
  void archiver_question(Question question) {
    this._trace._archive_qstn == null ?     this._trace._archive_qstn =[question]: this._trace.archive_qstn.add(question);
  }
  void consulter_lecon(Lecon lecon) {
    //lecon.afficher();
    this._trace.archive_lecons == null ?   this.getTrace._archive_lecons = [lecon]: this._trace.archive_lecons.add(lecon);
  }

  void consulter_question(Question question) => question.afficher();

  Reponse_Question repondre_question(Question question, String choix) {
    Reponse_Question repQ = new Reponse_Question(this, choix, false, 0, question);
    archiver_question(question);
    this.getTrace.archiveReponse==null?
      this.getTrace._archiveReponse=[repQ]:
      this.getTrace.archiveReponse.add(repQ);
    return repQ;
  }

  Reponse_Niveau passer_test_Niveau(Test_Niveau testN, List<String> choix) {
    List<Reponse_Question> list_reponses = new List<Reponse_Question>();
    for (int i = 0; (i <= testN.listquestions.length - 1); i++) {
      list_reponses.add(repondre_question( testN.listquestions.elementAt(i), choix.elementAt(i)));
    }
    List<Lecon> list_non_asm = new List<Lecon>();
    Reponse_Niveau repniv = new Reponse_Niveau(this, list_reponses, false, 0, list_non_asm, testN);
    //archiver ce test
    this._trace.archive_tests == null ?   this.getTrace._archive_tests = [testN]: this._trace.archive_tests.add(testN);
    return repniv;
  }

  Niveau passer_test_categorisation(List<Test_Niveau> test_categorisation, List<List<String>> choix) {
    Niveau niveau = Niveau.DEBUTANT;
    int cpt = 0;  
    for (int i = 0; i <= test_categorisation.length - 1; i++) {
      Reponse_Niveau reponseNiveau = passer_test_Niveau(test_categorisation[i], choix[i]);
      reponseNiveau.evaluer();
      print(reponseNiveau.decision.toString());
      if ((reponseNiveau.decision == true) && (cpt == 0)) {
        print("${niveau.toString}");
        niveau = test_categorisation[i].niveausuivat;
      } else {
        cpt++;
      }
    }
    return niveau;
  }

  // redefinitions
  @override
  bool operator ==(o) =>
      (o is Apprenant) &&
      (o._nom == this._nom) &&
      (o._email == this._email) &&
      (o._mot_de_passe == this._mot_de_passe) &&
      (o._trace == this._trace);
  int get hachCode =>
      _nom.hashCode +
      _email.hashCode +
      _mot_de_passe.hashCode +
      _trace.hashCode;
}

//****************************************************************************************************************************************************************** */

class Trace {
  // attributs
  Niveau _niveau;
  Themee _theme;
  List<Lecon> _archive_lecons;
  List<Test_Niveau> _archive_tests;
  List<Question> _archive_qstn;
  List<Reponse_Question> _archiveReponse;
  List<Reponse_Niveau> _archiveReponseNiveau;

  List<int> _scoreTestNiveau;
  List<int> _totalTestNiveau;
  List<int> _cptTestNiveau;

  // getters & setters
  Niveau get niveau => _niveau;
  set niveau(Niveau niveau) => this._niveau = niveau;
  Themee get themee => _theme;
  set theme(Themee value) => _theme = value;
  List get archive_lecons => _archive_lecons;
  set archive_lecons(List value) => this._archive_lecons = value;
  List get archive_tests => _archive_tests;
  set archive_tests(List value) => this._archive_tests = value;
  List get archive_qstn => _archive_qstn;
  set archive_qstn(List value) => this._archive_qstn = value;

  List get archiveReponse => this._archiveReponse;
  set archiveReponse(List value) => _archiveReponse = value;
  List get archiveReponseNiveau => this._archiveReponseNiveau;
  set archiveReponseNiveau(List value) => _archiveReponseNiveau = value;
  
  // constructor
  Trace(this._niveau, this._theme, this._archive_lecons, this._archive_tests,this._archive_qstn,this._archiveReponse,this._archiveReponseNiveau);
  // methods
  // redefinitions
  bool operator ==(o) =>
      (o is Trace) &&
      (o._archive_lecons == this._archive_lecons) &&
      (o._archive_qstn == this._archive_qstn) &&
      (o._archive_tests == o._archive_tests) &&
      (o._niveau == this._niveau) &&
      (o._theme == this._theme);
  int get hachCode =>
      _archive_lecons.hashCode +
      _archive_qstn.hashCode +
      _archive_tests.hashCode +
      _niveau.hashCode +
      _theme.hachCode;
}*/