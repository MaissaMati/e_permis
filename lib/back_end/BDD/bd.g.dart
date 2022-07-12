// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bd.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Apprenant extends DataClass implements Insertable<Apprenant> {
  final int id_app;
  final int id_hihtorique;
  final int id_evaluation;
  final String nom;
  final String email;
  final String mot_de_passe;
  Trace trace;
  Apprenant(
      {@required this.id_app,
      this.id_hihtorique,
      this.id_evaluation,
      @required this.nom,
      @required this.email,
      @required this.mot_de_passe});
      
       Apprenant.whitetrace( this.nom,this.email,  this.mot_de_passe,this.trace,this.id_app, this.id_hihtorique, this.id_evaluation,);
   void consulter_lecon(Lecon lecon) {
    lecon.afficher();
    //List<Lecon> l = this._trace.archive_lecons;l.add(lecon)
    //this._trace.archive_lecons.add(lecon);
    //this._trace.theme = lecon.theme;
  }
  void archiver_question(Question question) =>
      this.trace.archive_qstn.add(question);
  void consulter_question(Question question) => question.afficher();

  Reponse_Question repondre_question(Question question, String choix) {
    Reponse_Question repQ =
        new Reponse_Question(this, choix, false, 0, question);
    archiver_question(question);
    return repQ;
  }

  Reponse_Niveau passer_test_Niveau(Test_Niveau testN, List<String> choix) {
    List<Reponse_Question> list_reponses = new List<Reponse_Question>();
    for (int i = 0; (i <= testN.listquestions.length - 1); i++) {
      list_reponses.add(repondre_question(
          testN.listquestions.elementAt(i), choix.elementAt(i)));
    }
    List<Lecon> list_non_asm = new List<Lecon>();
    Reponse_Niveau repniv =
        new Reponse_Niveau(this, list_reponses, false, 0, list_non_asm, testN);
    return repniv;
  } /*dans le main en va recuperer les choix de l'apprenant en paramètre (par des scanneurs ou des checkboxs) */

  Niveau passer_test_categorisation(
      List<Test_Niveau> test_categorisation, List<List<String>> choix) {
    Niveau niveau = Niveau.DEBUTANT;
    for (int i = 0; i <= test_categorisation.length - 1; i++) {
      Reponse_Niveau reponse_niveau =
          passer_test_Niveau(test_categorisation[i], choix[i]);
      reponse_niveau.evaluer();
      print("${reponse_niveau.decision}");
      if (reponse_niveau.decision == true) {
        print("${test_categorisation[i]._niveausuivat}");
        niveau = test_categorisation[i]
            ._niveausuivat; // reponse_niveau.test_Niveau.niveausuivat;
        print(
            "${niveau.toString().substring(niveau.toString().indexOf('.') + 1)}");
      }
    }
    print("${niveau.toString()}");
    return niveau;
  }
  factory Apprenant.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Apprenant(
      id_app: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_app']),
      id_hihtorique: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_hihtorique']),
      id_evaluation: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_evaluation']),
      nom: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nom']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      mot_de_passe: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mot_de_passe']),
    );
  }
  factory Apprenant.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Apprenant(
      id_app: serializer.fromJson<int>(json['id_app']),
      id_hihtorique: serializer.fromJson<int>(json['id_hihtorique']),
      id_evaluation: serializer.fromJson<int>(json['id_evaluation']),
      nom: serializer.fromJson<String>(json['nom']),
      email: serializer.fromJson<String>(json['email']),
      mot_de_passe: serializer.fromJson<String>(json['mot_de_passe']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id_app': serializer.toJson<int>(id_app),
      'id_hihtorique': serializer.toJson<int>(id_hihtorique),
      'id_evaluation': serializer.toJson<int>(id_evaluation),
      'nom': serializer.toJson<String>(nom),
      'email': serializer.toJson<String>(email),
      'mot_de_passe': serializer.toJson<String>(mot_de_passe),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Apprenant>>(bool nullToAbsent) {
    return ApprenantsCompanion(
      id_app:
          id_app == null && nullToAbsent ? const Value.absent() : Value(id_app),
      id_hihtorique: id_hihtorique == null && nullToAbsent
          ? const Value.absent()
          : Value(id_hihtorique),
      id_evaluation: id_evaluation == null && nullToAbsent
          ? const Value.absent()
          : Value(id_evaluation),
      nom: nom == null && nullToAbsent ? const Value.absent() : Value(nom),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      mot_de_passe: mot_de_passe == null && nullToAbsent
          ? const Value.absent()
          : Value(mot_de_passe),
    ) as T;
  }

  Apprenant copyWith(
          {int id_app,
          int id_hihtorique,
          int id_evaluation,
          String nom,
          String email,
          String mot_de_passe}) =>
      Apprenant(
        id_app: id_app ?? this.id_app,
        id_hihtorique: id_hihtorique ?? this.id_hihtorique,
        id_evaluation: id_evaluation ?? this.id_evaluation,
        nom: nom ?? this.nom,
        email: email ?? this.email,
        mot_de_passe: mot_de_passe ?? this.mot_de_passe,
      );
  @override
  String toString() {
    return (StringBuffer('Apprenant(')
          ..write('id_app: $id_app, ')
          ..write('id_hihtorique: $id_hihtorique, ')
          ..write('id_evaluation: $id_evaluation, ')
          ..write('nom: $nom, ')
          ..write('email: $email, ')
          ..write('mot_de_passe: $mot_de_passe')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id_app.hashCode,
      $mrjc(
          id_hihtorique.hashCode,
          $mrjc(
              id_evaluation.hashCode,
              $mrjc(nom.hashCode,
                  $mrjc(email.hashCode, mot_de_passe.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Apprenant &&
          other.id_app == id_app &&
          other.id_hihtorique == id_hihtorique &&
          other.id_evaluation == id_evaluation &&
          other.nom == nom &&
          other.email == email &&
          other.mot_de_passe == mot_de_passe);
}

class ApprenantsCompanion extends UpdateCompanion<Apprenant> {
  final Value<int> id_app;
  final Value<int> id_hihtorique;
  final Value<int> id_evaluation;
  final Value<String> nom;
  final Value<String> email;
  final Value<String> mot_de_passe;
  const ApprenantsCompanion({
    this.id_app = const Value.absent(),
    this.id_hihtorique = const Value.absent(),
    this.id_evaluation = const Value.absent(),
    this.nom = const Value.absent(),
    this.email = const Value.absent(),
    this.mot_de_passe = const Value.absent(),
  });
  ApprenantsCompanion copyWith(
      {Value<int> id_app,
      Value<int> id_hihtorique,
      Value<int> id_evaluation,
      Value<String> nom,
      Value<String> email,
      Value<String> mot_de_passe}) {
    return ApprenantsCompanion(
      id_app: id_app ?? this.id_app,
      id_hihtorique: id_hihtorique ?? this.id_hihtorique,
      id_evaluation: id_evaluation ?? this.id_evaluation,
      nom: nom ?? this.nom,
      email: email ?? this.email,
      mot_de_passe: mot_de_passe ?? this.mot_de_passe,
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
    return GeneratedIntColumn('id_app', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _id_hihtoriqueMeta =
      const VerificationMeta('id_hihtorique');
  GeneratedIntColumn _id_hihtorique;
  @override
  GeneratedIntColumn get id_hihtorique =>
      _id_hihtorique ??= _constructIdHihtorique();
  GeneratedIntColumn _constructIdHihtorique() {
    return GeneratedIntColumn(
      'id_hihtorique',
      $tableName,
      true,
    );
  }

  final VerificationMeta _id_evaluationMeta =
      const VerificationMeta('id_evaluation');
  GeneratedIntColumn _id_evaluation;
  @override
  GeneratedIntColumn get id_evaluation =>
      _id_evaluation ??= _constructIdEvaluation();
  GeneratedIntColumn _constructIdEvaluation() {
    return GeneratedIntColumn(
      'id_evaluation',
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

  @override
  List<GeneratedColumn> get $columns =>
      [id_app, id_hihtorique, id_evaluation, nom, email, mot_de_passe];
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
    if (d.id_hihtorique.present) {
      context.handle(
          _id_hihtoriqueMeta,
          id_hihtorique.isAcceptableValue(
              d.id_hihtorique.value, _id_hihtoriqueMeta));
    } else if (id_hihtorique.isRequired && isInserting) {
      context.missing(_id_hihtoriqueMeta);
    }
    if (d.id_evaluation.present) {
      context.handle(
          _id_evaluationMeta,
          id_evaluation.isAcceptableValue(
              d.id_evaluation.value, _id_evaluationMeta));
    } else if (id_evaluation.isRequired && isInserting) {
      context.missing(_id_evaluationMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_app};
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
    if (d.id_hihtorique.present) {
      map['id_hihtorique'] = Variable<int, IntType>(d.id_hihtorique.value);
    }
    if (d.id_evaluation.present) {
      map['id_evaluation'] = Variable<int, IntType>(d.id_evaluation.value);
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
    return map;
  }

  @override
  $ApprenantsTable createAlias(String alias) {
    return $ApprenantsTable(_db, alias);
  }
}

class Evaluation extends DataClass implements Insertable<Evaluation> {
  final int id_eva;
  final String enonce;
  final String coure;
  final bool repanse;
  final String couriger;
  final int note;
  Evaluation(
      {@required this.id_eva,
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
      id_eva: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_eva']),
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
      id_eva: serializer.fromJson<int>(json['id_eva']),
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
      'id_eva': serializer.toJson<int>(id_eva),
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
      id_eva:
          id_eva == null && nullToAbsent ? const Value.absent() : Value(id_eva),
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
          {int id_eva,
          String enonce,
          String coure,
          bool repanse,
          String couriger,
          int note}) =>
      Evaluation(
        id_eva: id_eva ?? this.id_eva,
        enonce: enonce ?? this.enonce,
        coure: coure ?? this.coure,
        repanse: repanse ?? this.repanse,
        couriger: couriger ?? this.couriger,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Evaluation(')
          ..write('id_eva: $id_eva, ')
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
      id_eva.hashCode,
      $mrjc(
          enonce.hashCode,
          $mrjc(
              coure.hashCode,
              $mrjc(repanse.hashCode,
                  $mrjc(couriger.hashCode, note.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Evaluation &&
          other.id_eva == id_eva &&
          other.enonce == enonce &&
          other.coure == coure &&
          other.repanse == repanse &&
          other.couriger == couriger &&
          other.note == note);
}

class EvaluationsCompanion extends UpdateCompanion<Evaluation> {
  final Value<int> id_eva;
  final Value<String> enonce;
  final Value<String> coure;
  final Value<bool> repanse;
  final Value<String> couriger;
  final Value<int> note;
  const EvaluationsCompanion({
    this.id_eva = const Value.absent(),
    this.enonce = const Value.absent(),
    this.coure = const Value.absent(),
    this.repanse = const Value.absent(),
    this.couriger = const Value.absent(),
    this.note = const Value.absent(),
  });
  EvaluationsCompanion copyWith(
      {Value<int> id_eva,
      Value<String> enonce,
      Value<String> coure,
      Value<bool> repanse,
      Value<String> couriger,
      Value<int> note}) {
    return EvaluationsCompanion(
      id_eva: id_eva ?? this.id_eva,
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
  final VerificationMeta _id_evaMeta = const VerificationMeta('id_eva');
  GeneratedIntColumn _id_eva;
  @override
  GeneratedIntColumn get id_eva => _id_eva ??= _constructIdEva();
  GeneratedIntColumn _constructIdEva() {
    return GeneratedIntColumn(
      'id_eva',
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
      [id_eva, enonce, coure, repanse, couriger, note];
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
    if (d.id_eva.present) {
      context.handle(
          _id_evaMeta, id_eva.isAcceptableValue(d.id_eva.value, _id_evaMeta));
    } else if (id_eva.isRequired && isInserting) {
      context.missing(_id_evaMeta);
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Evaluation map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Evaluation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(EvaluationsCompanion d) {
    final map = <String, Variable>{};
    if (d.id_eva.present) {
      map['id_eva'] = Variable<int, IntType>(d.id_eva.value);
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

class Historique extends DataClass implements Insertable<Historique> {
  final int id_his;
  final String niveau;
  final String them;
  final String coure;
  Historique(
      {@required this.id_his,
      @required this.niveau,
      @required this.them,
      @required this.coure});
  factory Historique.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Historique(
      id_his: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_his']),
      niveau:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}niveau']),
      them: stringType.mapFromDatabaseResponse(data['${effectivePrefix}them']),
      coure:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}coure']),
    );
  }
  factory Historique.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Historique(
      id_his: serializer.fromJson<int>(json['id_his']),
      niveau: serializer.fromJson<String>(json['niveau']),
      them: serializer.fromJson<String>(json['them']),
      coure: serializer.fromJson<String>(json['coure']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id_his': serializer.toJson<int>(id_his),
      'niveau': serializer.toJson<String>(niveau),
      'them': serializer.toJson<String>(them),
      'coure': serializer.toJson<String>(coure),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Historique>>(bool nullToAbsent) {
    return HistoriquesCompanion(
      id_his:
          id_his == null && nullToAbsent ? const Value.absent() : Value(id_his),
      niveau:
          niveau == null && nullToAbsent ? const Value.absent() : Value(niveau),
      them: them == null && nullToAbsent ? const Value.absent() : Value(them),
      coure:
          coure == null && nullToAbsent ? const Value.absent() : Value(coure),
    ) as T;
  }

  Historique copyWith({int id_his, String niveau, String them, String coure}) =>
      Historique(
        id_his: id_his ?? this.id_his,
        niveau: niveau ?? this.niveau,
        them: them ?? this.them,
        coure: coure ?? this.coure,
      );
  @override
  String toString() {
    return (StringBuffer('Historique(')
          ..write('id_his: $id_his, ')
          ..write('niveau: $niveau, ')
          ..write('them: $them, ')
          ..write('coure: $coure')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id_his.hashCode,
      $mrjc(niveau.hashCode, $mrjc(them.hashCode, coure.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Historique &&
          other.id_his == id_his &&
          other.niveau == niveau &&
          other.them == them &&
          other.coure == coure);
}

class HistoriquesCompanion extends UpdateCompanion<Historique> {
  final Value<int> id_his;
  final Value<String> niveau;
  final Value<String> them;
  final Value<String> coure;
  const HistoriquesCompanion({
    this.id_his = const Value.absent(),
    this.niveau = const Value.absent(),
    this.them = const Value.absent(),
    this.coure = const Value.absent(),
  });
  HistoriquesCompanion copyWith(
      {Value<int> id_his,
      Value<String> niveau,
      Value<String> them,
      Value<String> coure}) {
    return HistoriquesCompanion(
      id_his: id_his ?? this.id_his,
      niveau: niveau ?? this.niveau,
      them: them ?? this.them,
      coure: coure ?? this.coure,
    );
  }
}

class $HistoriquesTable extends Historiques
    with TableInfo<$HistoriquesTable, Historique> {
  final GeneratedDatabase _db;
  final String _alias;
  $HistoriquesTable(this._db, [this._alias]);
  final VerificationMeta _id_hisMeta = const VerificationMeta('id_his');
  GeneratedIntColumn _id_his;
  @override
  GeneratedIntColumn get id_his => _id_his ??= _constructIdHis();
  GeneratedIntColumn _constructIdHis() {
    return GeneratedIntColumn(
      'id_his',
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

  final VerificationMeta _themMeta = const VerificationMeta('them');
  GeneratedTextColumn _them;
  @override
  GeneratedTextColumn get them => _them ??= _constructThem();
  GeneratedTextColumn _constructThem() {
    return GeneratedTextColumn(
      'them',
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
  List<GeneratedColumn> get $columns => [id_his, niveau, them, coure];
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
    if (d.id_his.present) {
      context.handle(
          _id_hisMeta, id_his.isAcceptableValue(d.id_his.value, _id_hisMeta));
    } else if (id_his.isRequired && isInserting) {
      context.missing(_id_hisMeta);
    }
    if (d.niveau.present) {
      context.handle(
          _niveauMeta, niveau.isAcceptableValue(d.niveau.value, _niveauMeta));
    } else if (niveau.isRequired && isInserting) {
      context.missing(_niveauMeta);
    }
    if (d.them.present) {
      context.handle(
          _themMeta, them.isAcceptableValue(d.them.value, _themMeta));
    } else if (them.isRequired && isInserting) {
      context.missing(_themMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id_his};
  @override
  Historique map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Historique.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(HistoriquesCompanion d) {
    final map = <String, Variable>{};
    if (d.id_his.present) {
      map['id_his'] = Variable<int, IntType>(d.id_his.value);
    }
    if (d.niveau.present) {
      map['niveau'] = Variable<String, StringType>(d.niveau.value);
    }
    if (d.them.present) {
      map['them'] = Variable<String, StringType>(d.them.value);
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $ApprenantsTable _apprenants;
  $ApprenantsTable get apprenants => _apprenants ??= $ApprenantsTable(this);
  $EvaluationsTable _evaluations;
  $EvaluationsTable get evaluations => _evaluations ??= $EvaluationsTable(this);
  $HistoriquesTable _historiques;
  $HistoriquesTable get historiques => _historiques ??= $HistoriquesTable(this);
  @override
  List<TableInfo> get allTables => [apprenants, evaluations, historiques];
}
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

class Lecon {
  // attributs
  String _nom;
  String _image;
  List<Partie>    _list_parties;

  Lecon(this._nom, this._list_parties, this._image);
  //getters and setters
  String get nom => _nom;
  set nom(String value) => _nom = value;
  List get list_parties => _list_parties;
  set list_parties(List value) => _list_parties = value;
  String get image => _image;
  set image(String image) => this._image = image;
  // methods
  void afficher() =>
      print("nom: $_nom\n");
  // redefinitions
  bool operator ==(o) =>(o is Lecon) && (o._list_parties == this._list_parties) &&(o._nom == this._nom);
  int get hachCode =>_nom.hashCode +_list_parties.hashCode;
}
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

class App {
  // attributs
  Map<Niveau, List<Themee>> _list_themes;
  List<Test_Niveau> _list_tests;
  //List<Admin> _list_admins;
  List<Question> _test_categorisation;
  Map<String, Apprenant> _apprenants;
  //constructor
  App(this._list_themes, this._list_tests,/* this._list_admins,*/this._test_categorisation, this._apprenants);
  //setters & gatters
  Map get list_themes => _list_themes;
  set list_themes(Map list_themes) => this._list_themes = list_themes;
  List get list_tests => _list_tests;
  set list_tests(List value) => _list_tests = value;
  //List get list_admins => _list_admins;
  //set list_admins(List value) => _list_admins = value;
  List get test_categorisation => _test_categorisation;
  set test_categorisation(List value) => _test_categorisation = value;
  /*List get apprenants => _apprenants;
  set apprenants(List value) => _apprenants = value;*/
  Map get list_apprenants => _apprenants;
  set apprenants(Map value) => _apprenants = value;
  // methods
  Apprenant inscription(String nom, String email, String mp) {
    Apprenant apprenant = Apprenant.whitetrace(nom, email, mp, Trace(Niveau.DEBUTANT, notions_base,null,null,null), null, null, null);
    list_apprenants.putIfAbsent(email, () => apprenant);
    return apprenant;
  }

  Apprenant connexion(String email, String mp) => list_apprenants[email];

}


// from maissa's code
/*class Question {
  // attributs
  String _enonce;
  List<String> _propositions;
  Lecon _lecon;
  String _corrige_type;
  num _note;
  //constructor
  Question(this._enonce, this._propositions, this._lecon, this._corrige_type,
      this._note);

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
}*/

//from sarra's code
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

class Test_Niveau {
  // attributs
  Niveau _niveau;
  Niveau _niveausuivat;
  List<Question> _list_questions;
  //constructor
  Test_Niveau(this._niveau, this._niveausuivat, this._list_questions);
  // getters & setters
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
    for (int i = 0; (i <= this._list_reponses.length - 1); i++) {
      this._list_reponses.elementAt(i).evaluer();
      if (this._list_reponses.elementAt(i).decision == true) {
        this.note += list_reponses.elementAt(i).note;
      } else {
        this.list_non_asm.add(this.list_reponses.elementAt(i).question.lecon);
      }
    }
    if (this._note >= 10) {
      this._decision = true;
    } //on peut changer cette condition !!
  } //dans le main if(repniv.getdecision==true){passage vers l'autre niveau} else{repniv.getlist_non_asm[].afficher}

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
      _apprenant.hashCode +
      _list_reponses.hashCode +
      _decision.hashCode +
      _note.hashCode +
      _list_non_asm.hashCode +
      _test_niveau.hachCode;
}

class Reponse_Question {
  // attributs
  Apprenant _apprenant;
  String _choix;
  bool _decision;
  num _note; //float =num
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
      _apprenant.hashCode +
      _note.hashCode +
      _choix.hashCode +
      _decision.hashCode +
      _question.hachCode;
}

class Trace {
  // attributs
  Niveau _niveau;
  Themee _theme;
  List<Lecon> _archive_lecons;
  List<Test_Niveau> _archive_tests;
  List<Question> _archive_qstn;
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
  // constructor
  Trace(this._niveau, this._theme, this._archive_lecons, this._archive_tests,
      this._archive_qstn);
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
}

enum Niveau { DEBUTANT, INTERMIDIAIRE, EXPERT }

//----------------------------Niveau débutant---------------------------------------

//___________________________ thème Notions de base___________________________________



Lecon conducteur= new Lecon("Conducteur",null,null);
Lecon vehicule= new Lecon("Véhicule",null,null);
Lecon permis= new Lecon("Permis",null,null);

Themee notions_base= new Themee("Notions de base",Niveau.DEBUTANT,{conducteur:null , vehicule:null , permis:null});
//___________________________ thème signalisation___________________________________

List <Partie> panneaux_danger_parties=[
  Partie("virage dangereux à droite","jjjj",'assets/danger/1.png'),
 Partie("virage dangereux à  gauche","ggg",'assets/danger/2.png'),
  Partie("Succession de virage le premier à droite",null,'assets/danger/3.png'),
  Partie("Succession de virage le premier à gauche",null,'assets/danger/4.png'),
  Partie("Succession de virage le premier à droite sur une distance de 500m",null,'assets/danger/5.png'),
  Partie("chaussée rétrécie",null,'assets/danger/6.jpg'),
  Partie("chaussée rétrécie par la droite",null,'assets/danger/7.gif'),
  Partie("chaussée rétrécie par la gauche",null,'assets/danger/8.jpg'),
  Partie("cassis ou dos d'àne",null,'assets/danger/9.png'),
  Partie("autres dangers",null,'assets/danger/10.png'),
  Partie("pont mobile",null,'assets/danger/11.png'),
  Partie("débouché sur un quai ou une berge",null,'assets/danger/12.png'),
  Partie("risque de chute ou de présence de pierres tombées sur la route",null,'assets/danger/13.png'),
  Partie("descente dangereuse",null,'assets/danger/14.png'),
  Partie("chaussée glissante",null,'assets/danger/15.png'),
  Partie("vent latéral",null,'assets/danger/16.png'),
  Partie("vent latéral",null,'assets/danger/17.png'),
  Partie("traversée d'une aire de danger aérien",null,'assets/danger/18.png'),
  Partie("passage d'animaux domestiques",null,'assets/danger/19.jpg'),
  Partie("passage d'animaux domestiques",null,'assets/danger/20.png'),
  Partie("passage d'animaux sauvage",null,'assets/danger/21.png'),
  Partie("passage de cavaliers",null,'assets/danger/22.jpg'),
  Partie("passage pour piétons",null,'assets/danger/23.jpg'),
  Partie("endroit fréquenté par les enfants",null,'assets/danger/24.png'),
  Partie("débouché de cyclistes ou de cyclomotoristes venant de droite",null,'assets/danger/25.png'),
  Partie("débouché de cyclistes ou de cyclomotoristes venant de gauche",null,'assets/danger/26.jpg'),
  Partie("carrefour à sens gritoire",null,'assets/danger/27.png'),
  Partie("circulation dans les deux sens",null,'assets/danger/28.png'),
  Partie("feux tricolores",null,'assets/danger/29.jpg'),
  Partie("dos d'anne",null,'assets/danger/30.png'),
];
List <Partie> panneaux_passage_a_niveau=[
  Partie("passage à niveau sans barrière ni demi-barrière signale avancé",null,'assets/passage_niveau/1.png'),
  Partie("passage à niveau sans barrière ni demi-barrière signale de position",null,'assets/passage_niveau/2.gif'),
  Partie("passage à niveau sans barrière ni demi-barrière signale de position",null,'assets/passage_niveau/3.png'),
  Partie("passage à niveau sans barrière ni demi-barrière signale de position",null,'assets/passage_niveau/4.gif'),
  Partie("passage à niveau sans barrière avec obligation de marquer l'arrét signale avancé",null,'assets/passage_niveau/5.jpg'),
  Partie("passage à niveau sans barrière avec obligation de marquer l'arrét signale de position ",null,'assets/passage_niveau/6.jpg'),
  Partie("passage à niveau sans barrière avec signalisation automatique sonore et lumineuse signale avancé",null,'assets/passage_niveau/7.jpg'),
  Partie("passage à niveau sans barrière avec signalisation automatique sonore et lumineuse signale de position",null,'assets/passage_niveau/8.png'),
  Partie("passage à niveau muni de barrière à fonctionnement manuel signale avancé",null,'assets/passage_niveau/9.png'),
  Partie("passage à niveau muni de barrière à fonctionnement manuel signale de position",null,'assets/passage_niveau/10.jpg'),
  Partie("passage à niveau muni de demi-barrière à fonctionnement automatique signale avancé",null,'assets/passage_niveau/11.png'),
  Partie("passage à niveau muni de demi-barrière à fonctionnement automatique signale de position",null,'assets/passage_niveau/12.jpg'),
  Partie("pasage à nivau avec ligne électrifiée située à moins de 6m au dessus de la chaussée",null,'assets/passage_niveau/13.png'),
  Partie("panonceau ligne électrifiée située à moins de 6m au dessus de la chaussée",null,'assets/passage_niveau/14.jpg'),  
];
List <Partie> panneaux_temporaire=[
  Partie("travaux",null,'assets/temporaire/1.png'),
  Partie("projection de gravillons",null,'assets/temporaire/2.gif'),
  Partie("autres dangers",null,'assets/temporaire/3.png'),
  Partie("feux tricolores",null,'assets/temporaire/4.jpg'),
  Partie("accident",null,'assets/temporaire/5.png'),
  Partie("cassis ou dos d'àne",null,'assets/temporaire/6.jpg'),
  Partie("chaussée glissante",null,'assets/temporaire/7.gif'),
  Partie("chaussée rétrécie",null,'assets/temporaire/8.jpg'),
  Partie("encombrement",null,'assets/temporaire/9.jpg'),
  Partie("début et fin de chantier",null,'assets/temporaire/10.jpg'),
  Partie("signal de position d'une déviation",null,'assets/temporaire/11.jpg'),
  Partie("fanion de traveaux",null,'assets/temporaire/12.jpg'),
  Partie("piquet balise",null,'assets/temporaire/13.jpg'),
  Partie("cone de chantier",null,'assets/temporaire/14.png'),  
  Partie("déviation pour certains véhicules",null,'assets/temporaire/15.png'),  
  Partie("déviation pour tous les véhicules ",null,'assets/temporaire/16.png'),  
  Partie("accès de la deuxième voie interdit aux transports de marchandises",null,'assets/temporaire/17.png'),  
  Partie("affectation des voies",null,'assets/temporaire/18.jpg'),  
  Partie("changement de chaussée",null,'assets/temporaire/19.jpg'),  
  Partie("déviation",null,'assets/temporaire/20.jpg'),  
  Partie("direction de déviation pour certains véhicules",null,'assets/temporaire/21.png'),  
  Partie("circulation alternée",null,'assets/temporaire/22.jpg'), 
  Partie("route barrée",null,'assets/temporaire/23.jpg'), 

];

List <Partie> panneaux_direction_parties=[
  Partie("indication d'un carrefour à sens giratoire",null,'assets/signalisation/direction/1.jpg'),
  Partie("indiactions de liaisons importantes",null,'assets/signalisation/direction/2.jpg'),
  Partie("signalisation avancée. pour aller dans la direction on suit l'indication des flèches",null,'assets/signalisation/direction/3.jpg'),
  Partie("signalisation de position. signalisation implanté à une intersection",null,'assets/signalisation/direction/4.jpg'),
  Partie("confirmation de direction implantée aprés les intersections ou les sorties d'agglomération",null,'assets/signalisation/direction/5.jpg'),
  Partie("route forestière",null,'assets/signalisation/direction/6.jpg'), 
  Partie("route communale",null,'assets/signalisation/direction/7.png'),
  Partie("route départementale",null,'assets/signalisation/direction/8.png'),
  Partie("route nationale",null,'assets/signalisation/direction/9.png'),
  Partie("balise de virage en zone enneigées",null,'assets/signalisation/direction/10.jpg'),
  Partie("balise de virage",null,'assets/signalisation/direction/11.jpg'),
  Partie("balise d'intersection",null,'assets/signalisation/direction/12.jpg'),
  Partie("délinateur",null,'assets/signalisation/direction/13.jpg'),
  Partie("balises avec bandes de distance (chaque bande représente 50 m)",null,'assets/signalisation/direction/14.gif'),
  Partie("balise de virage à droite trés dangereux",null,'assets/signalisation/direction/15.jpg'),
  Partie("contournement à tète d'ilot",null,'assets/signalisation/direction/16.png'),
  Partie("route natonale",null,'assets/signalisation/direction/17.png'),
  Partie("route départementale",null,'assets/signalisation/direction/18.jpg'),
];
List <Partie> panneaux_indication_parties=[
  Partie("circulation à sens unique",null,'assets/signalisation/indication/1.png'),
  Partie("Parking",null,'assets/signalisation/indication/2.png'),
  Partie("Parking payant",null,'assets/signalisation/indication/3.png'),
  Partie("hopital",null,'assets/signalisation/indication/4.gif'),
  Partie("arrêt de bus",null,'assets/signalisation/indication/5.png'),
  Partie("route pour automobile",null,'assets/signalisation/indication/6.png'),
  Partie("Arrêt réservé aux taxis",null,'assets/signalisation/indication/7.png'),
  Partie("Entrée d'un tunnel",null,'assets/signalisation/indication/8.png'),
  Partie("Fin du tunnel",null,'assets/signalisation/indication/9.png'),
  Partie("Entrée de l'autoroute",null,'assets/signalisation/indication/10.png'),
  Partie("Fin de l'autoroute",null,'assets/signalisation/indication/11.png'),
  Partie("chemin sans issue",null,'assets/signalisation/indication/12.png'),
  Partie("présignalisation d'une route sans issue",null,'assets/signalisation/indication/13.png'),
  Partie("Voie de détresse sur la droite",null,'assets/signalisation/indication/14.png'),
  Partie("Priorité sur les véhicules venant en sens inverse",null,'assets/signalisation/indication/15.png'),
  Partie("affectation des voies sur la chaussée abordée",null,'assets/signalisation/indication/16.gif'),
  Partie("Passage pour les piétons",null,'assets/signalisation/indication/17.png'),
  Partie("Ralentisseur",null,'assets/signalisation/indication/18.png'),
  Partie("vitesse conseillée",null,'assets/signalisation/indication/19.png'),
  Partie("Traversée de tramway",null,'assets/signalisation/indication/20.png'),
  Partie("Aire de pique-nique",null,'assets/signalisation/indication/21.png'),
  Partie("Auberge de jeunesse",null,'assets/signalisation/indication/22.png'),
  Partie("Terrain de camping",null,'assets/signalisation/indication/23.png'),
  Partie("Hôtel",null,'assets/signalisation/indication/24.png'),
  Partie("Restaurant",null,'assets/signalisation/indication/25.png'),
  Partie("cafétéria",null,'assets/signalisation/indication/26.png'),
  Partie("installation pour personnes à mobilité réduite",null,'assets/signalisation/indication/27.png'),
  Partie("Téléphone publique",null,'assets/signalisation/indication/28.png'),
  Partie("Poste d'appel d'urgence",null,'assets/signalisation/indication/29.png'),
  Partie("Point d'information touristique",null,'assets/signalisation/indication/30.png'),
  Partie("Station de carburant",null,'assets/signalisation/indication/31.png'),
  Partie("Toilette publique",null,'assets/signalisation/indication/32.png'),
];

List <Partie> panneaux_agent_parties=[
  Partie("arrèter",null,'assets/signalisation/agent/1.jpg'),
  Partie("passage libre",null,'assets/signalisation/agent/2.jpg'),
  Partie("attention à l'arrèt",null,'assets/signalisation/agent/3.jpg'),
  Partie("passer",null,'assets/signalisation/agent/4.jpg'),
  Partie("serrer du côté indiqué par le bras tendu",null,'assets/signalisation/agent/5.jpg'),
  Partie("ralentir",null,'assets/signalisation/agent/6.jpg'),
];

List <Partie> panneaux_feux_parties=[
  Partie("animation feux tricolores",null,'assets/signalisation/feux/1.gif'),
  Partie("feu vert: autorisation de passer",null,'assets/signalisation/feux/2.jpg'),
  Partie("feu orange: interdiction de passer (anonce du fau rouge)",null,'assets/signalisation/feux/3.jpg'),
  Partie("feu rouge: interdiction de passer\n   si les feux fonctionne normalement : obeir aux faux et ignorer les paneaux\n   si les feu éteint ou jaune clignotant : obeir aux panneaux",null,'assets/signalisation/feux/4.jpg'),
  Partie("feu rouge avec flèche jaune : malgré le feu rouge, je peux tourner dans la voie située à ma droite",null,'assets/signalisation/feux/5.gif'),
  Partie("feu jaune clignotant sans panneaux: feu en panne, je passe en respectant la priorité à droite",null,'assets/signalisation/feux/6.gif'),
];
Lecon feu = new Lecon("Feu",null,null);
Lecon panneaux_obligation = new Lecon("Panneaux d'obligation",[],null);
Lecon panneaux_danger = new Lecon("Panneaux de danger",null,null);
Lecon panneaux_indication_direction = new Lecon("Panneaux d'indication et de direction",null,null);
Lecon panneaux_interdiction = new Lecon("Panneaux d'interdiction",null,null);
Lecon panneaux_priorite = new Lecon("Panneaux de priorité",null,null);
Lecon signalisation_horizontal = new Lecon("Signalisation horizontale",null,null);

Themee signalisation = new Themee(
  "Signalisation", 
  Niveau.DEBUTANT,
  {
    panneaux_danger:[],
    panneaux_indication_direction:[],
    feu:[],
    panneaux_obligation:[],
    panneaux_interdiction:[],
    panneaux_priorite:[],
    signalisation_horizontal:[]
  }); 

//----------------------------Niveau intermédiare---------------------------------------

//___________________________ thème règles générale de la route___________________________________

Lecon prcautions_route= new Lecon("Précaution de la route",null,null);
Lecon distance_securite= new Lecon("Distances de sécurité",null,null);
Lecon vitesse= new Lecon("Vitesse",null,null);
Lecon regles_generales_circulation= new Lecon("Règles générales de circulation",null,null);

Themee regles_generales_route= Themee("Règles générales de la route",Niveau.INTERMIDIAIRE,
                {prcautions_route:null , distance_securite:null , vitesse:null , regles_generales_circulation:null});

//___________________________ thème arrêt et stationnement___________________________________

Themee arret_stationnement= Themee("Arrêt et stationnement",Niveau.INTERMIDIAIRE, {arret_et_stationnement:null});

Lecon arret_et_stationnement= new Lecon("Arrêt et stationnement",null,null);

//----------------------------Niveau expert---------------------------------------

//___________________________ thème croisement et dépassement_________________________________

List <Partie>croisement_parties=[
  Partie("1.	C’est quoi un croisement ","On parle de croisement lorsque deux véhicules, qui circulent dans des sens opposés, se croisent l’un face à l’autre sur la voie publique",null),
  Partie("1.	La règle générale","Lorsqu’un conducteur circule sur une chaussée à deux sens de circulation, il est amené à croiser les conducteurs circulant en sens inverse. Le croisement se fait à DROITE pour laisser un maximum d’espace avec le véhicule venant en sens opposé. ",'assets/croisement2.jpg'),
  Partie("2.	Signalisation de croisement ","",null),
  Partie("1","Ce panneau indique que Le conducteur doit céder le passage aux véhicules venant en sens inverse. L’arrêt n’est pas obligatoire, si personne n’arrive je peux m’engager",'assets/croisement3.png'),
  Partie("2","Ce panneau indique que le conducteur a la priorité sur les véhicules venant d’en face.",'assets/croisement4.png'),
  Partie("3","Lors d’un croisement avec signalisation, c’est le véhicule qui a le panneau de priorité de passage qui passe en premier, l’autre véhicule doit s’arrêter et lui céder le passage.\n\nDans l’exemple, la voiture noire est prioritaire.",'assets/croisement5.png'),
  Partie("3.	Croisement avec obstacle ","Ici aussi, la règle est simple. Celui qui se trouve face à « l’obstacle » (travaux, véhicule à l’arrêt, piétons, …) entravant sa   progression, doit   ralentir et, au besoin, s’arrêter pour laisser passer les conducteurs en sens inverse.\n\n Dans l’exemple, la voiture rouge est prioritaire.",'assets/croisement6.png'),
  Partie("4.	Croisement en agglomération","-Lors d’un croisement en agglomération, le conducteur doit s’arrêter afin de faciliter le passage des véhicules de transport en commun\n- Lors d'un croisement en agglomération on doit laisser une distance minimale de 1m lors d'un croisement avec les deux roues et les piétons. Si la distance minimale ne peut pas être respectée je dois m'arrêter.",null),
  Partie("5.	Croisement hors agglomération","-Lors d’un croisement en dehors de la ville les véhicules doivent ralentir et serrer à droite sur les routes étroites.\n-Lors d'un croisement en agglomération avec un véhicule encombrant (Plus de 2 mètres de large et/ou 7 mètres de long) le véhicule léger a la priorité.\n-Lors d'un croisement en dehors de la ville les véhicules doivent laisser au moins 1,50m latéral avec les deux roues et les piétons.",null),
  Partie("6.	Croisement sur une chaussée étroite ","Sur chaussée étroite, les véhicules de plus de 2 mètres de large ou de 7 mètres de long doivent s’arrêter ou se garer pour faciliter le passage des autres véhicules. (Sauf avec les bus en agglomération auxquels il faut faciliter le passage)",null),
  Partie("7.  Croisement dans un carrefour","",null),
  Partie("1", "Dans un carrefour sans flèche dessinée au sol, le croisement se fera par la droite.", 'assets/croisement7.png'),
  Partie("2", "Dans un carrefour avec flèches au sol, le croisement se fera selon l’indication des flèches.", 'assets/croisement8.png'),
  Partie("8.	Croisement sur une route en pente","",null),
  Partie("1	Croisement difficile","Un croisement est dit « difficile » si l’un des deux véhicules doit s’arrêter pour laisser passer l’autre",null),
  Partie("","Le véhicule qui descend doit céder le passage au véhicule qui monte si les deux   véhicules sont de la même catégorie.",'assets/croisement9.jpg'),
  Partie("Exception","si le véhicule qui descend est un poids lourd ,celui-ci a la priorité",'assets/croisement10.jpg'),
  Partie("2	Croisement impossible","Un croisement est dit « impossible » si l’un des deux véhicules doit reculer pour laisser passer l’autre",null),
  Partie("• Croisement de deux véhicules de même gabarit","le véhicule qui descend doit reculer.",null),
  Partie("• Croisement de deux véhicules de gabarits différents"," le véhicule le plus maniable doit reculer",null),
  Partie("• Croisement d’une voiture face à un groupe de véhicules","Un véhicule seul se trouvent face a un groupe de véhicule doit reculer",'assets/croisement11.jpg'),
];

List<Partie> depassement_parties=[
  Partie("1.	C’est quoi un dépassement ","On parle d’un dépassement lorsque deux véhicules, qui circulent dans le même sens de circulation, se dépassent sur la voie publique",'assets/depassement1.png'),
  Partie("2.	La réglé générale ","le code de la route indique que les dépassements s’effectuent généralement par la gauche, sauf dans les cas exceptionnels.",null),
  Partie("3.	Condition indispensable pour dépasser","Les dépassements sont autorisés seulement si toutes les conditions de                          sécurité sont réunies et optimales et que la signalisation ne l'interdit pas :\n•	Vous ne devez gêner aucun usager de la route ;\n•	Vous devez savoir où vous rabattre ;\n•	Le véhicule que vous souhaitez dépasser ne doit pas avoir d'obstacle devant lui (un cycliste par exemple) ;\n•	L’état de la chaussée doit être optimale (éviter par temps de pluie, neige et brouillard) ;\n•	Vous devez toujours avoir assez de visibilité ;\n•	Vous ne devez gêner personne derrière vous et devez vous assurer qu'aucun autre automobiliste ne soit dans l'angle mort ;\n•	Vous ne devez pas dépasser la vitesse maximale autorisée ;\n•	La différence de vitesse doit être d'au moins 20 km/h et la distance entre le moment où vous avez commencé le dépassement et l'avez fini de 250m.", 'assets/depassement2.png'),
  Partie("4.	Être dépasser","S'il vous arrive que l'on vous dépasse, vous devez :\n•	Garder la même allure et surtout ne pas accélérer (ralentir seulement pour faciliter le passage en cas d'urgence) ;\n•	Serrer à droite pour garder un espace latéral maximum ;\n•	Si la chaussée est mouillée, mettre les essuie-glaces en vitesse rapide dès que l'autre conducteur arrive à votre hauteur ;\n•	La nuit repasser en feux de croisement, dès que l'autre conducteur a allumé ses feux de route ;",null),
  Partie("5.	Dépassement interdit ","•	À la fin d'interdiction symbolisée avec ce panneau :",'assets/depassement3.jpg'),
  Partie("","•	Vous n'avez pas le droit au dépassement dans les intersections où vous devez céder le passage ;",'assets/depassement4.png'),
  Partie("","•	Tout dépassement est interdit aux traversées de voies ferrées sans barrières. Même le dépassement à deux roues y est interdit :",'assets/depassement5.png'),
  Partie("","•	A l'approche d'un passage piétons le dépassement est interdit si la visibilité ne vous permet pas de vous assurer qu'aucun piéton ne soit engagé ;\n•	Si vous approchez un virage (pour manque de visibilité) ;\n•	Si vous devez rouler plus vite que la vitesse autorisée, c'est interdit aussi \n•	Si un véhicule de service hivernal est en mission (gyrophares bleus allumés) :", 'assets/depassement6.jpg'),
  Partie("•	Signalisation interdisant le dépassement : ","Voici le récapitulatif des panneaux qui explicitement (n°1 et n°2) interdisent le dépassement ou de façon implicite (les autres) ", 'assets/depassement7.png'),
  Partie("","_Le panneau n°1 interdit le dépassement de tous les véhicules à moteur sauf les 2 roues ;\n_Le panneau n°2 interdit le dépassement des véhicules transportant des marchandises supérieures à 3,5 t ;\n_Le panneau n°3 et n°4 se réfèrent à un passage à niveau sans barrières où il est interdit de dépasser quelconque véhicule ;\n_Le panneau n°5 et n°6 par défaut vous obligent à vous arrêter, donc il est interdit de dépasser un autre véhicule ;\n_Le panneau n°7 vous oblige à céder la priorité à droite, donc vous n'avez pas le droit de dépasser un autre véhicule ;",null),
  Partie("•	La ligne continue ","ne permet pas d'être franchie ", "assets/depassement8.png"),
  Partie("•	La ligne de dissuasion ","comportant des pointillés serrés interdit le dépassement des véhicules à allure normale, mais permet le dépassement de véhicules lents à condition que la visibilité soit bonne.",'assets/depassement9.jpg'),
  Partie("6.	Le Dépassement par Droite ","En conditions normales, il est interdit d'effectuer les dépassements par la droite. En revanche, il est toutefois possible de dépasser un véhicule par la droite seulement dans 2 cas :\n   1.	Lorsque ce véhicule est un tramway (exemple 1) ;\n   2.	Lorsque la voiture qui est sur votre gauche tourne à gauche (exemple 2).",'assets/depassement10.PNG'),
  Partie("7.	Le dépassement difficile","Même si en théorie, il est possible de dépasser un autre véhicule en toutes circonstances, certaines conditions de circulation peuvent rendre le dépassement difficile, voire même dangereux. Par exemple sur des routes de campagne qui contiennent de nombreux virages, ou lorsque le marquage au sol contient des lignes discontinues, il est conseillé de s’abstenir de doubler. Il en est de même sur un parcours où les côtes à monter sont importantes et gênent la visibilité. Enfin, si les conditions climatiques sont mauvaises, il est conseillé aux usagers de prendre leur mal en patience plutôt que de glisser ou de se déporter accidentellement sur une autre voie.",'assets/depassement11.jpg')
];


Lecon croisement = new Lecon("Croisement",croisement_parties,null);
Lecon depassement= new Lecon("Dépassement",depassement_parties,null);

Themee croisement_depassement= Themee("Croisement et dépassement",Niveau.EXPERT,
{croisement:[],
 depassement:[],
}
);

//___________________________ thème priorité_________________________________

List<Partie> panneaux_priorite_parties_detailles= [
  Partie("Panneau Stop","A ce panneau vous êtes obligés de vous arrêter sans dépasser la ligne blanche continue qui fait office de la limite de la chaussée. Le panneau et la ligne fonctionnent ensemble.",'assets/panneauPD1.png'),
  Partie("Cas Particulier ","Quant à l'arrêt obligatoire, vous verrez un Cédez le passage complété par un panonceau comme c'est le cas sur la 2eme photo.\nLe panonceau Stop 150 m vous demande de vous arrêter à l'intersection qui est à 150 m de vous.",'assets/panneauPD2.PNG'),
  Partie("Panneau Cédez Le Passage","Vous n'êtes pas obligés de marquer un arrêt total à ce panneau, sauf si un panonceau vous le précise.\nCédez le passage fonctionne avec le marquage au sol où les lignes sont discontinues.",'assets/panneauPD3.png'),
  Partie("Cas Particuliers","La lecture du premier panneau est toute simple et vous la connaissez : Cédez le passage à l'intersection que vous rencontrerez.\nLa lecture du deuxième est la suivante : Cédez le passage à l'intersection que vous rencontrerez dans 150 m.", 'assets/panneauPD4.PNG'),
  Partie("Panneau de signalisation de carrefour à sens giratoire","Ce panneau impose aux automobilistes céder le passage aux véhicules circulant sur l’anneau et venant de gauche. L’arrêt n’est pas obligatoire, engagez-vous si personne n’est présent dans le giratoire.",'assets/panneauPD5.png'),
  Partie("Panneaux relatifs à la priorité","- Panneau 1 :  Intersection où le conducteur est tenu de céder le passage aux véhicules débouchant de la ou des routes situées à sa droite.\n\n- Panneaux 2 & 3 : Lorsque vous roulez sur une route et voyez ce panneau, cela veut dire que vous êtes sur une route prioritaire. Le même panneau rayé met fin au caractère prioritaire de la route sur laquelle vous roulez.\n\n- Panneau 4 : A la prochaine intersection les autres usagers doivent vous céder le passage. Il s'agit d'une priorité ponctuelle et elle vous concerne seulement si vous allez tout droit.",'assets/panneauPD7.jpg'),
];
Lecon intersections= new Lecon("Intersections",null,null);
Lecon panneaux_priorite_detaile= new Lecon("Panneaux de priorité",panneaux_priorite_parties_detailles,null);

Themee priorite= Themee("Priorité",Niveau.EXPERT,
{
  intersections:[],
  panneaux_priorite_detaile:[],
});
