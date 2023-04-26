import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/unit_udd/unit_udd_data.dart';

import '../../../base/result_entity.dart';

abstract class UnitUddRepository {
  Future<ResultEntity<List<UnitUddData>>> fetchUnitUdd(
      AuthenticationHeadersRequest header);
}
