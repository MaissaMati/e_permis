import '../back_end/export_all.dart';
import '../scénarisation/export_all.dart';

  Test_Niveau testDebutant_catego = new Test_Niveau(Niveau.DEBUTANT, Niveau.INTERMIDIAIRE, 
  [
    danger_questions[0],
    danger_questions[7],
    obligation_questions[1],
    obligation_questions[5],
    interdiction_questions[3],
    interdiction_questions[5],
    indication_direction_questions[6],
    indication_direction_questions[2],
    circulation_questions[4],
    circulation_questions[8],
  ]);

  Test_Niveau testIntermd_catego = new Test_Niveau(Niveau.INTERMIDIAIRE, Niveau.EXPERT,
  [
    vitesse_distance_questions[0],
    vitesse_distance_questions[1],
    vitesse_distance_questions[3],
    circuler_questions[4],
    circuler_questions[5],
    arreter_stationner_questions[0],
    arreter_stationner_questions[1],
    arreter_stationner_questions[6],
    stationner_reglementation_questions[2],
    stationner_reglementation_questions[3],
  ]);

  List<Test_Niveau> testcategorisation = [testDebutant_catego,testIntermd_catego];
  