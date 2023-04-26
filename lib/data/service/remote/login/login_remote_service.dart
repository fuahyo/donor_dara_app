import 'package:donor_darah/domain/model/request/login/login_request.dart';
import 'package:http/http.dart';

import '../../../../base/base_config.dart';

class LoginRemoteService {
  Client client = Client();

  Future<Response> postLogin(LoginRequest request) async {
    final url = Uri.https(
        BaseConfig.baseDomain, BaseConfig.basePath + BaseConfig.fetchLogin);

    print("URL : ${url.toString()}");
    print('REQUEST : ${request.toJson()}');

    return client.post(url, body: request.toJson());
  }
}
