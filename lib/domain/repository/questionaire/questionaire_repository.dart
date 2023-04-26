import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';

import '../../../base/result_entity.dart';

abstract class QuestionaireRepository {
  Future<ResultEntity> submitQuestionaire(QuestionaireRequest request);
}
