import 'dart:ffi';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'bd.g.dart';


class Apprenants extends Table{
  IntColumn get id_app => integer().autoIncrement()(); 
  IntColumn get id_hihtorique=>integer().nullable()();
  IntColumn get id_evaluation=>integer().nullable()();
  TextColumn get nom => text()();
  TextColumn get email => text()();
  TextColumn get mot_de_passe => text()(); 
  
}
class Evaluations extends Table {
   IntColumn get  id_eva => integer()();
   TextColumn get enonce => text()();
   TextColumn get coure => text()();
   BoolColumn get repanse => boolean()();
   TextColumn get couriger =>text()();
   IntColumn get note => integer()();
   @override

   Set <Column> get primarykey =>{id_eva};
}

class Historiques extends Table{
     IntColumn get id_his => integer()();
     TextColumn get niveau => text()();
     TextColumn get them => text()();
     TextColumn  get coure => text()();

     Set <Column> get primaryKey =>{id_his};

     }



class  ApprenentwithTrace {
  final  Apprenant  apprenent;
  final  List< Evaluation> evaluation;
  final List<Historique>   historique;

  ApprenentwithTrace({this.apprenent, this.evaluation,this.historique});


}



 

@UseMoor(tables: [ Apprenants,Evaluations,Historiques])

class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  
  @override
  int get schemaVersion => 1;

 





 


///////////////////////Apprenent///////////////////
 Future<List<Apprenant>> getAllApprenent() => select(apprenants).get();
Stream<List<Apprenant>> watchAllApprenent() => select(apprenants).watch();
Future insertApprenent(Apprenant apprenent) => into(apprenants).insert(apprenent);
Future deleteApprenent(Apprenant apprenent ) => delete(apprenants).delete(apprenent);
Future updateApprenent(Apprenant apprenent)=> update(apprenants).replace(apprenent);
Future < Apprenant >   getApprenent(int id){
 return (select(apprenants)
      
        ..where((t) => t._id_app.equals(id)))
      .getSingle();
}

 Future<List<Evaluation>> getAllquestions() => select(evaluations).get();
  Stream <List<Evaluation>> watchAllquestions() => select(evaluations).watch();
  Future insertquestion(Evaluation q) => into(evaluations).insert(q);
  Future updatequestion(Evaluation q) => update(evaluations).replace(q);
  Future deletequestion(Evaluation q) => delete(evaluations).delete(q);
  Future<Evaluation> getquestion(int id){
  return (select(evaluations)
      
        ..where((t) => t._id_eva.equals(id)))
      .getSingle();
} 
Future <List<Evaluation>> getAllcorrectquestion( int id ){
  return (select(evaluations)
       ..where((t) => t._id_eva.equals(id))
       ..where((t) => t.repanse.equals(true))

  
  ).get();


}



Future<List<Historique>> getAllTraces() => select(historiques).get();
  Stream<List<Historique>> watchAllTraces() => select(historiques).watch();
  Future insertTrace(Historique t) => into(historiques).insert(t);
  Future deletetrace(Historique t) => delete(historiques).delete(t);
   Future <List<Historique>> gettrace(int id){
     return (select(historiques)
      
        ..where((t) => t._id_his.equals(id)))
      .get();
}
 Future <List<Historique>> get_theme_cour(String theme,int id ){
     return (select(historiques)
         ..where((t) => t._id_his.equals(id))
        ..where((t) => t._them.equals(theme)))
      .get();
}
Future <List<Historique>> get_niveau_cour(String theme,int id){
     return (select(historiques)
        
         ..where((t) => t._id_his.equals(id))
        ..where((t) => t.niveau.equals(theme)))
      .get();
}



   // MigrationStrategy get migration => MigrationStrategy(
        // Runs if the database has already been opened on the device with a lower version
      //  onUpgrade: (migrator, from, to) async {
        //  if (from == 1) {
          //  await migrator.addColumn(apprenants, apprenants.id_evaluation);
            //await migrator.createTable(evaluations);
 

            
         // }
        //  if(from==2){

           // await migrator.addColumn(apprenants, apprenants.id_hihtorique);
           //await migrator.createTable(historiques);
 


         // }
          
       // },
       // beforeOpen: (db, details) async {
        //await db.customStatement('PRAGMA foreign_keys = ON');
     // },
     // );   


}
  
    


      
      

