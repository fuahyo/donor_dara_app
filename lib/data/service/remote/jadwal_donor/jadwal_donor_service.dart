import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

import '../../../../base/base_config.dart';

class JadwalDonorService {
  Client client = Client();

  Future<Response> fetchSchedule(
    AuthenticationHeadersRequest header,
    int unitId,
  ) async {
    final url = Uri.https(
      BaseConfig.baseDomain,
      BaseConfig.basePath + BaseConfig.fetchSceduleList + "/$unitId",
    );

    print("URL : ${url.toString()}");

    return client.get(url, headers: header.toHeader());
  }
}
