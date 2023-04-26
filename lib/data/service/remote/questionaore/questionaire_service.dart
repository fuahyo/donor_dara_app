import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';
import 'package:http/http.dart';

import '../../../../base/base_config.dart';

class QuestionaireService {
  Client client = Client();

  Future<Response> postQuestionaire(QuestionaireRequest request) async {
    print("Jawaban Service : ${request.toJson()}");
    final url = Uri.https(BaseConfig.baseDomain,
        BaseConfig.basePath + BaseConfig.fetchQuestioner);

    print("URL : ${url.toString()}");

    return client.post(url, body: request.toJson());
  }
}
