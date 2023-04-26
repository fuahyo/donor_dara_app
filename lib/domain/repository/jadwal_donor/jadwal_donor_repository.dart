import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_data.dart';

import '../../../base/result_entity.dart';

abstract class JadwalDonorRepository {
  Future<ResultEntity<ScheduleData>> fetchSchedule(
    AuthenticationHeadersRequest header,
    int unitId,
  );
}
