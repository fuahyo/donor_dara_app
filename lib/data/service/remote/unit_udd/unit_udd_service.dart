import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

import '../../../../base/base_config.dart';

class UnitUddService {
  Client client = Client();

  Future<Response> fetchUnitUdd(AuthenticationHeadersRequest header) async {
    final url = Uri.https(
        BaseConfig.baseDomain, BaseConfig.basePath + BaseConfig.fetchUnitUdd);

    print("URL : ${url.toString()}");

    return client.get(url, headers: header.toHeader());
  }
}
