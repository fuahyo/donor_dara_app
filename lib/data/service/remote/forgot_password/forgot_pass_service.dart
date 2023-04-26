import 'package:http/http.dart';

import '../../../../base/base_config.dart';

class ForgotPassService {
  Client client = Client();

  Future<Response> postForgotPass(String email) async {
    final url = Uri.https(BaseConfig.baseDomain,
        BaseConfig.basePath + BaseConfig.fetchForgotPass);
    ;

    print("URL : ${url.toString()}");
    print("URL : ${email}");

    return client.post(url, body: {
      "email": email,
    });
  }
}
