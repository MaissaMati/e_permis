// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Apprenant extends DataClass implements Insertable<Apprenant> {
  final int id_app;
  final String nom;
  final String email;
  final String mot_de_passe;
   String nv;
   Trace _trace;
   
    Apprenant.withtrace(this.nom, this.email, this.mot_de_passe, this._trace, this.id_app,this.nv);
  
  Apprenant(
      {this.id_app,
      @required this.nom,
      @required this.email,
      @required this.mot_de_passe,
      this.nv});
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

  Niveau passer_test_categorisation(
      List<Test_Niveau> test_categorisation, List<List<String>> choix) {
    Niveau niveau = Niveau.DEBUTANT;
    int cpt = 0;  
    for (int i = 0; i <= test_categorisation.length - 1; i++) {
      Reponse_Niveau reponseNiveau =
          passer_test_Niveau(test_categorisation[i], choix[i]);
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
  factory Apprenant.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Apprenant(
      id_app: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_app']),
      nom: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nom']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      mot_de_passe: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mot_de_passe']),
      nv: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nv']),
    );
  }
  factory Apprenant.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Apprenant(
      id_app: serializer.fromJson<int>(json['id_app']),
      nom: serializer.fromJson<String>(json['nom']),
      email: serializer.fromJson<String>(json['email']),
      mot_de_passe: serializer.fromJson<String>(json['mot_de_passe']),
      nv: serializer.fromJson<String>(json['nv']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id_app': serializer.toJson<int>(id_app),
      'nom': serializer.toJson<String>(nom),
      'email': serializer.toJson<String>(email),
      'mot_de_passe': serializer.toJson<String>(mot_de_passe),
      'nv': serializer.toJson<String>(nv),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Apprenant>>(bool nullToAbsent) {
    return ApprenantsCompanion(
      id_app:
          id_app == null && nullToAbsent ? const Value.absent() : Value(id_app),
      nom: nom == null && nullToAbsent ? const Value.absent() : Value(nom),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      mot_de_passe: mot_de_passe == null && nullToAbsent
          ? const Value.absent()
          : Value(mot_de_passe),
      nv: nv == null && nullToAbsent ? const Value.absent() : Value(nv),
    ) as T;
  }

  Apprenant copyWith(
          {int id_app,
          String nom,
          String email,
          String mot_de_passe,
          String nv}) =>
      Apprenant(
        id_app: id_app ?? this.id_app,
        nom: nom ?? this.nom,
        email: email ?? this.email,
        mot_de_passe: mot_de_passe ?? this.mot_de_passe,
        nv: nv ?? this.nv,
      );
  @override
  String toString() {
    return (StringBuffer('Apprenant(')
          ..write('id_app: $id_app, ')
          ..write('nom: $nom, ')
          ..write('email: $email, ')
          ..write('mot_de_passe: $mot_de_passe, ')
          ..write('nv: $nv')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id_app.hashCode,
      $mrjc(nom.hashCode,
          $mrjc(email.hashCode, $mrjc(mot_de_passe.hashCode, nv.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Apprenant &&
          other.id_app == id_app &&
          other.nom == nom &&
          other.email == email &&
          other.mot_de_passe == mot_de_passe &&
          other.nv == nv);
}

class ApprenantsCompanion extends UpdateCompanion<Apprenant> {
  final Value<int> id_app;
  final Value<String> nom;
  final Value<String> email;
  final Value<String> mot_de_passe;
  final Value<String> nv;
  const ApprenantsCompanion({
    this.id_app = const Value.absent(),
    this.nom = const Value.absent(),
    this.email = const Value.absent(),
    this.mot_de_passe = const Value.absent(),
    this.nv = const Value.absent(),
  });
  ApprenantsCompanion copyWith(
      {Value<int> id_app,
      Value<String> nom,
      Value<String> email,
      Value<String> mot_de_passe,
      Value<String> nv}) {
    return ApprenantsCompanion(
      id_app: id_app ?? this.id_app,
      nom: nom ?? this.nom,
      email: email ?? this.email,
      mot_de_passe: mot_de_passe ?? this.mot_de_passe,
      nv: nv ?? this.nv,
    );
  }
}

class $ApprenantsTable extends Apprenants
    with TableInfo<$ApprenantsTable, Apprenant> {
  final GeneratedDatabase _db;
  final String _alias;
  $ApprenantsTable(this._db, [this._alias]);
  final VerificationMeta _id_appMeta = const VerificationMeta('id_app');
  GeneratedIntColumn _id_app;
  @override
  GeneratedIntColumn get id_app => _id_app ??= _constructIdApp();
  GeneratedIntColumn _constructIdApp() {
    return GeneratedIntColumn(
      'id_app',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nomMeta = const VerificationMeta('nom');
  GeneratedTextColumn _nom;
  @override
  GeneratedTextColumn get nom => _nom ??= _constructNom();
  GeneratedTextColumn _constructNom() {
    return GeneratedTextColumn(
      'nom',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mot_de_passeMeta =
      const VerificationMeta('mot_de_passe');
  GeneratedTextColumn _mot_de_passe;
  @override
  GeneratedTextColumn get mot_de_passe =>
      _mot_de_passe ??= _constructMotDePasse();
  GeneratedTextColumn _constructMotDePasse() {
    return GeneratedTextColumn(
      'mot_de_passe',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nvMeta = const VerificationMeta('nv');
  GeneratedTextColumn _nv;
  @override
  GeneratedTextColumn get nv => _nv ??= _constructNv();
  GeneratedTextColumn _constructNv() {
    return GeneratedTextColumn(
      'nv',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id_app, nom, email, mot_de_passe, nv];
  @override
  $ApprenantsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'apprenants';
  @override
  final String actualTableName = 'apprenants';
  @override
  VerificationContext validateIntegrity(ApprenantsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id_app.present) {
      context.handle(
          _id_appMeta, id_app.isAcceptableValue(d.id_app.value, _id_appMeta));
    } else if (id_app.isRequired && isInserting) {
      context.missing(_id_appMeta);
    }
    if (d.nom.present) {
      context.handle(_nomMeta, nom.isAcceptableValue(d.nom.value, _nomMeta));
    } else if (nom.isRequired && isInserting) {
      context.missing(_nomMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.mot_de_passe.present) {
      context.handle(
          _mot_de_passeMeta,
          mot_de_passe.isAcceptableValue(
              d.mot_de_passe.value, _mot_de_passeMeta));
    } else if (mot_de_passe.isRequired && isInserting) {
      context.missing(_mot_de_passeMeta);
    }
    if (d.nv.present) {
      context.handle(_nvMeta, nv.isAcceptableValue(d.nv.value, _nvMeta));
    } else if (nv.isRequired && isInserting) {
      context.missing(_nvMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Apprenant map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Apprenant.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ApprenantsCompanion d) {
    final map = <String, Variable>{};
    if (d.id_app.present) {
      map['id_app'] = Variable<int, IntType>(d.id_app.value);
    }
    if (d.nom.present) {
      map['nom'] = Variable<String, StringType>(d.nom.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.mot_de_passe.present) {
      map['mot_de_passe'] = Variable<String, StringType>(d.mot_de_passe.value);
    }
    if (d.nv.present) {
      map['nv'] = Variable<String, StringType>(d.nv.value);
    }
    return map;
  }

  @override
  $ApprenantsTable createAlias(String alias) {
    return $ApprenantsTable(_db, alias);
  }
}

class Historique extends DataClass implements Insertable<Historique> {
  final int id_cours;
  final String niveau;
  final String mail;
  final String coure;
  Historique(
      {@required this.id_cours,
      @required this.niveau,
      @required this.mail,
      @required this.coure});
  factory Historique.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Historique(
      id_cours:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_cours']),
      niveau:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}niveau']),
      mail: stringType.mapFromDatabaseResponse(data['${effectivePrefix}mail']),
      coure:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}coure']),
    );
  }
  factory Historique.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Historique(
      id_cours: serializer.fromJson<int>(json['id_cours']),
      niveau: serializer.fromJson<String>(json['niveau']),
      mail: serializer.fromJson<String>(json['mail']),
      coure: serializer.fromJson<String>(json['coure']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id_cours': serializer.toJson<int>(id_cours),
      'niveau': serializer.toJson<String>(niveau),
      'mail': serializer.toJson<String>(mail),
      'coure': serializer.toJson<String>(coure),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Historique>>(bool nullToAbsent) {
    return HistoriquesCompanion(
      id_cours: id_cours == null && nullToAbsent
          ? const Value.absent()
          : Value(id_cours),
      niveau:
          niveau == null && nullToAbsent ? const Value.absent() : Value(niveau),
      mail: mail == null && nullToAbsent ? const Value.absent() : Value(mail),
      coure:
          coure == null && nullToAbsent ? const Value.absent() : Value(coure),
    ) as T;
  }

  Historique copyWith(
          {int id_cours, String niveau, String mail, String coure}) =>
      Historique(
        id_cours: id_cours ?? this.id_cours,
        niveau: niveau ?? this.niveau,
        mail: mail ?? this.mail,
        coure: coure ?? this.coure,
      );
  @override
  String toString() {
    return (StringBuffer('Historique(')
          ..write('id_cours: $id_cours, ')
          ..write('niveau: $niveau, ')
          ..write('mail: $mail, ')
          ..write('coure: $coure')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id_cours.hashCode,
      $mrjc(niveau.hashCode, $mrjc(mail.hashCode, coure.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Historique &&
          other.id_cours == id_cours &&
          other.niveau == niveau &&
          other.mail == mail &&
          other.coure == coure);
}

class HistoriquesCompanion extends UpdateCompanion<Historique> {
  final Value<int> id_cours;
  final Value<String> niveau;
  final Value<String> mail;
  final Value<String> coure;
  const HistoriquesCompanion({
    this.id_cours = const Value.absent(),
    this.niveau = const Value.absent(),
    this.mail = const Value.absent(),
    this.coure = const Value.absent(),
  });
  HistoriquesCompanion copyWith(
      {Value<int> id_cours,
      Value<String> niveau,
      Value<String> mail,
      Value<String> coure}) {
    return HistoriquesCompanion(
      id_cours: id_cours ?? this.id_cours,
      niveau: niveau ?? this.niveau,
      mail: mail ?? this.mail,
      coure: coure ?? this.coure,
    );
  }
}

class $HistoriquesTable extends Historiques
    with TableInfo<$HistoriquesTable, Historique> {
  final GeneratedDatabase _db;
  final String _alias;
  $HistoriquesTable(this._db, [this._alias]);
  final VerificationMeta _id_coursMeta = const VerificationMeta('id_cours');
  GeneratedIntColumn _id_cours;
  @override
  GeneratedIntColumn get id_cours => _id_cours ??= _constructIdCours();
  GeneratedIntColumn _constructIdCours() {
    return GeneratedIntColumn('id_cours', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _niveauMeta = const VerificationMeta('niveau');
  GeneratedTextColumn _niveau;
  @override
  GeneratedTextColumn get niveau => _niveau ??= _constructNiveau();
  GeneratedTextColumn _constructNiveau() {
    return GeneratedTextColumn(
      'niveau',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mailMeta = const VerificationMeta('mail');
  GeneratedTextColumn _mail;
  @override
  GeneratedTextColumn get mail => _mail ??= _constructMail();
  GeneratedTextColumn _constructMail() {
    return GeneratedTextColumn(
      'mail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coureMeta = const VerificationMeta('coure');
  GeneratedTextColumn _coure;
  @override
  GeneratedTextColumn get coure => _coure ??= _constructCoure();
  GeneratedTextColumn _constructCoure() {
    return GeneratedTextColumn(
      'coure',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id_cours, niveau, mail, coure];
  @override
  $HistoriquesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'historiques';
  @override
  final String actualTableName = 'historiques';
  @override
  VerificationContext validateIntegrity(HistoriquesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id_cours.present) {
      context.handle(_id_coursMeta,
          id_cours.isAcceptableValue(d.id_cours.value, _id_coursMeta));
    } else if (id_cours.isRequired && isInserting) {
      context.missing(_id_coursMeta);
    }
    if (d.niveau.present) {
      context.handle(
          _niveauMeta, niveau.isAcceptableValue(d.niveau.value, _niveauMeta));
    } else if (niveau.isRequired && isInserting) {
      context.missing(_niveauMeta);
    }
    if (d.mail.present) {
      context.handle(
          _mailMeta, mail.isAcceptableValue(d.mail.value, _mailMeta));
    } else if (mail.isRequired && isInserting) {
      context.missing(_mailMeta);
    }
    if (d.coure.present) {
      context.handle(
          _coureMeta, coure.isAcceptableValue(d.coure.value, _coureMeta));
    } else if (coure.isRequired && isInserting) {
      context.missing(_coureMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_cours};
  @override
  Historique map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Historique.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(HistoriquesCompanion d) {
    final map = <String, Variable>{};
    if (d.id_cours.present) {
      map['id_cours'] = Variable<int, IntType>(d.id_cours.value);
    }
    if (d.niveau.present) {
      map['niveau'] = Variable<String, StringType>(d.niveau.value);
    }
    if (d.mail.present) {
      map['mail'] = Variable<String, StringType>(d.mail.value);
    }
    if (d.coure.present) {
      map['coure'] = Variable<String, StringType>(d.coure.value);
    }
    return map;
  }

  @override
  $HistoriquesTable createAlias(String alias) {
    return $HistoriquesTable(_db, alias);
  }
}

class Evaluation extends DataClass implements Insertable<Evaluation> {
  final int id_quest;
  final String mail;
  final String enonce;
  final String coure;
  final bool repanse;
  final String couriger;
  final int note;
  Evaluation(
      {@required this.id_quest,
      @required this.mail,
      @required this.enonce,
      @required this.coure,
      @required this.repanse,
      @required this.couriger,
      @required this.note});
  factory Evaluation.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Evaluation(
      id_quest:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_quest']),
      mail: stringType.mapFromDatabaseResponse(data['${effectivePrefix}mail']),
      enonce:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}enonce']),
      coure:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}coure']),
      repanse:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}repanse']),
      couriger: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}couriger']),
      note: intType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
    );
  }
  factory Evaluation.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Evaluation(
      id_quest: serializer.fromJson<int>(json['id_quest']),
      mail: serializer.fromJson<String>(json['mail']),
      enonce: serializer.fromJson<String>(json['enonce']),
      coure: serializer.fromJson<String>(json['coure']),
      repanse: serializer.fromJson<bool>(json['repanse']),
      couriger: serializer.fromJson<String>(json['couriger']),
      note: serializer.fromJson<int>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id_quest': serializer.toJson<int>(id_quest),
      'mail': serializer.toJson<String>(mail),
      'enonce': serializer.toJson<String>(enonce),
      'coure': serializer.toJson<String>(coure),
      'repanse': serializer.toJson<bool>(repanse),
      'couriger': serializer.toJson<String>(couriger),
      'note': serializer.toJson<int>(note),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Evaluation>>(bool nullToAbsent) {
    return EvaluationsCompanion(
      id_quest: id_quest == null && nullToAbsent
          ? const Value.absent()
          : Value(id_quest),
      mail: mail == null && nullToAbsent ? const Value.absent() : Value(mail),
      enonce:
          enonce == null && nullToAbsent ? const Value.absent() : Value(enonce),
      coure:
          coure == null && nullToAbsent ? const Value.absent() : Value(coure),
      repanse: repanse == null && nullToAbsent
          ? const Value.absent()
          : Value(repanse),
      couriger: couriger == null && nullToAbsent
          ? const Value.absent()
          : Value(couriger),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    ) as T;
  }

  Evaluation copyWith(
          {int id_quest,
          String mail,
          String enonce,
          String coure,
          bool repanse,
          String couriger,
          int note}) =>
      Evaluation(
        id_quest: id_quest ?? this.id_quest,
        mail: mail ?? this.mail,
        enonce: enonce ?? this.enonce,
        coure: coure ?? this.coure,
        repanse: repanse ?? this.repanse,
        couriger: couriger ?? this.couriger,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Evaluation(')
          ..write('id_quest: $id_quest, ')
          ..write('mail: $mail, ')
          ..write('enonce: $enonce, ')
          ..write('coure: $coure, ')
          ..write('repanse: $repanse, ')
          ..write('couriger: $couriger, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id_quest.hashCode,
      $mrjc(
          mail.hashCode,
          $mrjc(
              enonce.hashCode,
              $mrjc(
                  coure.hashCode,
                  $mrjc(repanse.hashCode,
                      $mrjc(couriger.hashCode, note.hashCode)))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Evaluation &&
          other.id_quest == id_quest &&
          other.mail == mail &&
          other.enonce == enonce &&
          other.coure == coure &&
          other.repanse == repanse &&
          other.couriger == couriger &&
          other.note == note);
}

class EvaluationsCompanion extends UpdateCompanion<Evaluation> {
  final Value<int> id_quest;
  final Value<String> mail;
  final Value<String> enonce;
  final Value<String> coure;
  final Value<bool> repanse;
  final Value<String> couriger;
  final Value<int> note;
  const EvaluationsCompanion({
    this.id_quest = const Value.absent(),
    this.mail = const Value.absent(),
    this.enonce = const Value.absent(),
    this.coure = const Value.absent(),
    this.repanse = const Value.absent(),
    this.couriger = const Value.absent(),
    this.note = const Value.absent(),
  });
  EvaluationsCompanion copyWith(
      {Value<int> id_quest,
      Value<String> mail,
      Value<String> enonce,
      Value<String> coure,
      Value<bool> repanse,
      Value<String> couriger,
      Value<int> note}) {
    return EvaluationsCompanion(
      id_quest: id_quest ?? this.id_quest,
      mail: mail ?? this.mail,
      enonce: enonce ?? this.enonce,
      coure: coure ?? this.coure,
      repanse: repanse ?? this.repanse,
      couriger: couriger ?? this.couriger,
      note: note ?? this.note,
    );
  }
}

class $EvaluationsTable extends Evaluations
    with TableInfo<$EvaluationsTable, Evaluation> {
  final GeneratedDatabase _db;
  final String _alias;
  $EvaluationsTable(this._db, [this._alias]);
  final VerificationMeta _id_questMeta = const VerificationMeta('id_quest');
  GeneratedIntColumn _id_quest;
  @override
  GeneratedIntColumn get id_quest => _id_quest ??= _constructIdQuest();
  GeneratedIntColumn _constructIdQuest() {
    return GeneratedIntColumn('id_quest', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _mailMeta = const VerificationMeta('mail');
  GeneratedTextColumn _mail;
  @override
  GeneratedTextColumn get mail => _mail ??= _constructMail();
  GeneratedTextColumn _constructMail() {
    return GeneratedTextColumn(
      'mail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _enonceMeta = const VerificationMeta('enonce');
  GeneratedTextColumn _enonce;
  @override
  GeneratedTextColumn get enonce => _enonce ??= _constructEnonce();
  GeneratedTextColumn _constructEnonce() {
    return GeneratedTextColumn(
      'enonce',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coureMeta = const VerificationMeta('coure');
  GeneratedTextColumn _coure;
  @override
  GeneratedTextColumn get coure => _coure ??= _constructCoure();
  GeneratedTextColumn _constructCoure() {
    return GeneratedTextColumn(
      'coure',
      $tableName,
      false,
    );
  }

  final VerificationMeta _repanseMeta = const VerificationMeta('repanse');
  GeneratedBoolColumn _repanse;
  @override
  GeneratedBoolColumn get repanse => _repanse ??= _constructRepanse();
  GeneratedBoolColumn _constructRepanse() {
    return GeneratedBoolColumn(
      'repanse',
      $tableName,
      false,
    );
  }

  final VerificationMeta _courigerMeta = const VerificationMeta('couriger');
  GeneratedTextColumn _couriger;
  @override
  GeneratedTextColumn get couriger => _couriger ??= _constructCouriger();
  GeneratedTextColumn _constructCouriger() {
    return GeneratedTextColumn(
      'couriger',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedIntColumn _note;
  @override
  GeneratedIntColumn get note => _note ??= _constructNote();
  GeneratedIntColumn _constructNote() {
    return GeneratedIntColumn(
      'note',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id_quest, mail, enonce, coure, repanse, couriger, note];
  @override
  $EvaluationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'evaluations';
  @override
  final String actualTableName = 'evaluations';
  @override
  VerificationContext validateIntegrity(EvaluationsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id_quest.present) {
      context.handle(_id_questMeta,
          id_quest.isAcceptableValue(d.id_quest.value, _id_questMeta));
    } else if (id_quest.isRequired && isInserting) {
      context.missing(_id_questMeta);
    }
    if (d.mail.present) {
      context.handle(
          _mailMeta, mail.isAcceptableValue(d.mail.value, _mailMeta));
    } else if (mail.isRequired && isInserting) {
      context.missing(_mailMeta);
    }
    if (d.enonce.present) {
      context.handle(
          _enonceMeta, enonce.isAcceptableValue(d.enonce.value, _enonceMeta));
    } else if (enonce.isRequired && isInserting) {
      context.missing(_enonceMeta);
    }
    if (d.coure.present) {
      context.handle(
          _coureMeta, coure.isAcceptableValue(d.coure.value, _coureMeta));
    } else if (coure.isRequired && isInserting) {
      context.missing(_coureMeta);
    }
    if (d.repanse.present) {
      context.handle(_repanseMeta,
          repanse.isAcceptableValue(d.repanse.value, _repanseMeta));
    } else if (repanse.isRequired && isInserting) {
      context.missing(_repanseMeta);
    }
    if (d.couriger.present) {
      context.handle(_courigerMeta,
          couriger.isAcceptableValue(d.couriger.value, _courigerMeta));
    } else if (couriger.isRequired && isInserting) {
      context.missing(_courigerMeta);
    }
    if (d.note.present) {
      context.handle(
          _noteMeta, note.isAcceptableValue(d.note.value, _noteMeta));
    } else if (note.isRequired && isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_quest};
  @override
  Evaluation map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Evaluation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(EvaluationsCompanion d) {
    final map = <String, Variable>{};
    if (d.id_quest.present) {
      map['id_quest'] = Variable<int, IntType>(d.id_quest.value);
    }
    if (d.mail.present) {
      map['mail'] = Variable<String, StringType>(d.mail.value);
    }
    if (d.enonce.present) {
      map['enonce'] = Variable<String, StringType>(d.enonce.value);
    }
    if (d.coure.present) {
      map['coure'] = Variable<String, StringType>(d.coure.value);
    }
    if (d.repanse.present) {
      map['repanse'] = Variable<bool, BoolType>(d.repanse.value);
    }
    if (d.couriger.present) {
      map['couriger'] = Variable<String, StringType>(d.couriger.value);
    }
    if (d.note.present) {
      map['note'] = Variable<int, IntType>(d.note.value);
    }
    return map;
  }

  @override
  $EvaluationsTable createAlias(String alias) {
    return $EvaluationsTable(_db, alias);
  }
}

class Test extends DataClass implements Insertable<Test> {
  final int id_test;
  final String mail;
  final String niveau;
  final int num_test;
  final int not_test;
  final bool decision;
  Test(
      {@required this.id_test,
      @required this.mail,
      @required this.niveau,
      this.num_test,
      this.not_test,
      @required this.decision});
  factory Test.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Test(
      id_test:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_test']),
      mail: stringType.mapFromDatabaseResponse(data['${effectivePrefix}mail']),
      niveau:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}niveau']),
      num_test:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}num_test']),
      not_test:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}not_test']),
      decision:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}decision']),
    );
  }
  factory Test.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Test(
      id_test: serializer.fromJson<int>(json['id_test']),
      mail: serializer.fromJson<String>(json['mail']),
      niveau: serializer.fromJson<String>(json['niveau']),
      num_test: serializer.fromJson<int>(json['num_test']),
      not_test: serializer.fromJson<int>(json['not_test']),
      decision: serializer.fromJson<bool>(json['decision']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id_test': serializer.toJson<int>(id_test),
      'mail': serializer.toJson<String>(mail),
      'niveau': serializer.toJson<String>(niveau),
      'num_test': serializer.toJson<int>(num_test),
      'not_test': serializer.toJson<int>(not_test),
      'decision': serializer.toJson<bool>(decision),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Test>>(bool nullToAbsent) {
    return TestsCompanion(
      id_test: id_test == null && nullToAbsent
          ? const Value.absent()
          : Value(id_test),
      mail: mail == null && nullToAbsent ? const Value.absent() : Value(mail),
      niveau:
          niveau == null && nullToAbsent ? const Value.absent() : Value(niveau),
      num_test: num_test == null && nullToAbsent
          ? const Value.absent()
          : Value(num_test),
      not_test: not_test == null && nullToAbsent
          ? const Value.absent()
          : Value(not_test),
      decision: decision == null && nullToAbsent
          ? const Value.absent()
          : Value(decision),
    ) as T;
  }

  Test copyWith(
          {int id_test,
          String mail,
          String niveau,
          int num_test,
          int not_test,
          bool decision}) =>
      Test(
        id_test: id_test ?? this.id_test,
        mail: mail ?? this.mail,
        niveau: niveau ?? this.niveau,
        num_test: num_test ?? this.num_test,
        not_test: not_test ?? this.not_test,
        decision: decision ?? this.decision,
      );
  @override
  String toString() {
    return (StringBuffer('Test(')
          ..write('id_test: $id_test, ')
          ..write('mail: $mail, ')
          ..write('niveau: $niveau, ')
          ..write('num_test: $num_test, ')
          ..write('not_test: $not_test, ')
          ..write('decision: $decision')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id_test.hashCode,
      $mrjc(
          mail.hashCode,
          $mrjc(
              niveau.hashCode,
              $mrjc(num_test.hashCode,
                  $mrjc(not_test.hashCode, decision.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Test &&
          other.id_test == id_test &&
          other.mail == mail &&
          other.niveau == niveau &&
          other.num_test == num_test &&
          other.not_test == not_test &&
          other.decision == decision);
}

class TestsCompanion extends UpdateCompanion<Test> {
  final Value<int> id_test;
  final Value<String> mail;
  final Value<String> niveau;
  final Value<int> num_test;
  final Value<int> not_test;
  final Value<bool> decision;
  const TestsCompanion({
    this.id_test = const Value.absent(),
    this.mail = const Value.absent(),
    this.niveau = const Value.absent(),
    this.num_test = const Value.absent(),
    this.not_test = const Value.absent(),
    this.decision = const Value.absent(),
  });
  TestsCompanion copyWith(
      {Value<int> id_test,
      Value<String> mail,
      Value<String> niveau,
      Value<int> num_test,
      Value<int> not_test,
      Value<bool> decision}) {
    return TestsCompanion(
      id_test: id_test ?? this.id_test,
      mail: mail ?? this.mail,
      niveau: niveau ?? this.niveau,
      num_test: num_test ?? this.num_test,
      not_test: not_test ?? this.not_test,
      decision: decision ?? this.decision,
    );
  }
}

class $TestsTable extends Tests with TableInfo<$TestsTable, Test> {
  final GeneratedDatabase _db;
  final String _alias;
  $TestsTable(this._db, [this._alias]);
  final VerificationMeta _id_testMeta = const VerificationMeta('id_test');
  GeneratedIntColumn _id_test;
  @override
  GeneratedIntColumn get id_test => _id_test ??= _constructIdTest();
  GeneratedIntColumn _constructIdTest() {
    return GeneratedIntColumn('id_test', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _mailMeta = const VerificationMeta('mail');
  GeneratedTextColumn _mail;
  @override
  GeneratedTextColumn get mail => _mail ??= _constructMail();
  GeneratedTextColumn _constructMail() {
    return GeneratedTextColumn(
      'mail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _niveauMeta = const VerificationMeta('niveau');
  GeneratedTextColumn _niveau;
  @override
  GeneratedTextColumn get niveau => _niveau ??= _constructNiveau();
  GeneratedTextColumn _constructNiveau() {
    return GeneratedTextColumn(
      'niveau',
      $tableName,
      false,
    );
  }

  final VerificationMeta _num_testMeta = const VerificationMeta('num_test');
  GeneratedIntColumn _num_test;
  @override
  GeneratedIntColumn get num_test => _num_test ??= _constructNumTest();
  GeneratedIntColumn _constructNumTest() {
    return GeneratedIntColumn(
      'num_test',
      $tableName,
      true,
    );
  }

  final VerificationMeta _not_testMeta = const VerificationMeta('not_test');
  GeneratedIntColumn _not_test;
  @override
  GeneratedIntColumn get not_test => _not_test ??= _constructNotTest();
  GeneratedIntColumn _constructNotTest() {
    return GeneratedIntColumn(
      'not_test',
      $tableName,
      true,
    );
  }


  final VerificationMeta _decisionMeta = const VerificationMeta('decision');
  GeneratedBoolColumn _decision;
  @override
  GeneratedBoolColumn get decision => _decision ??= _constructDecision();
  GeneratedBoolColumn _constructDecision() {
    return GeneratedBoolColumn(
      'decision',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id_test, mail, niveau, num_test, not_test, decision];
  @override
  $TestsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tests';
  @override
  final String actualTableName = 'tests';
  @override
  VerificationContext validateIntegrity(TestsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id_test.present) {
      context.handle(_id_testMeta,
          id_test.isAcceptableValue(d.id_test.value, _id_testMeta));
    } else if (id_test.isRequired && isInserting) {
      context.missing(_id_testMeta);
    }
    if (d.mail.present) {
      context.handle(
          _mailMeta, mail.isAcceptableValue(d.mail.value, _mailMeta));
    } else if (mail.isRequired && isInserting) {
      context.missing(_mailMeta);
    }
    if (d.niveau.present) {
      context.handle(
          _niveauMeta, niveau.isAcceptableValue(d.niveau.value, _niveauMeta));
    } else if (niveau.isRequired && isInserting) {
      context.missing(_niveauMeta);
    }
    if (d.num_test.present) {
      context.handle(_num_testMeta,
          num_test.isAcceptableValue(d.num_test.value, _num_testMeta));
    } else if (num_test.isRequired && isInserting) {
      context.missing(_num_testMeta);
    }
    if (d.not_test.present) {
      context.handle(_not_testMeta,
          not_test.isAcceptableValue(d.not_test.value, _not_testMeta));
    } else if (not_test.isRequired && isInserting) {
      context.missing(_not_testMeta);
    }
    if (d.decision.present) {
      context.handle(_decisionMeta,
          decision.isAcceptableValue(d.decision.value, _decisionMeta));
    } else if (decision.isRequired && isInserting) {
      context.missing(_decisionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_test};
  @override
  Test map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Test.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TestsCompanion d) {
    final map = <String, Variable>{};
    if (d.id_test.present) {
      map['id_test'] = Variable<int, IntType>(d.id_test.value);
    }
    if (d.mail.present) {
      map['mail'] = Variable<String, StringType>(d.mail.value);
    }
    if (d.niveau.present) {
      map['niveau'] = Variable<String, StringType>(d.niveau.value);
    }
    if (d.num_test.present) {
      map['num_test'] = Variable<int, IntType>(d.num_test.value);
    }
    if (d.not_test.present) {
      map['not_test'] = Variable<int, IntType>(d.not_test.value);
    }
    if (d.decision.present) {
      map['decision'] = Variable<bool, BoolType>(d.decision.value);
    }
    return map;
  }

  @override
  $TestsTable createAlias(String alias) {
    return $TestsTable(_db, alias);
  }
}

class Etape extends DataClass implements Insertable<Etape> {
  final int id_Nv;
  final String mail;
  final String niveau;
  Etape({@required this.id_Nv, @required this.mail, @required this.niveau});
  factory Etape.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Etape(
      id_Nv: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_nv']),
      mail: stringType.mapFromDatabaseResponse(data['${effectivePrefix}mail']),
      niveau:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}niveau']),
    );
  }
  factory Etape.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Etape(
      id_Nv: serializer.fromJson<int>(json['id_Nv']),
      mail: serializer.fromJson<String>(json['mail']),
      niveau: serializer.fromJson<String>(json['niveau']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id_Nv': serializer.toJson<int>(id_Nv),
      'mail': serializer.toJson<String>(mail),
      'niveau': serializer.toJson<String>(niveau),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Etape>>(bool nullToAbsent) {
    return EtapesCompanion(
      id_Nv:
          id_Nv == null && nullToAbsent ? const Value.absent() : Value(id_Nv),
      mail: mail == null && nullToAbsent ? const Value.absent() : Value(mail),
      niveau:
          niveau == null && nullToAbsent ? const Value.absent() : Value(niveau),
    ) as T;
  }

  Etape copyWith({int id_Nv, String mail, String niveau}) => Etape(
        id_Nv: id_Nv ?? this.id_Nv,
        mail: mail ?? this.mail,
        niveau: niveau ?? this.niveau,
      );
  @override
  String toString() {
    return (StringBuffer('Etape(')
          ..write('id_Nv: $id_Nv, ')
          ..write('mail: $mail, ')
          ..write('niveau: $niveau')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id_Nv.hashCode, $mrjc(mail.hashCode, niveau.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Etape &&
          other.id_Nv == id_Nv &&
          other.mail == mail &&
          other.niveau == niveau);
}

class EtapesCompanion extends UpdateCompanion<Etape> {
  final Value<int> id_Nv;
  final Value<String> mail;
  final Value<String> niveau;
  const EtapesCompanion({
    this.id_Nv = const Value.absent(),
    this.mail = const Value.absent(),
    this.niveau = const Value.absent(),
  });
  EtapesCompanion copyWith(
      {Value<int> id_Nv, Value<String> mail, Value<String> niveau}) {
    return EtapesCompanion(
      id_Nv: id_Nv ?? this.id_Nv,
      mail: mail ?? this.mail,
      niveau: niveau ?? this.niveau,
    );
  }
}

class $EtapesTable extends Etapes with TableInfo<$EtapesTable, Etape> {
  final GeneratedDatabase _db;
  final String _alias;
  $EtapesTable(this._db, [this._alias]);
  final VerificationMeta _id_NvMeta = const VerificationMeta('id_Nv');
  GeneratedIntColumn _id_Nv;
  @override
  GeneratedIntColumn get id_Nv => _id_Nv ??= _constructIdNv();
  GeneratedIntColumn _constructIdNv() {
    return GeneratedIntColumn('id_nv', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _mailMeta = const VerificationMeta('mail');
  GeneratedTextColumn _mail;
  @override
  GeneratedTextColumn get mail => _mail ??= _constructMail();
  GeneratedTextColumn _constructMail() {
    return GeneratedTextColumn(
      'mail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _niveauMeta = const VerificationMeta('niveau');
  GeneratedTextColumn _niveau;
  @override
  GeneratedTextColumn get niveau => _niveau ??= _constructNiveau();
  GeneratedTextColumn _constructNiveau() {
    return GeneratedTextColumn(
      'niveau',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id_Nv, mail, niveau];
  @override
  $EtapesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'etapes';
  @override
  final String actualTableName = 'etapes';
  @override
  VerificationContext validateIntegrity(EtapesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id_Nv.present) {
      context.handle(
          _id_NvMeta, id_Nv.isAcceptableValue(d.id_Nv.value, _id_NvMeta));
    } else if (id_Nv.isRequired && isInserting) {
      context.missing(_id_NvMeta);
    }
    if (d.mail.present) {
      context.handle(
          _mailMeta, mail.isAcceptableValue(d.mail.value, _mailMeta));
    } else if (mail.isRequired && isInserting) {
      context.missing(_mailMeta);
    }
    if (d.niveau.present) {
      context.handle(
          _niveauMeta, niveau.isAcceptableValue(d.niveau.value, _niveauMeta));
    } else if (niveau.isRequired && isInserting) {
      context.missing(_niveauMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_Nv};
  @override
  Etape map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Etape.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(EtapesCompanion d) {
    final map = <String, Variable>{};
    if (d.id_Nv.present) {
      map['id_nv'] = Variable<int, IntType>(d.id_Nv.value);
    }
    if (d.mail.present) {
      map['mail'] = Variable<String, StringType>(d.mail.value);
    }
    if (d.niveau.present) {
      map['niveau'] = Variable<String, StringType>(d.niveau.value);
    }
    return map;
  }

  @override
  $EtapesTable createAlias(String alias) {
    return $EtapesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $ApprenantsTable _apprenants;
  $ApprenantsTable get apprenants => _apprenants ??= $ApprenantsTable(this);
  $HistoriquesTable _historiques;
  $HistoriquesTable get historiques => _historiques ??= $HistoriquesTable(this);
  $EvaluationsTable _evaluations;
  $EvaluationsTable get evaluations => _evaluations ??= $EvaluationsTable(this);
  $TestsTable _tests;
  $TestsTable get tests => _tests ??= $TestsTable(this);
  $EtapesTable _etapes;
  $EtapesTable get etapes => _etapes ??= $EtapesTable(this);
  @override
  List<TableInfo> get allTables =>
      [apprenants, historiques, evaluations, tests, etapes];
}

class Trace { 
  // attributs
  Niveau _niveau;
  //Themee _theme;
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
  //Themee get themee => _theme;
  //set theme(Themee value) => _theme = value;
  List get archive_lecons => _archive_lecons;
  set archive_lecons(List value) => this._archive_lecons = value;
  List get archive_tests => _archive_tests;
  set archive_tests(List<Test_Niveau> value) => this._archive_tests = value;
  List get archive_qstn => _archive_qstn;
  set archive_qstn(List value) => this._archive_qstn = value;

  List get archiveReponse => this._archiveReponse;
  set archiveReponse(List value) => _archiveReponse = value;
  List get archiveReponseNiveau => this._archiveReponseNiveau;
  set archiveReponseNiveau(List value) => _archiveReponseNiveau = value;

  List get cptTestNiveau => _cptTestNiveau;
  set cptTestNiveau(List value) => _cptTestNiveau = value;
  List get scoreTestNiveau => _scoreTestNiveau;
  set scoreTestNiveau(List value) => _scoreTestNiveau = value;
  List get totalTestNiveau => _totalTestNiveau;
  set totalTestNiveau(List value) => _totalTestNiveau = value;
  
  // constructor
  Trace(this._niveau, this._archive_lecons, this._archive_tests,this._archive_qstn,this._archiveReponse,this._archiveReponseNiveau,
      this._cptTestNiveau,
      this._scoreTestNiveau,
      this._totalTestNiveau,);
  // methods
  // redefinitions
  bool operator ==(o) =>
      (o is Trace) &&
      (o._archive_lecons == this._archive_lecons) &&
      (o._archive_qstn == this._archive_qstn) &&
      (o._archive_tests == o._archive_tests) &&
      (o._niveau == this._niveau) ;
      //(o._theme == this._theme);
  int get hachCode =>
      _archive_lecons.hashCode +
      _archive_qstn.hashCode +
      _archive_tests.hashCode +
      _niveau.hashCode ;
      //_theme.hachCode;
}