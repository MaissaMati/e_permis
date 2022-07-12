import 'dart:ffi';
//import 'package:flutter/cupertino.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import '../gestion_app.dart';
import '../gestion_lecon.dart';
import '../evaluation.dart';
part 'db.g.dart';


class Apprenants extends Table{
  IntColumn get id_app => integer().nullable()(); 
  TextColumn get nom => text()();
  TextColumn get email => text()();
  TextColumn get mot_de_passe => text()(); 
  TextColumn get nv => text().nullable()();
  Set <Column> get primarykey =>{email,mot_de_passe};
}
  
class Evaluations extends Table {

  
   IntColumn get  id_quest => integer().autoIncrement()();
   TextColumn get mail => text()();
   TextColumn get enonce => text()();
   TextColumn get coure => text()();
   BoolColumn get repanse => boolean()();
   TextColumn get couriger =>text()();
   IntColumn get note => integer()();
   @override

   Set <Column> get primarykey =>{id_quest};
}

    class Historiques extends Table{
     IntColumn get id_cours => integer().autoIncrement()();
     TextColumn get niveau => text()();
     TextColumn get mail => text()();
     TextColumn  get coure => text()();

     } 

   class Tests extends Table{
   IntColumn get id_test=>integer().autoIncrement()();
   TextColumn get mail => text()();
   TextColumn get niveau => text()();
   IntColumn get num_test=>integer().nullable()();
   IntColumn get not_test=>integer().nullable()();
    BoolColumn get decision => boolean()();
    }
    class Etapes extends Table{
      IntColumn get id_Nv=>integer().autoIncrement()();
   TextColumn get mail => text()();
   TextColumn get niveau => text()(); 
    }

    @UseMoor(tables: [Apprenants,Historiques,Evaluations,Tests,Etapes])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 2;
  MigrationStrategy get migration => MigrationStrategy(
        // Runs if the database has already been opened on the device with a lower version
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {
            
            await migrator.createTable(etapes);
          }
        },
      );



Future<List<Apprenant>> getAllApprenent() => select(apprenants).get();
Stream<List<Apprenant>> watchAllApprenent() => select(apprenants).watch();
Future insertApprenent(Apprenant apprenent) => into(apprenants).insert(apprenent);
Future deleteApprenent(Apprenant apprenent ) => delete(apprenants).delete(apprenent);
Future updateApprenent(Apprenant apprenent)=> update(apprenants).replace(apprenent);

 Future<List<Test>> getAlltest() => select(tests).get();

Future inserttest(Test t) => into(tests).insert(t);
Future deletetest(Test t ) => delete(tests).delete(t);
Future updatetest(Test t)=> update(tests).replace(t);
Future <List < Test> >  gettestapp(String id){
 return (select(tests)
      
        ..where((t) => t.mail.equals(id)))
      .get();
}





Future<List<Evaluation>> getAllquestions() => select(evaluations).get();
  
  Future insertquestion(Evaluation q) => into(evaluations).insert(q);
  Future updatequestion(Evaluation q) => update(evaluations).replace(q);
  Future deletequestion(Evaluation q) => delete(evaluations).delete(q);
  




Future<List<Historique>> getAllTraces() => select(historiques).get();
  
  Future insertTrace(Historique t) => into(historiques).insert(t);
  Future deletetrace(Historique t) => delete(historiques).delete(t);
   
    
Future<List<Etape>> getAllEtape() => select(etapes).get();
//Stream<List<Apprenant>> watchAllApprenent() => select(apprenants).watch();
Future insertEtape(Etape e) => into(etapes).insert(e);






}
